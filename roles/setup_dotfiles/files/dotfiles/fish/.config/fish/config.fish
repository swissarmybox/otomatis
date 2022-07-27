# Default text editor
export EDITOR='vim'

# Proxy settings here if needed
export PROXY=http://some.proxy.com:80

function proxy_on
  export http_proxy=$PROXY
  export https_proxy=$PROXY
end

function proxy_off
  unset http_proxy=$PROXY
  unset https_proxy=$PROXY
end

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

alias cat="/opt/homebrew/bin/bat"
eval "$(/opt/homebrew/bin/brew shellenv)"
