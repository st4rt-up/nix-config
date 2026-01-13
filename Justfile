default: build
test:
  nh os test --verbose --show-trace
build:
  nh os build --verbose --show-trace
switch:
  nh os switch --ask --verbose
update:
  ssh-add ~/.ssh/github-personal
  nh os build --update --ask --quiet 
