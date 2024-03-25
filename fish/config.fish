set fish_greeting

#: Global variable exports

#: Editor
set -gx EDITOR nvim
# set -gx MOAR '-colors=16M -style dracula -no-statusbar -no-linenumbers'
#: Looking for better pager.
set -gx PAGER less
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx BAT_PAGER "less -R"

#: Hope this is not gonna break anything. Testing because of Bevy issue.
#: It is telling me to do something like this.
set -gx PKG_CONFIG_PATH "/usr/lib/x86_64-linux-gnu/pkgconfig/"

#: `Pure` fish-prompt colors. Could customize these I suppose.
#:  - These seem to have been exported to the `~/.config/fish/fish_variables` file.
#: STATE: Fine
# set --universal pure_color_danger brred
# set --universal pure_color_dark 332244
# set --universal pure_color_info cyan
# set --universal pure_color_light white
# set --universal pure_color_mute red
# set --universal pure_color_normal normal
# set --universal pure_color_primary blue
# set --universal pure_color_success green
# set --universal pure_color_warning yellow

#: `LS_COLORS`
#:  - Created complete version using `set -Ux LS_COLORS`.
#:  - The settings can be overwritten by calling the `set -Ux LS_COLORS` command again.
# set -Ux LS_COLORS "ow=01;33:di=34:BLK=38;5;68:CAPABILITY=38;5;17:CHR=38;5;113;1:DIR=38;5;30:DOOR=38;5;127:EXEC=38;5;208;1:FIFO=38;5;126:FILE=0:LINK=target:MULTIHARDLINK=38;5;222;1:NORMAL=0:ORPHAN=48;5;196;38;5;232;1:OTHER_WRITABLE=38;5;220;1:SETGID=48;5;3;38;5;0:SETUID=38;5;220;1;3;100;1:SOCK=38;5;197:STICKY=38;5;86;48;5;234:STICKY_OTHER_WRITABLE=48;5;235;38;5;139;3:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:.txt=38;5;253:*README=38;5;220;1:*README.rst=38;5;220;1:*README.md=38;5;220;1:*LICENSE=38;5;220;1:*LICENSE.md=38;5;220;1:*COPYING=38;5;220;1:*INSTALL=38;5;220;1:*COPYRIGHT=38;5;220;1:*AUTHORS=38;5;220;1:*HISTORY=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*CONTRIBUTING=38;5;220;1:*CONTRIBUTING.md=38;5;220;1:*CHANGELOG=38;5;220;1:*CHANGELOG.md=38;5;220;1:*CODEOWNERS=38;5;220;1:*PATENTS=38;5;220;1:*VERSION=38;5;220;1:*NOTICE=38;5;220;1:*CHANGES=38;5;220;1:.log=38;5;190:.adoc=38;5;184:.asciidoc=38;5;184:.etx=38;5;184:.info=38;5;184:.markdown=38;5;184:.md=38;5;184:.mkd=38;5;184:.mdx=38;5;184:.nfo=38;5;184:.org=38;5;184:.norg=38;5;184:.pod=38;5;184:.rst=38;5;184:.tex=38;5;184:.textile=38;5;184:.bib=38;5;178:.json=38;5;178:.jsonc=38;5;178:.json5=38;5;178:.hjson=38;5;178:.jsonl=38;5;178:.jsonnet=38;5;178:.libsonnet=38;5;142:.ndjson=38;5;178:.msg=38;5;178:.pgn=38;5;178:.rss=38;5;178:.xml=38;5;178:.fxml=38;5;178:.toml=38;5;178:.yaml=38;5;178:.yml=38;5;178:.RData=38;5;178:.rdata=38;5;178:.xsd=38;5;178:.dtd=38;5;178:.sgml=38;5;178:.rng=38;5;178:.rnc=38;5;178:.accdb=38;5;60:.accde=38;5;60:.accdr=38;5;60:.accdt=38;5;60:.db=38;5;60:.fmp12=38;5;60:.fp7=38;5;60:.localstorage=38;5;60:.mdb=38;5;60:.mde=38;5;60:.sqlite=38;5;60:.typelib=38;5;60:.nc=38;5;60:.cbr=38;5;141:.cbz=38;5;141:.chm=38;5;141:.djvu=38;5;141:.pdf=38;5;141:.PDF=38;5;141:.mobi=38;5;141:.epub=38;5;141:.docm=38;5;111;4:.doc=38;5;111:.docx=38;5;111:.odb=38;5;111:.odt=38;5;111:.rtf=38;5;111:.pages=38;5;111:.odp=38;5;166:.pps=38;5;166:.ppt=38;5;166:.pptx=38;5;166:.ppts=38;5;166:.pptxm=38;5;166;4:.pptsm=38;5;166;4:.prisma=38;5;222:.csv=38;5;78:.tsv=38;5;78:.numbers=38;5;112:.ods=38;5;112:.xla=38;5;76:.xls=38;5;112:.xlsx=38;5;112:.xlsxm=38;5;112;4:.xltm=38;5;73;4:.xltx=38;5;73:.key=38;5;166:*config=1:*cfg=1:*conf=1:*rc=1:*authorized_keys=1:*known_hosts=1:.ini=1:.plist=1:.profile=1:.bash_profile=1:.bash_login=1:.bash_logout=1:.zshenv=1:.zprofile=1:.zlogin=1:.zlogout=1:.viminfo=1:.pcf=1:.psf=1:.hidden-color-scheme=1:.hidden-tmTheme=1:.last-run=1:.merged-ca-bundle=1:.sublime-build=1:.sublime-commands=1:.sublime-keymap=1:.sublime-settings=1:.sublime-snippet=1:.sublime-project=1:.sublime-workspace=1:.tmTheme=1:.user-ca-bundle=1:.rstheme=1:.epf=1:.git=38;5;197:.github=38;5;197:.gitignore=38;5;240:.gitattributes=38;5;240:.gitmodules=38;5;240:.awk=38;5;172:.bash=38;5;172:.bat=38;5;172:.BAT=38;5;172:.sed=38;5;172:.sh=38;5;172:.zsh=38;5;172:.fish=38;5;172:.vim=38;5;172:.kak=38;5;172:.ahk=38;5;41:.py=38;5;41:.ipynb=38;5;41:.xsh=38;5;41:.rb=38;5;41:.gemspec=38;5;41:.pl=38;5;208:.PL=38;5;160:.pm=38;5;203:.t=38;5;114:.msql=38;5;222:.mysql=38;5;222:.prql=38;5;222:.pgsql=38;5;222:.sql=38;5;222:.tcl=38;5;64;1:.r=38;5;49:.R=38;5;49:.gs=38;5;81:.clj=38;5;41:.cljs=38;5;41:.cljc=38;5;41:.cljw=38;5;41:.scala=38;5;41:.sc=38;5;41:.dart=38;5;51:.asm=38;5;81:.cl=38;5;81:.ml=38;5;81:.lisp=38;5;81:.rkt=38;5;81:.el=38;5;81:.elc=38;5;241:.eln=38;5;241:.lua=38;5;81:.moon=38;5;81:.c=38;5;81:.C=38;5;81:.h=38;5;110:.H=38;5;110:.tcc=38;5;110:.c++=38;5;81:.h++=38;5;110:.hpp=38;5;110:.hxx=38;5;110:.ii=38;5;110:.M=38;5;110:.m=38;5;110:.cc=38;5;81:.cs=38;5;81:.cp=38;5;81:.cpp=38;5;81:.cxx=38;5;81:.cr=38;5;81:.go=38;5;81:.f=38;5;81:.F=38;5;81:.for=38;5;81:.ftn=38;5;81:.f90=38;5;81:.F90=38;5;81:.f95=38;5;81:.F95=38;5;81:.f03=38;5;81:.F03=38;5;81:.f08=38;5;81:.F08=38;5;81:.nim=38;5;81:.nimble=38;5;81:.s=38;5;110:.S=38;5;110:.rs=38;5;81:.scpt=38;5;219:.swift=38;5;219:.sx=38;5;81:.vala=38;5;81:.vapi=38;5;81:.hi=38;5;110:.hs=38;5;81:.lhs=38;5;81:.agda=38;5;81:.lagda=38;5;81:.lagda.tex=38;5;81:.lagda.rst=38;5;81:.lagda.md=38;5;81:.agdai=38;5;110:.zig=38;5;81:.v=38;5;81:.pyc=38;5;240:.tf=38;5;168:.tfstate=38;5;168:.tfvars=38;5;168:.http=38;5;90;1:.eml=38;5;90;1:.css=38;5;105;1:.less=38;5;105;1:.sass=38;5;105;1:.scss=38;5;105;1:.htm=38;5;125;1:.html=38;5;125;1:.jhtm=38;5;125;1:.mht=38;5;125;1:.mustache=38;5;135;1:.ejs=38;5;135;1:.pug=38;5;135;1:.svelte=38;5;135;1:.vue=38;5;135;1:.astro=38;5;135;1:.js=38;5;074;1:.jsx=38;5;074;1:.ts=38;5;074;1:.tsx=38;5;074;1:.mjs=38;5;074;1:.cjs=38;5;074;1:.coffee=38;5;079;1:.java=38;5;079;1:.jsm=38;5;079;1:.jsp=38;5;079;1:.php=38;5;81:.ctp=38;5;81:.twig=38;5;81:.vb=38;5;81:.vba=38;5;81:.vbs=38;5;81:*Containerfile=38;5;155:.containerignore=38;5;240:*Dockerfile=38;5;155:.dockerignore=38;5;240:*Makefile=38;5;155:*MANIFEST=38;5;243:*pm_to_blib=38;5;240:.nix=38;5;155:.dhall=38;5;178:.rake=38;5;155:.am=38;5;242:.in=38;5;242:.hin=38;5;242:.scan=38;5;242:.m4=38;5;242:.old=38;5;242:.out=38;5;242:.SKIP=38;5;244:.diff=48;5;197;38;5;232:.patch=48;5;197;38;5;232;1:.bmp=38;5;97:.dicom=38;5;97:.tiff=38;5;97:.tif=38;5;97:.TIFF=38;5;97:.cdr=38;5;97:.flif=38;5;97:.gif=38;5;97:.icns=38;5;97:.ico=38;5;97:.jpeg=38;5;97:.JPG=38;5;97:.jpg=38;5;97:.jxl=38;5;97:.nth=38;5;97:.png=38;5;97:.psd=38;5;97:.pxd=38;5;97:.pxm=38;5;97:.xpm=38;5;97:.webp=38;5;97:.ai=38;5;99:.eps=38;5;99:.epsf=38;5;99:.drw=38;5;99:.ps=38;5;99:.svg=38;5;99:.avi=38;5;114:.divx=38;5;114:.IFO=38;5;114:.m2v=38;5;114:.m4v=38;5;114:.mkv=38;5;114:.MOV=38;5;114:.mov=38;5;114:.mp4=38;5;114:.mpeg=38;5;114:.mpg=38;5;114:.ogm=38;5;114:.rmvb=38;5;114:.sample=38;5;114:.wmv=38;5;114:.3g2=38;5;115:.3gp=38;5;115:.gp3=38;5;115:.webm=38;5;115:.gp4=38;5;115:.asf=38;5;115:.flv=38;5;115:.ogv=38;5;115:.f4v=38;5;115:.VOB=38;5;115;1:.vob=38;5;115;1:.ass=38;5;117:.srt=38;5;117:.ssa=38;5;117:.sub=38;5;117:.sup=38;5;117:.vtt=38;5;117:.3ga=38;5;137;1:.S3M=38;5;137;1:.aac=38;5;137;1:.amr=38;5;137;1:.au=38;5;137;1:.caf=38;5;137;1:.dat=38;5;137;1:.dts=38;5;137;1:.fcm=38;5;137;1:.m4a=38;5;137;1:.mod=38;5;137;1:.mp3=38;5;137;1:.mp4a=38;5;137;1:.oga=38;5;137;1:.ogg=38;5;137;1:.opus=38;5;137;1:.s3m=38;5;137;1:.sid=38;5;137;1:.wma=38;5;137;1:.ape=38;5;136;1:.aiff=38;5;136;1:.cda=38;5;136;1:.flac=38;5;136;1:.alac=38;5;136;1:.mid=38;5;136;1:.midi=38;5;136;1:.pcm=38;5;136;1:.wav=38;5;136;1:.wv=38;5;136;1:.wvc=38;5;136;1:.afm=38;5;66:.fon=38;5;66:.fnt=38;5;66:.pfb=38;5;66:.pfm=38;5;66:.ttf=38;5;66:.otf=38;5;66:.woff=38;5;66:.woff2=38;5;66:.PFA=38;5;66:.pfa=38;5;66:*.7z=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.br=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;40:*.tbz=38;5;40:*.tgz=38;5;40:*.warc=38;5;40:*.WARC=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:.apk=38;5;215:.ipa=38;5;215:.deb=38;5;215:.rpm=38;5;215:.jad=38;5;215:.jar=38;5;215:.ear=38;5;215:.war=38;5;215:.cab=38;5;215:.pak=38;5;215:.pk3=38;5;215:.vdf=38;5;215:.vpk=38;5;215:.bsp=38;5;215:.dmg=38;5;215:.crx=38;5;215:.xpi=38;5;215:.iso=38;5;124:.img=38;5;124:.bin=38;5;124:.nrg=38;5;124:.qcow=38;5;124:.fvd=38;5;124:.sparseimage=38;5;124:.toast=38;5;124:.vcd=38;5;124:.vdi=38;5;124:.vhd=38;5;124:.vhdx=38;5;124:.vfd=38;5;124:.vmdk=38;5;124:.swp=38;5;244:.swo=38;5;244:.tmp=38;5;244:.sassc=38;5;244:.pacnew=38;5;33:.un~=38;5;241:.orig=38;5;241:.BUP=38;5;241:.bak=38;5;241:.o=38;5;241:*core=38;5;241:.mdump=38;5;241:.rlib=38;5;241:.dll=38;5;241:.aria2=38;5;241:.dump=38;5;241:.stackdump=38;5;241:.zcompdump=38;5;241:.zwc=38;5;241:.part=38;5;239:.r[0-9]{0,2}=38;5;239:.zx[0-9]{0,2}=38;5;239:.z[0-9]{0,2}=38;5;239:.pid=38;5;248:.state=38;5;248:*lockfile=38;5;248:*lock=38;5;248:.err=38;5;160;1:.error=38;5;160;1:.stderr=38;5;160;1:.pcap=38;5;29:.cap=38;5;29:.dmp=38;5;29:.allow=38;5;112:.deny=38;5;196:.service=38;5;45:*@.service=38;5;45:.socket=38;5;45:.swap=38;5;45:.device=38;5;45:.mount=38;5;45:.automount=38;5;45:.target=38;5;45:.path=38;5;45:.timer=38;5;45:.snapshot=38;5;45:.lnk=38;5;39:.application=38;5;116:.cue=38;5;116:.description=38;5;116:.directory=38;5;116:.m3u=38;5;116:.m3u8=38;5;116:.md5=38;5;116:.properties=38;5;116:.sfv=38;5;116:.theme=38;5;116:.torrent=38;5;116:.urlview=38;5;116:.webloc=38;5;116:.asc=38;5;192;3:.bfe=38;5;192;3:.enc=38;5;192;3:.gpg=38;5;192;3:.signature=38;5;192;3:.sig=38;5;192;3:.p12=38;5;192;3:.pem=38;5;192;3:.pgp=38;5;192;3:.p7s=38;5;192;3:*id_dsa=38;5;192;3:*id_rsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:.32x=38;5;213:.cdi=38;5;213:.fm2=38;5;213:.rom=38;5;213:.sav=38;5;213:.st=38;5;213:.a00=38;5;213:.a52=38;5;213:.A64=38;5;213:.a64=38;5;213:.a78=38;5;213:.adf=38;5;213:.atr=38;5;213:.gb=38;5;213:.gba=38;5;213:.gbc=38;5;213:.gel=38;5;213:.gg=38;5;213:.ggl=38;5;213:.ipk=38;5;213:.j64=38;5;213:.nds=38;5;213:.nes=38;5;213:.sms=38;5;213:.8xp=38;5;121:.8eu=38;5;121:.82p=38;5;121:.83p=38;5;121:.8xe=38;5;121:.stl=38;5;216:.dwg=38;5;216:.ply=38;5;216:.wrl=38;5;216:.vert=38;5;136:.comp=38;5;136:.frag=38;5;136:.spv=38;5;217:.wgsl=38;5;97:.xib=38;5;208:.iml=38;5;166:.DS_Store=38;5;239:.localized=38;5;239:.CFUserTextEncoding=38;5;239:*CodeResources=38;5;239:*PkgInfo=38;5;239:.nib=38;5;57:.car=38;5;57:.dylib=38;5;241:.entitlements=1:.pbxproj=1:.strings=1:.storyboard=38;5;196:.xcconfig=1:.xcsettings=1:.xcuserstate=1:.xcworkspacedata=1:.pot=38;5;7:.pcb=38;5;7:.mm=38;5;7:.gbr=38;5;7:.scm=38;5;7:.xcf=38;5;7:.spl=38;5;7:.Rproj=38;5;11:.sis=38;5;7:.1p=38;5;7:.3p=38;5;7:.cnc=38;5;7:.def=38;5;7:.ex=38;5;7:.example=38;5;7:.feature=38;5;7:.ger=38;5;7:.ics=38;5;7:.map=38;5;7:.mf=38;5;7:.mfasl=38;5;7:.mi=38;5;7:.mtx=38;5;7:.pc=38;5;7:.pi=38;5;7:.plt=38;5;7:.rdf=38;5;7:.ru=38;5;7:.sch=38;5;7:.sty=38;5;7:.sug=38;5;7:.tdy=38;5;7:.tfm=38;5;7:.tfnt=38;5;7:.tg=38;5;7:.vcard=38;5;7:.vcf=38;5;7:.xln=38;5;7"

