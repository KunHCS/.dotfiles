
# download docker cli completion
mkdir -p ~/.zsh/completion/docker/
curl -fLo ~/.zsh/completion/docker/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# download docker-compose completion
mkdir -p ~/.zsh/completion/docker-compose/ 
curl -fLo ~/.zsh/completion/docker-compose/_docker-compose https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose

