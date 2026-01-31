#!/usr/bin/env python3

import subprocess
import sys
import re
import os
import json
import time

RECORD_SEPARATOR = '\n'
BROWSER_APP_ID = 'firefox' 
FOCUS_TIMEOUT_MS = 1000 # 1 second total timeout
RETRY_INTERVAL_MS = 25  # 25 milliseconds interval

def get_tabs_for_rofi():
    """
    Runs 'bt list', processes the output, and prints it in rofi's custom markup format.
    """
    try:
        result = subprocess.run(
            ['bt', 'list'],
            capture_output=True,
            text=True,
            check=True
        )
        pipe_in = result.stdout
    except FileNotFoundError:
        print("Error: 'bt' command not found. Please ensure it is installed and in your PATH.", file=sys.stderr)
        return
    except subprocess.CalledProcessError as e:
        print(f"Error running 'bt list': {e.stderr}", file=sys.stderr)
        return
        
    sys.stdout.write(f'\0markup-rows\x1ftrue\n')
    for line in pipe_in.splitlines():
        parts = line.split('\t', 2)

        if len(parts) == 3:
            tab_id, title, url = parts

            url_match = re.search(r'https?://(?:www\.)?(.*)', url)
            display_url = url_match.group(1) if url_match else url

            title_clean = title.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;').replace('{', '(').replace('}', ')')
            display_url_clean = display_url.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;').replace('{', '(').replace('}', ')')
            
            display_text = f"{title_clean} <span foreground='#6B838E'>({display_url_clean})</span> <span foreground='#3B535E'>({{{tab_id}}})</span>"
            
            rofi_entry = f"{display_text}{RECORD_SEPARATOR}"

            sys.stdout.write(rofi_entry)
            
    sys.stdout.flush()
    
def find_con_id_by_title(tree, tab_title_to_find):
    """
    Recursively searches the Sway tree JSON structure for a container 
    matching the BROWSER_APP_ID and containing the tab title.
    Returns the container ID (con_id) or None.
    """
    
    app_id = tree.get('app_id')
    title = tree.get('window_properties', {}).get('title') or tree.get('name') # Fallback to name

    if app_id == BROWSER_APP_ID and title and tab_title_to_find in title:
        return tree.get('id')

    for node in tree.get('nodes', []):
        con_id = find_con_id_by_title(node, tab_title_to_find)
        if con_id is not None:
            return con_id

    for node in tree.get('floating_nodes', []):
        con_id = find_con_id_by_title(node, tab_title_to_find)
        if con_id is not None:
            return con_id
            
    return None
    
def sway_focus_window(tab_title):
    if not tab_title:
        print("Error: Empty tab title provided for Sway focus. Aborting focus attempt.", file=sys.stderr)
        return False
        
    try:
        result = subprocess.run(
            ['swaymsg', '-t', 'get_tree'],
            capture_output=True,
            text=True,
            check=True,
            timeout=2
        )
        tree = json.loads(result.stdout)

        con_id = find_con_id_by_title(tree, tab_title)
        
        if con_id is None:
            print(f"Warning: Did not find window matching '{BROWSER_APP_ID}' and title containing '{tab_title}'.", file=sys.stderr)
            return False
            
        focus_command = ['swaymsg', f"[con_id={con_id}]", 'focus']
        
        focus_result = subprocess.run(
            focus_command,
            capture_output=True,
            text=True,
            check=True,
            timeout=1
        )
        
        responses = json.loads(focus_result.stdout)
        return any(r.get('success', False) for r in responses)

    except (subprocess.CalledProcessError, json.JSONDecodeError, FileNotFoundError) as e:
        print(f"Error during Sway tree search or focus: {e}", file=sys.stderr)
        return False
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return False

def activate_tab(selection):
    """
    Takes the user's selection and activates it.
    """
    
    if selection:
        tab_id = selection.partition('{')[-1].rpartition('}')[0]
        if not tab_id:
            print(f"Could not find ID in {selection}")
            return
            
        try:
            subprocess.run(
                ['bt', 'activate', tab_id],
                check=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
        except subprocess.CalledProcessError as e:
            print(f"Error activating tab ID {tab_id}: {e}", file=sys.stderr)
        
        window_name = selection.split(" <span")[0]
        if not window_name:
            print(f"Could not find window title in {selection}")
            return
            
        retry_interval_s = RETRY_INTERVAL_MS / 1000.0
        max_attempts = FOCUS_TIMEOUT_MS // RETRY_INTERVAL_MS
        for attempt in range(max_attempts):
            if sway_focus_window(window_name):
                print(f"Sway focus succeeded after {attempt * RETRY_INTERVAL_MS}ms.", file=sys.stderr)
                return  # Success

            time.sleep(retry_interval_s)

        print(f"Error: Sway focus failed to find window with title '{window_name}' after {FOCUS_TIMEOUT_MS}ms.", file=sys.stderr)
    
    if tab_id:
        try:
            tab_id = selection.partition('{')[-1].rpartition('}')[0]
            if not tab_id:
                print(f"Could not find ID in {selection}")
                sys.exit(1)
            window_name = selection.split(" <span")[0]
            subprocess.run(
                ['bt', 'activate', tab_id],
                check=True,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
        except subprocess.CalledProcessError as e:
            print(f"Error activating tab ID {tab_id}: {e}", file=sys.stderr)

def main():
    """
    Main entry point for the rofi modi script.
    """
    if len(sys.argv) > 1:
        activate_tab(sys.argv[1])
    else:
        get_tabs_for_rofi()

if __name__ == "__main__":
    main()