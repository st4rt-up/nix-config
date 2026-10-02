@default: build

@check:
  git add . -N
  nix flake check ./ --no-build --keep-going --quiet 

@test:
  git add . -N
  nh os test 

@build:
  git add . -N
  nh os build --verbose --show-trace

@switch:
  git add . -N
  nh os switch --ask --verbose --elevation-strategy="none"
  notify-send "nix switch" "finished building, configuration switched\nconfig WILL apply on restart"

@update:
  git add . -N
  ssh-add ~/.ssh/github-personal
  nh os build --update 

@force-update:
  git add . -N
  nh os switch --ask --impure --no-net

@tmux:
  tmux new -As cfg
