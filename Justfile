default: build
test:
  git add . -N
  nh os test --verbose --show-trace
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
