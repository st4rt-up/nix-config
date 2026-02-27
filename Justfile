default: build
test:
  git add . -N
  nh os test && notify-send "nix test" "Finished building. Configuration switched"
build:
  git add . -N
  nh os build --verbose --show-trace
switch:
  git add . -N
  nh os switch --ask --verbose
update:
  git add . -N
  ssh-add ~/.ssh/github-personal
  nh os build --update 
force-update:
  git add . -N
  nh os switch --ask --impure --no-net
