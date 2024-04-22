function go-download
  set go_version $argv[1]
  echo "Updating go version to: $go_version"
  /Users/rajil/go/bin/go install golang.org/dl/go$go_version@latest
  echo "Downloading go version: $go_version"
  go$go_version download
  echo -n "New version available at: $location"
  which go$go_version
  echo "Updating symlink to use new go version"
  ln -s -f /Users/rajil/go/bin/go$go_version /Users/rajil/go/bin/go
end
