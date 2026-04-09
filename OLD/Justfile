default: build

test:
  git add . -N
  nh os test && notify-send "nix test" "finished building, configuration switched\nconfig will not apply on restart"

build:
  git add . -N
  nh os build --verbose --show-trace

switch:
  git add . -N
  nh os switch --ask --verbose && notify-send "nix switch" "finished building, configuration switched\nconfig WILL apply on restart"

update:
  git add . -N
  ssh-add ~/.ssh/github-personal
  nh os build --update 

force-update:
  git add . -N
  nh os switch --ask --impure --no-net
commit:
