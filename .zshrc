# Path to your oh-my-zsh installation.
export ZSH=/Users/alexandernst/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases docker encode64 git git-extras git-flow share-history sudo)

# User configuration

source $ZSH/oh-my-zsh.sh

# Quick folder jumping (https://github.com/rupa/z)
. ./.z.sh

# Nano syntax highlighting
test -d "${HOME}/.nano" || wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh

# Show hidden files in autocomplete
compinit
_comp_options+=(globdots)

# Allow option stacking for short options
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# Ignore Ctrl + D (exit)
setopt ignoreeof

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# PHP development
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Python development
#export PATH="$(brew --prefix homebrew/core/python2)/bin:$PATH"
export PATH="$(brew --prefix homebrew/core/python3)/bin:$PATH"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Oh git...
alias gia='git add' #/path/to/file
alias giap='git add -p' #/path/to/file
alias gibd='git log --left-right --graph --cherry-pick --oneline' #master..featureXYZ
alias gibis='git bisect start'
alias gibib='git bisect bad' #(hash)
alias gibig='git bisect good' #(hash)
alias gibir='git bisect reset'
alias gibl='git branch --list'
alias gibrl='git branch -d'
gibrr() { git push origin :${1}; } #branch
alias gid='git diff'
alias gist='git status'
alias gic='git commit -m' #message
alias gica='git commit -am' #message
gicd() { git diff ${1}^1..${1}; } #hash
alias gich='git checkout'
alias gicp='git cherry-pick' #hash
alias gilg='git log --color --graph --pretty=format:"%Cred%H%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an>%Creset"'
alias giri='git rebase -i' #hash
alias gips='git push'
alias gipsf='git push --force'
alias gipl='git pull'
alias giplr='git pull --rebase'
alias gish='git stash'
alias gishl='git stash list'
alias gishp='git stash pop'
git_clone_with_key() { ssh-agent bash -c "ssh-add ${1}; git clone ${2}"; } #key_path git_url
git_delete_tag() { git tag -d ${1} && git push origin :refs/tags/${1}; } #tag
git_diff_commit() { git diff ${1}^ ${1}; } #commit hash
git_generate_patches() {
  git format-patch -n${1} ${2}
} #number_of_commits_to_include_from_hash hash
alias git_ignore_local_changes='git update-index --assume-unchanged'
alias git_unignore_local_changes='git update-index --no-assume-unchanged'
git_pull_with_key() { ssh-agent bash -c "ssh-add ${1}; git pull"; } #key_path
git_pull_rebase_with_key() { ssh-agent bash -c "ssh-add ${1}; git pull --rebase"; } #key_path
git_push_with_key() { ssh-agent bash -c "ssh-add ${1}; git push"; } #key_path
git_push_force_with_key() { ssh-agent bash -c "ssh-add ${1}; git push -f"; } #key_path
git_push_tags() { git push origin --tags; }
git_rename_tag() { git tag ${2} ${1} && git tag -d ${1} && git push origin :refs/tags/${1} && git push --tags; } #old_tag new_tag
git_rewrite_parent() {
  echo "${1} ${2}" > .git/info/grafts
  git filter-branch --tag-name-filter cat -- --all
} #hash_to_modify has_of_new_parent
git_undo_last_commit() { git reset --soft HEAD^ ; }

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
