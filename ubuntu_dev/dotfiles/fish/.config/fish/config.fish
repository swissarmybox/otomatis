# Prevent crash by Ctrl-S Ctrl-Q when this shell is being accessed by ssh
stty -ixon

# Use 256 color
export TERM='xterm-256color'

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
