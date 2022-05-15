# Iportant Git aliases from the git zsh plugin

Those are just the ones I use.

I cannot remember all of them so I made a quick cheatsheet.


```bash

ga        = 'git add'
gaa       = 'git add --all'
gapa      = 'git add --patch'
gau       = 'git add --update'
gav       = 'git add --verbose'


gc        = 'git commit -v'
gca       = 'git commit -v -a'
gcam      = 'git commit -a -m'
gcmsg     = 'git commit -m'
gc!       = 'git commit -v --amend'
gca!      = 'git commit -v -a --amend'
gcan!     = 'git commit -v -a --no-edit --amend'
gcn!      = 'git commit -v --no-edit --amend'


grs       = 'git restore'
grst      = 'git restore --staged'


gsb       = 'git status -sb'
gss       = 'git status -s'
gst       = 'git status'


gb        = 'git branch'
gbD       = 'git branch -D'
gba       = 'git branch -a'
gbd       = 'git branch -d'
gbda      = 'git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
gbnm      = 'git branch --no-merged'
gbr       = 'git branch --remote'
ggsup     = 'git branch --set-upstream-to=origin/$(git_current_branch)'


gcb       = 'git checkout -b'
gco       = 'git checkout'


gsw       = 'git switch'
gswc      = 'git switch -c'



gbl       = 'git blame -b -w'


gp        = 'git push'
ggpush    = 'git push origin "$(git_current_branch)"'
gpsup     = 'git push --set-upstream origin $(git_current_branch)'
gpv       = 'git push -v'
gpf!      = 'git push --force'
gpd       = 'git push --dry-run'


gl        = 'git pull'
gpr       = 'git pull --rebase'
gup       = 'git pull --rebase'
gupv      = 'git pull --rebase -v'
gupa      = 'git pull --rebase --autostash'
gupav     = 'git pull --rebase --autostash -v'
ggpull    = 'git pull origin "$(git_current_branch)"'
glum      = 'git pull upstream $(git_main_branch)'


gr        = 'git remote'
gra       = 'git remote add'
grrm      = 'git remote remove'


gf        = 'git fetch'
gfa       = 'git fetch --all --prune --jobs=10'
gfo       = 'git fetch origin'


glg       = 'git log --stat'
glgg      = 'git log --graph'
glgga     = 'git log --graph --decorate --all'
glgm      = 'git log --graph --max-count=10'
glgp      = 'git log --stat -p'
glo       = 'git log --oneline --decorate'
glog      = 'git log --oneline --decorate --graph'
gloga     = 'git log --oneline --decorate --graph --all'
glod      = 'git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'
glods     = 'git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
glola     = 'git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'
glols     = 'git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --stat'


gcount    = 'git shortlog -sn'


gm        = 'git merge'
gma       = 'git merge --abort'
gmom      = 'git merge origin/$(git_main_branch)'


grb       = 'git rebase'


gstp      = 'git stash pop'
gsta      = 'git stash push'
gstall    = 'git stash --all'
gstc      = 'git stash clear'
gstd      = 'git stash drop'
gstl      = 'git stash list'


gmtl      = 'git mergetool --no-prompt'
gmtlvim   = 'git mergetool --no-prompt --tool=vimdiff'


gbss      = 'git bisect start'
gbsg      = 'git bisect good'
gbsb      = 'git bisect bad'
gbs       = 'git bisect'
gbsr      = 'git bisect reset'


gsh       = 'git show'
gsts      = 'git stash show --text'
gsps      = 'git show --pretty=short --show-signature'


gcf       = 'git config --list'


gcl       = 'git clone --recurse-submodules'


gclean    = 'git clean -id'


gd        = 'git diff'
gds       = 'git diff --staged'
gdup      = 'git diff @{upstream}'
gdw       = 'git diff --word-diff'


gdct      = 'git describe --tags $(git rev-list --tags --max-count=1)'


gfg       = 'git ls-files | grep'
gignored  = 'git ls-files -v | grep "^[[:lower:]]"'


grm       = 'git rm'
grmc      = 'git rm --cached'


gpristine = 'git reset --hard && git clean -dffx'
grh       = 'git reset'
grhh      = 'git reset --hard'
gru       = 'git reset --'


ghh       = 'git help'


gwch      = 'git whatchanged -p --abbrev-commit --pretty=medium'

gwip      = 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

```
