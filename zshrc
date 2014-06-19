# Set up the prompt

# Sets up theming
#autoload -Uz promptinit
#promptinit
#prompt adam1 # adam1

autoload -U colors && colors
#source $HOME/.spectrum
source $HOME/.prompt
source $HOME/.zsh_aliases # Load configured aliases
source $HOME/Documents/Programming/coinbase/.shared_aliases
single_prompt

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/Users/pat/Documents/Programming/AWS-ElasticBeanstalk-CLI-2.5.1/eb/linux/python2.7:$PATH"

#env GEM_PATH=/Users/pat/.rvm/gems/ruby-2.0.0-p0:/Users/pat/.rvm/gems/ruby-2.0.0-p0@global:/Users/pat/.rvm/gems/ruby-2.0.0-p0:/Users/pat/.rvm/gems/ruby-2.0.0-p0@global GEM_HOME=/Users/pat/.rvm/gems/ruby-2.0.0-p0 /Users/pat/.rvm/rubies/ruby-2.0.0-p0/bin/ruby -d /Users/pat/.rvm/src/rubygems-2.0.3/setup.rb --verbose

export WOLFRAM_API_KEY='628TRR-9YL9EJE32V'

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export AWS_IAM_HOME='/Users/pat/Documents/Programming/IAMCli-1.5.0/'
export AWS_CREDENTIAL_FILE="${AWS_IAM_HOME}/aws-credentials"
export CLIENT_CONFIG_FILE="${AWS_IAM_HOME}/client-config"

export PATH="${AWS_IAM_HOME}/bin:$PATH"

function tab () {
  osascript 2>/dev/null <<EOF
tell application "iTerm"
        set current_terminal to current terminal
        tell current_terminal
          launch session "Default Session"
          set current_session to current session
          tell current_session
            write text "cd $PWD; clear; $*"
          end tell
        end tell
      end tell
EOF
#    tell application "iTerm"
#      tell the first terminal
#        launch session "Default"
#        tell the the current session
#          write text "cd $PWD; $*"
#        end tell
#     end tell
#   end tell
#  EOF
}

# Marks - http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
# Autocomplete for marks
function _completemarks {
  reply=($(ls $MARKPATH))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark
