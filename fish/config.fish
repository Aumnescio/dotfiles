set -U fish_greeting

#: Global variable exports

#: Editor
set -gx EDITOR neovide
set -gx MOAR '-colors=16M -style dracula -no-statusbar'
# set -gx PAGER /home/linuxbrew/.linuxbrew/bin/moar
set -gx MOST_INITFILE /home/aum/.config/most/most.rc
set -gx PAGER most

#: Path
#: Node version manager `fnm`:
# fish_add_path /home/aum/.fnm

#: Fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude ".git" --exclude node_modules --exclude ".ccls-cache" --exclude ".output"'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -gx FZF_ALT_C_COMMAND 'fd -H -t d'

#: Starship config location
set -gx STARSHIP_CONFIG '/home/aum/.config/starship/starship.toml'

if status is-interactive
    #: Commands to run in interactive sessions can go here

    fish_vi_key_bindings

    #: Abbreviations / Aliases:
    abbr --add --global rm 'rm -vi'
    abbr --add --global cp 'cp -vi'
    abbr --add --global mv 'mv -vi'
    abbr --add --global nv 'nvim'
    abbr --add --global nvs 'nvim (fzf)'
    abbr --add --global notes 'nvim /home/aum/Secondbrain/notes/temp-notes.md'
    abbr --add --global fehere 'feh -FYZ ./'
    abbr --add --global untar 'tar --extract --file'
    abbr --add --global cheat 'cht.sh --shell'
    abbr --add --global rodb 'rofi -show kb -modi kb:/home/aum/.config/rofi/custom-modes/rofi-kb-mode.bash'
    abbr --add --global aumusic 'ncmpcpp'
    abbr --add --global setkeyrepeatrate 'xset r rate 192 72'

    abbr --add --global siv 'sxiv -bft'
    abbr --add --global icat 'kitty +kitten icat'
    abbr --add --global fd 'fd --hidden'
    abbr --add --global rg 'rg -S'
    abbr --add --global xc 'xclip -sel clip'
    abbr --add --global atlascreate 'create-atlas.fish'
    abbr --add --global screenkey-drag 'screenkey --mouse --no-systray -p fixed -g $(slop -n -f "%g")'

    abbr --add --global kbl 'kb list'
    abbr --add --global kbe 'kb edit'
    abbr --add --global kba 'kb add --title'
    abbr --add --global kbv 'kb view'
    abbr --add --global kbd 'kb delete --id'
    abbr --add --global kbg 'kb grep -ivm'
    abbr --add --global kbt 'kb list --tags'
    abbr --add --global pdfout 'lualatex -output-directory=".output/"'

    abbr --add --global naut 'nautilus . & disown > /dev/null 2>&1'

    #: Timed shutdown script
    abbr --add --global aumshutdownsoon '/home/aum/Secondbrain/programming/scripts/aum-timed-shutdown/aumpoweroff.sh'

    #: NOTE: Requires the user to click the target window.
    abbr --add --global get_wm_class 'xprop | rg -S "wm_class" | choose 3 | tr -d "\""'

    #: For compiling single .cpp file.
    abbr --add --global cppcompile 'g++ -Wall -std=c++20 -o ./exe.out'
    abbr --add --global gradaum-bnr './gradlew build && printf "\nRunning Java program...\n\n" && java -jar ./build/libs/Main.jar'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-basic 'cmake -S ./src/ -B ./out/build/'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-init-cpp '/home/aum/Secondbrain/programming/scripts/aum-cmake-init-scripts/init.sh'

    #: Vim custom binds for fish shell command line interaction.
    #: On cli "bind --function-names" shows list of available commands.
    #: DocLink: "https://fishshell.com/docs/current/cmds/bind.html?highlight=keybindings"

    bind --mode default e forward-char
    bind --mode default q backward-char

    bind --mode default n forward-word
    bind --mode default o backward-word

    bind --mode default ss kill-whole-line
    bind --mode default s kill-selection

    bind --mode default u undo
    bind --mode default r redo

    bind --mode insert \cq backward-char
    bind --mode insert \ce forward-single-char

    bind --mode insert \ca beginning-of-line
    bind --mode insert \co end-of-line

    #: START -> 'exa': file listing functions / aliases.

    function l
        exa --header --long --all --classify --icons --group-directories-first $argv
    end

    function ll
        exa $argv
    end

    function ls
        exa --grid --all --classify --icons --group-directories-first $argv
    end

    function lt
        exa --tree --level=3 --header --long --classify --icons --group-directories-first $argv
    end

    #: END -> 'exa': file listing functions / aliases.

    function neo
        neovide --notabs --frame none $argv
    end

    function fplay
        set -l finds (fd --type file -e mp4 -e mov -e mkv --max-depth 3)

        if [ -z "$finds" ] 
            return 0
        end

        set -l fzf_selection (printf '%s\n' $finds | fzf)

        if [ -n "$fzf_selection" ]
            mpv --fs $fzf_selection
        else
            return 0
        end
    end

    function speedup
        ffmpeg -i $argv[1] -filter_complex "[0:v]setpts=0.64*PTS[v];[0:a]atempo=1.5625[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac $argv[2]
    end

    function zd
        set -l finds (fd --type directory --max-depth 3 --hidden)

        if [ -z "$finds" ]
            return 0
        end

        set -l fzf_selection (printf '%s\n' $finds | fzf)

        if [ -n "$fzf_selection" ]
            cd $fzf_selection && exa --grid --all --classify --icons
        else
            return 0
        end
    end

    function zl
        zi ; exa --grid --all --classify --icons
    end

    function reload_fish
        source ~/.config/fish/config.fish
    end

    # =============================================================================
    #: Init Starship prompt.

    starship init fish | source
end

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions -q __zoxide_cd_internal
    if builtin functions -q cd
        builtin functions -c cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

set __zoxide_z_prefix 'z!'

# Jump to a directory using only keywords.
function __zoxide_z
    set -l argc (count $argv)
    set -l completion_regex '^'(string escape --style=regex $__zoxide_z_prefix)'(.*)$'

    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if set -l result (string match --groups-only --regex $completion_regex $argv[-1])
        __zoxide_cd $result
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions for `z`.
function __zoxide_z_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        __fish_complete_directories "$tokens[2]" ''
    else if test (count $tokens) -eq (count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query --exclude (__zoxide_pwd) -i -- $query)
        and echo $__zoxide_z_prefix$result
        commandline --function repaint
    end
end

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

abbr --erase z &>/dev/null
complete --command z --erase
function z
    __zoxide_z $argv
end
complete --command z --no-files --arguments '(__zoxide_z_complete)'

abbr --erase zi &>/dev/null
complete --command zi --erase
function zi
    __zoxide_zi $argv
end

# =============================================================================
#: Cheat.sh fish completion. (Not sure if I should run this every time the shell starts.)
#: NOTE: It has been ran once interactively.

# complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'
