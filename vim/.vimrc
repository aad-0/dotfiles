"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
if ( getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" millenium
set nocompatible
filetype on
filetype indent on

" enable plugins & syntax
filetype plugin on
"syntax enable on
syntax enable

" nopmap arrows
nnoremap <up>	<nop>
nnoremap <down>	<nop>
nnoremap <left>	<nop>
nnoremap <right>	<nop>
map <F7> gg=G<C-o><C-o>

set number
set cursorline
"set cursorcolumn



set backspace=2
set backspace=indent,eol,start

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set nobackup
set scrolloff=10
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch

"set guifont=8514oem:h20:
"set guifont=Terminal:h18:b
"set guifont=Unispace:h12:w8:b:cANSI
set guifont=Unispace:h14:w10:b:cANSI
set linespace=16


" colorscheme default " Kinda Nic
" colorscheme blue "Not Bad
" colorscheme darkBlue " Not Bad
" colorscheme desert " Very Good
" colorscheme elflord " Dark Contrast, Good
" colorscheme evening " Quite Good
" colorscheme industry " Not That Good
colorscheme koehler "Dark Quite Good
" colorscheme murphy " Dark, not that Good
" colorscheme pablo " Dark Good
" colorscheme ron "  Not That Good
" colorscheme torte "Kinda 
" colorscheme slate " DarkGray Good
" colorscheme peachpuff "Light, Good
" colorscheme morning" White Good
" colorscheme zellner " White Good
" colorscheme delek "White Not Good
" colorscheme shine "White, Not that Good
" User Schemes
" colorscheme gruvbox
" colorscheme iceberg
" colorscheme nord



"table colors
:hi TabLineFill ctermfg=black ctermbg=black
:hi TabLine ctermfg=darkyellow ctermbg=black
:hi TabLineSel ctermfg=black ctermbg=darkMagenta
":hi Title ctermfg=LightBlue ctermbg=Magenta
"
"
"
":hi CursorLineNr ctermbg=None ctermfg=None
:hi CursorLine cterm=bold ctermbg=DarkGray ctermfg=Gray
":hi CursorLine cterm=bold ctermbg=Black ctermfg=None

" highligh Row Line

let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
set ruler

" search in sub-folders
set path+=**

"display all matching files when tab complete
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
"
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer
"
"


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags
"
"
"
"

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:

" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