#: Path
#: Node version manager `fnm`:
#: - Running this once is enough.
# fish_add_path /home/aum/.fnm

#: Bun
#: - Running this once was not enough, for some reason.
fish_add_path /home/aum/.bun/bin

#: Go/Golang
fish_add_path /home/aum/.go/bin

#: `fzf` defaults configuration.
set -gx FZF_DEFAULT_COMMAND 'fd --type f --follow --exclude ".git" --exclude node_modules --exclude ".ccls-cache" --exclude ".output"'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -gx FZF_ALT_C_COMMAND 'fd -H -t d'

#: Starship config location
# set -gx STARSHIP_CONFIG '/home/aum/.config/starship/starship.toml'

#: Matplotlib kitty backend
set -gx MPLBACKEND 'module://matplotlib-backend-kitty'
set -gx MPLBACKEND_KITTY_SIZING 'manual'

#: `cargo doc` (rustdoc) default theme.
set -gx RUSTDOCFLAGS '--default-theme=ayu'

if status is-interactive
    #: Commands to run in interactive sessions can go here

    # Async git prompt for `pure-fish/pure`:
    set -g async_prompt_functions _pure_prompt_git

    fish_vi_key_bindings

    #: Abbreviations / Aliases:
    abbr --add --global ls-real '/usr/bin/ls'
    abbr --add --global rm 'rm -vi'
    abbr --add --global rmrec 'rm -vIr'
    abbr --add --global cp 'cp -vi'
    abbr --add --global mv 'mv -vi'
    abbr --add --global md 'mkdir -p'
    abbr --add --global mkdir 'mkdir -p'
    abbr --add --global et 'erd'
    abbr --add --global ssh 'kitty +kitten ssh'

    abbr --add --global xcolor 'xcolor --format HEX | xclip -sel clip'

    # START - Navigating back to parent directories.
    abbr --add --global '...' '../..'
    abbr --add --global '....' '../../..'
    abbr --add --global '.....' '../../../..'
    abbr --add --global '......' '../../../../..'
    abbr --add --global '.......' '../../../../../..'
    # END - Navigating back to parent directories.

    # START - Code Editor (Mostly Neovim)
    abbr --add --global nv 'nvim'
    abbr --add --global nvmini 'NVIM_APPNAME=nvim_minimal nvim'
    abbr --add --global nvrepro 'NVIM_APPNAME=nvim_repro nvim'
    abbr --add --global nvs 'nvim ./(fzf)'
    abbr --add --global nds 'neovide ./(fzf)'
    abbr --add --global codi 'codium'
    abbr --add --global notes 'nvim /home/aum/Secondbrain/Vault/mind-tracking-fleeting-notes.norg'
    # END - Code Editor

    # NOTE: `untar` should work automatically for the various bzip and gzip versions too.
    abbr --add --global untar 'tar --extract --verbose --file'
    abbr --add --global untarbzip 'tar --extract --verbose --bzip2 --file'
    abbr --add --global untargzip 'tar --extract --verbose --gzip --file'

    #: This is some old thing. TODO: Test / Remove
    abbr --add --global rodb 'rofi -show kb -modi kb:/home/aum/.config/rofi/custom-modes/rofi-kb-mode.bash'

    #: Opening Music Player `ncmpcpp`
    abbr --add --global aumusic 'ncmpcpp'

    #: Screen Recording
    abbr --add --global aumrec 'aum-record-region'

    #: Setting keyboard repeat rate easily, because it tends to reset sometimes.
    abbr --add --global setkeyboardrepeatrate 'xset r rate 186 112'
    abbr --add --global fixkeyboardrepeatrate 'xset r rate 186 112'

    #: Hmm.
    abbr --add --global python 'python3'

    # - START - Image Viewing
    abbr --add --global siv 'nsxiv -bft'
    abbr --add --global fehere 'feh -FYZ ./'
    abbr --add --global icat 'kitty +kitten icat'
    # - END - Image Viewing

    #: `fd`, `rg` and `xclip` defaults
    # abbr --add --global fd 'fd --hidden'
    abbr --add --global rg 'rg -S'
    abbr --add --global xclip 'xclip -sel clip'

    #: For showing keypresses of screen.
    abbr --add --global screenkey-drag 'screenkey --mouse --no-systray -p fixed -g $(slop -n -f "%g")'

    #: START => Web Development
    #: |> browser-sync
    abbr --add --global browsync 'browser-sync start --config ./bs-config.js'
    #: END => Web Development

    #: TODO: Probably remove these and `kb`.
    abbr --add --global kbl 'kb list'
    abbr --add --global kbe 'kb edit'
    abbr --add --global kba 'kb add --title'
    abbr --add --global kbv 'kb view'
    abbr --add --global kbd 'kb delete --id'
    abbr --add --global kbg 'kb grep -ivm'
    abbr --add --global kbt 'kb list --tags'

    #: START => LaTeX
    #: Compiling a `.tex` LaTeX file using `lualatex`. (into `.output` dir)
    abbr --add --global pdfout 'lualatex -output-directory=".output/"'
    #: END => LaTeX

    #: Timed shutdown script
    abbr --add --global aumshutdownsoon '/home/aum/Secondbrain/programming/scripts/aum-timed-shutdown/aumpoweroff.sh'

    #: NOTE: Requires the user to click the target window.
    abbr --add --global get_wm_class 'xprop | rg -S "wm_class" | choose 3 | tr -d "\""'

    #: START => C / C++ / Java compilation
    #   - NOTE: These are dated.

    #: For compiling single .cpp file.
    abbr --add --global cppcompile 'g++ -Wall -std=c++20 -o ./exe.out'
    abbr --add --global gradaum-bnr './gradlew build && printf "\nRunning Java program...\n\n" && java -jar ./build/libs/Main.jar'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-basic 'cmake -S ./src/ -B ./out/build/'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-init-cpp '/home/aum/Secondbrain/programming/scripts/aum-cmake-init-scripts/init.sh'
    #: END => C / C++

    #: Vim custom binds for fish shell command line interaction.
    #: On cli "bind --function-names" shows list of available commands.
    #: DocLink: "https://fishshell.com/docs/current/cmds/bind.html?highlight=keybindings"

    bind --mode default e forward-char
    bind --mode default q backward-char

    bind --mode default n forward-word
    bind --mode default o backward-word

    bind --mode default s kill-selection
    bind --mode default ss kill-whole-line
    bind --mode default S kill-whole-line

    bind --mode visual e forward-char
    bind --mode visual q backward-char

    bind --mode visual n forward-word
    bind --mode visual o backward-word

    bind --mode visual s kill-selection

    bind --mode default u undo
    bind --mode default r redo

    bind --mode default --sets-mode visual v begin-selection
    bind --mode visual --sets-mode default v end-selection
    bind --mode visual --sets-mode default \e end-selection
    bind --mode default \e end-selection

    bind --mode default --sets-mode insert w end-selection
    bind --mode default --sets-mode insert W beginning-of-line

    bind --mode default go beginning-of-line
    bind --mode default gn end-of-line

    bind --mode visual go beginning-of-line
    bind --mode visual gn end-of-line

    bind --mode insert \cq backward-char
    bind --mode insert \ce forward-single-char

    bind --mode insert \ca beginning-of-line
    bind --mode insert \co end-of-line

    function copy_and_end_selection
        fish_clipboard_copy
        commandline --function end-selection
    end

    bind --mode default y end-selection
    bind --mode visual y copy_and_end_selection
    bind --mode default p fish_clipboard_paste
    bind --mode visual p fish_clipboard_paste

    #: START -> 'exa': file listing functions / aliases.
    #:  - NOTE: 'eza' is maintained fork of 'exa'.
    #:  - NOTE: Had issue with 'eza', so moved to 'lsd'.

    function l
        eza --all --long --header --classify --icons --group-directories-first $argv

    end

    function ll
        lsd --header --long --almost-all --classify --group-directories-first $argv
    end

    function ls
        # `eza` grid works, while `lsd` grid does not.
        eza --all --grid --classify --icons --group-directories-first $argv
    end

    #: I mistype `ls` to `s` decently often, so might aswell alias this.
    function s
        eza --all --grid --group-directories-first $argv
    end

    function lsr
        eza | rg -S "$argv"
    end

    function lt
        #: `lsd` happens to give me the tree hierarchy indicator lines right now, so it's better.
        lsd --tree --depth=3 --header --long --classify --group-directories-first $argv
        # eza --tree --level=3 --long --classify --header --group-directories-first $argv
    end

    #: END -> 'exa': file listing functions / aliases.

    function neo
        neovide --notabs --frame none $argv
    end

    function cap
        tee /tmp/capture.out
    end

    function ret
        cat /tmp/capture.out
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

    function reencodevideo
        ffmpeg -i $argv[1] -filter_complex "[0:v]setpts=1.0*PTS[v];[0:a]atempo=1.0[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac $argv[2]
    end

    function zd
        set -l finds (fd --type directory --max-depth 5)

        if [ -z "$finds" ]
            return 0
        end

        set -l fzf_selection (printf '%s\n' $finds | fzf)

        if [ -n "$fzf_selection" ]
            cd $fzf_selection && lsd --almost-all --classify
        else
            return 0
        end
    end

    function zl
        zi
    end

    #: Opening detached `Graphical File Browser` (nautilus) in Current Directory.
    function naut
        nohup nautilus --new-window $argv[1] > /dev/null 2>&1 & disown
    end

    #: Opening detached `PDF Viewer` (zathura).
    function zath
        nohup zathura $argv[1] > /dev/null 2>&1 & disown
    end

    function reload_fish
        source ~/.config/fish/config.fish
    end

    # =============================================================================
    #: Init pyenv.
    pyenv init - | source
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

# End of File
