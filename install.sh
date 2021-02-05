ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful plugins for Rails development with Sublime Text
plugins=(gitfast last-working-dir common-aliases sublime history-substring-search nvm)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed
export PATH="${HOME}/.rbenv/bin:${PATH}"
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (To manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Load nvm if installed (To manage your Node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# pyenv activate lewagon 2>/dev/null && echo "🐍 Loading 'lewagon' virtualenv"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Lucky Framework
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# PHP
export HOMEBREW_PREFIX="$(brew --prefix)"
export PATH="${HOMEBREW_PREFIX}/opt/php@7.3/bin:${PATH}"

# CD path
setopt auto_cd
cdpath=($HOME/code $HOME/code/clients $HOME/code/dev $HOME/code/lewagon $HOME/code/lightthefuse $HOME/code/playground $HOME/code/rodloboz $HOME/code/advicefront)

# Alias
alias hp='heroku accounts:set rodloboz'
alias hw='heroku accounts:set devolute'
alias fasttest='bundle exec rspec --tag ~type:system'
alias nobuildtest='BUILD=skip rspec --fail-fast'
alias dcu='rm -f tmp/pid/server.pid && docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose run app'

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
# Cake
export CAKEROOT=$HOME/.cake
export PATH=$PATH:$CAKEROOT/bin

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/ruifreitas/.config/yarn/global/node_modules/tabtab/.completions/slss.zsh
