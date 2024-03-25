complete -c erd -s C -l color -d 'Mode of coloring output' -r -f -a "{none	Print plainly without ANSI escapes,auto	Attempt to colorize output,force	Turn on colorization always}"
complete -c erd -s d -l disk-usage -d 'Print physical or logical file size' -r -f -a "{logical	How many bytes does a file contain,physical	How many actual bytes on disk\, taking into account blocks\, sparse files\, and compression,line	How many total lines a file contains,word	How many total words a file contains,block	How many blocks are allocated to store the file}"
complete -c erd -l time -d 'Which kind of timestamp to use; modified by default' -r -f -a "{create	Timestamp showing when the file was created,access	Timestamp showing when the file was last accessed,mod	Timestamp showing when the file was last modified}"
complete -c erd -l time-format -d 'Which format to use for the timestamp; default by default' -r -f -a "{iso	Timestamp formatted following the iso8601\, with slight differences and the time-zone omitted,iso-strict	Timestamp formatted following the exact iso8601 specifications,short	Timestamp only shows date without time in YYYY-MM-DD format,default	Timestamp is shown in DD MMM HH:MM format}"
complete -c erd -s L -l level -d 'Maximum depth to display' -r
complete -c erd -s p -l pattern -d 'Regular expression (or glob if \'--glob\' or \'--iglob\' is used) used to match files' -r
complete -c erd -s t -l file-type -d 'Restrict regex or glob search to a particular file-type' -r -f -a "{file	A regular file,dir	A directory,link	A symlink}"
complete -c erd -s s -l sort -d 'How to sort entries' -r -f -a "{name	Sort entries by file name in lexicographical order,rname	Sort entries by file name in reversed lexicographical order,size	Sort entries by size smallest to largest\, top to bottom,rsize	Sort entries by size largest to smallest\, bottom to top,access	Sort entries by newer to older Accessing Date,raccess	Sort entries by older to newer Accessing Date,create	Sort entries by newer to older Creation Date,rcreate	Sort entries by older to newer Creation Date,mod	Sort entries by newer to older Alteration Date,rmod	Sort entries by older to newer Alteration Date}"
complete -c erd -l dir-order -d 'Sort directories before or after all other file types' -r -f -a "{none	Directories are ordered as if they were regular nodes,first	Sort directories above files,last	Sort directories below files}"
complete -c erd -s T -l threads -d 'Number of threads to use' -r
complete -c erd -s u -l unit -d 'Report disk usage in binary or SI units' -r -f -a "{bin	Displays disk usage using binary prefixes,si	Displays disk usage using SI prefixes}"
complete -c erd -s y -l layout -d 'Which kind of layout to use when rendering the output' -r -f -a "{regular	Outputs the tree with the root node at the bottom of the output,inverted	Outputs the tree with the root node at the top of the output,flat	Outputs a flat layout using paths rather than an ASCII tree}"
complete -c erd -l completions -d 'Print completions for a given shell to stdout' -r -f -a "{bash	,elvish	,fish	,powershell	,zsh	}"
complete -c erd -s f -l follow -d 'Follow symlinks'
complete -c erd -s H -l human -d 'Print disk usage in human-readable format'
complete -c erd -s i -l no-ignore -d 'Do not respect .gitignore files'
complete -c erd -s I -l icons -d 'Display file icons'
complete -c erd -s l -l long -d 'Show extended metadata and attributes'
complete -c erd -l group -d 'Show file\'s groups'
complete -c erd -l ino -d 'Show each file\'s ino'
complete -c erd -l nlink -d 'Show the total number of hardlinks to the underlying inode'
complete -c erd -l octal -d 'Show permissions in numeric octal format instead of symbolic'
complete -c erd -l glob -d 'Enables glob based searching'
complete -c erd -l iglob -d 'Enables case-insensitive glob based searching'
complete -c erd -s P -l prune -d 'Remove empty directories from output'
complete -c erd -s . -l hidden -d 'Show hidden files'
complete -c erd -l no-git -d 'Disable traversal of .git directory when traversing hidden files'
complete -c erd -l dirs-only -d 'Only print directories'
complete -c erd -l no-config -d 'Don\'t read configuration file'
complete -c erd -l no-progress -d 'Hides the progress indicator'
complete -c erd -l suppress-size -d 'Omit disk usage from output'
complete -c erd -l truncate -d 'Truncate output to fit terminal emulator window'
complete -c erd -s h -l help -d 'Print help (see more with \'--help\')'
complete -c erd -s V -l version -d 'Print version'
