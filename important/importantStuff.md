# Important Stuff

## Some things/commands I sometimes forget so I write them down here

### Mostly for me but but you can use it too if you want

### Random commands

#### Neotwork Manager

To start

```bash
sudo systemctl start NetworkManager
```

To connect

```bash
nmcli device wifi connect AP NAME password PASSWORD
```

#### Alsamixer

Unmute master

```bash
amixer sset Master unmute
```

Other useful stuff:

```bash
alsamixer
speaker-test -c2
```

#### XRandr

To see all monitors

```bash
xrandr
```

#### XProp

To see infos about window

```bash
xprop
```

#### XSet

To change rate of repeating letters

```bash
xset r rate [delay] [cycle]
```

#### XDoTool

For mousemovement in console (maybe useful for macros)

```bash
xdotool mousemove y x
xdotool click 1 # 1 left mouse button
xdotool key F5 # sends F5 key
```

#### Kmonad

To add extend layout

```bash
sudo kmonad ~/.config/colemak-extend-iso.kbd

```

#### Rofi

Remove entry from rofi

```bash
shift + delete
```

#### Convert

convert png to jpg

```bash
convert image.png image.jpg
```

#### Maim

For screenshots

```bash
maim
```

for crops to clipboard

```bash
maim -s | xclip -selection clipboard -t image/png
```

#### Spicetify

Edit spicetify theme and config shit

```bash
spicetify config current_theme THEME_NAME color_scheme COLOR_SCHEME; spicetify apply
spicetify apply
```

#### RSync

Sync command

```bash
rsync -auv
```

#### XInput

To list the available options

```bash
xinput --list-props
```

mostly just look up in `--help` or in my `startup.sh`

#### Pacman/Yay

autoremove in pacman

```bash
sudo pacman -Rcns $(pacman -Qdtq)
```

autoremove with yay

```bash
yay -Rcns $(yay -Qdtq)
```

#### C# Programming

For building sln projects
`xbuild` or
`msbuild` or
`mono`

Then run them with
`wine ./././`
or with `mono ././`

#### Tar

To compress use

```bash
tar -zcvf archive-name.tar.gz source-directory-name
```

to unpack use

```bash
tar -zxvf archive-name.tar.gz
```

difference is the c and the x (c for compress x for extract)

#### Bash

Convert all svgs in folder to pngs

```bash
for i in *.svg; do
inkscape -w 2500 -h 3500 $i -o $(basename $i .svg)$(echo ".png")
done;
```

Rname files in order

```bash
a=1
for i in *.jpg; do
  new=$(printf "%04d.jpg" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"let a=a+1
done
```

#### Grub

To customize:

```bash
sudo grub-customizer
```

#### Git Tutorial mostly for my friends

##### Basic shit

Repository clonen

```bash
git clone <URL>
```

Status anzeigeen

```bash
git status
```

git repo lokal erstellen

```bash
git init -b origin main
```

git repo mit github/lab verknüpfen

```bash
git remote add origin <URL>
```

Wichtigste drei

```bash
git add -u
git commit -m 'sinvoller text'
git push
```

##### Intermediate shit

Neueste informationen herunterladen verändert keine files
man sieht aber im git status dass man pullen kann

```bash
git fetch
```

Merged braches oder commits zusammen solange kein merge conflict bestheht

```bash
git merge
```

Neueste informationen herunterladen und mergen

```bash
git pull
```

Unstage file/remove it from git repo

```bash
git remove
```

Alias

```bash
git rm
```

Restore all addede files, cna also be used to get older version of git file

```bash
git restore
```

rename a file in git

```bash
git mv
```

Show differences between commits/files

```bash
git diff
```

Letze commits anzeigen

```bash
git log
```

advanced shit:
branches anzeigen

```bash
git branch
```

branch erstellend und wechseln

```bash
git checkout
```

wie merge aber halt einfach force also ohne merge -> ersetzt

```bash
git rebase
```

#### Bluetooth

```bash
bluetoothctl 
scan on
devices
pair MAC_ADRESS
connect MAC_ADRESS
```

#### Java

How to run IntelliJ project from Command Line
go to project folder
go to /out/production/
run com.myexample.test.myfile

##### Gradle

to create

```bash
gradle init
```

to build

```bash
gradle build
```

to run

add `mainClassName = project.findProperty("mainClass").toString()` to build.gradle

```bash
./gradlew run
```

to run with input
add

```java
run {
    standardInput = System.in
}
```

to build.gradle
and run with `gradle -q --console plain run TASKNAME`

#### VIM Cheatsheet

Debugger shortcuts [Vim GDB](https://github.com/sakhnik/nvim-gdb)
or :help nvimgdb

Next/Prev result in autocompletion
Ctrl+N/Ctrl+P

Execute Python file with input in vim:
:term python3 %

Execute Python without input in vim:
:python %

To compile a file in vim (e.g. c++)
:make %:r (% to refer to the name, :r to strip of the ending of the filename)

to run it inside of vim
:!./%:r

##### Folds in vim

set foldmethod=syntax
set foldmethod=indent
zc to close a fold
zo to open one
za to toggle
for fold level 1
set foldnestmax=1
fold all 'zM'
fold level by level 'zm'
unfold all 'zR'
unfold level by level 'zr'

##### vim-surround

cs"' to replace " with '
ds ' to delete single quotes around
ysiw] to surround word (iw) with []

#### Doom Emacs Cheatsheet

SPC o n -> Neotree
SPC o t -> Terminal

#### Go

To create create structure in ~/code/go/src
e.g. ~/code/go/src/github.com/MrSpoony/test/test.go
then run `go install this_path`
then run the executable in the ~/code/go/bin folder
important go env:

```bash
GOPATH="/home/kimil/code/go"                # Important
GOBIN="/home/kimil/code/go/bin"             # Important
GOROOT="/usr/lib/go"                        # Very important but default value
GOENV="/home/kimil/.config/go/env"          # Idk don't think it's important
GOMODCACHE="/home/kimil/code/go/pkg/mod"    # Idk i guess rather less important
```

#### Gitlab Installation

[Instaalation Link](https://stackoverflow.com/questions/29403212/forwarding-to-gitlab-subdomain-with-existing-nginx-installation)

#### GDB

run to start/rerun program
`break` to set breakpoint
`layout next` for next layout
`refresh` of Ctrl-L if stuff is messed up
`stepin` or `si` for stepinto
`si 3` to stepinto 3 times
`next` or `n` for next
`print VARNAME` to print variable
`watch VARNAME` to watch variable (everytime it changes it printes it out)
`print VARNAME @10` to print first 10 elements of an array

with 7.0 gdb go back with reverse step or reverse-next
if Target child does not support this command error
run `target record` after running `run`

don't set breakpoint let it segfault
then run `backtrace full` to see which functions have been called in one command

##### NASM

compile with `nasm -felf file.asm -o file.o`
link with `ld file.o -o file -m elf_x86_64`
debug with `gdb ./file`
run `break _start` to set a breakpoint at the start
run `layout asm` and `layout regs` to layout those

to see `variable` run `x/5cd &<VARNAME>` to see it
to see value stored at pointer 0xSOMETHING run `x/s 0x<SOMEPTR>`

##### G++

compile with `-g` flag
run gdb a.out or whatever file was after `-o` flag
