export PATH="$HOME/.pyenv/shims:$PATH"

export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

#Android SDK
export PATH=$PATH:/Users/masahiromatsui/Library/Android/sdk/platform-tools
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools
NDK_ROOT=$ANDROID_HOME/ndk
export NDK_ROOT

path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

#eval "$(pyenv init -)"
#eval $(/usr/libexec/path_helper -s)
export PATH="$HOME/.rbenv/bin:$PATH"

# Tex path
export PATH="/usr/local/texlive/2017/bin/x86_64-darwin:$PATH"

test -r ~/.bashrc && . ~/.bashrc

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

export PATH="$HOME/go_appengine:$PATH"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Applications/Cocos/Cocos2d-x
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

export PATH="${HOME}/.cargo/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="$PATH:/Users/masahiromatsui/Downloads/nbc-1.2.1.r4.osx 2/NXT/"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

## export PATH=/Users/masahiromatsui/.cargo/bin:/Applications/Cocos/Cocos3d-x/cocos2d-x-3.10/templates:/Applications/Cocos/Cocos2d-x:/Applications/Cocos/Cocos2d-x/cocos2d-x-3.10/tools/cocos2d-console/bin:/Users/masahiromatsui/go_appengine:/Users/masahiromatsui/google-cloud-sdk/bin:/usr/local/texlive/2017/bin/x86_64-darwin:/Users/masahiromatsui/.rbenv/bin:/Users/masahiromatsui/.pyenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/share/dotnet:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Xamarin:/Users/masahiromatsui/Desktop/nand2tetris/tools:~/Dropbox/infoScience/nand2tetris/tools
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/masahiromatsui/google-cloud-sdk/path.bash.inc' ]; then . '/Users/masahiromatsui/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/masahiromatsui/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/masahiromatsui/google-cloud-sdk/completion.bash.inc'; fi

eval "$(stack --bash-completion-script stack)"

export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
[[ -r /usr/local/etc/profile.d/bash_completion.sh ]] && . /usr/local/etc/profile.d/bash_completion.sh


