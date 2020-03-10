" Plugin management with vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/matchit'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'moll/vim-bbye'
Plug 'google/vim-searchindex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'ziglang/zig.vim'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
call plug#end()

" Don't move the cursor back one character when leaving insert mode
"autocmd InsertLeave * :normal `^
"set virtualedit=onemore

" Enable line numbers
set number

" Line numbers are close to the edge of the window
set numberwidth=2

" Disable visual line wrap
set nowrap

" Set column limit for formatting with 'gq'
set textwidth=100

" Do not move the cursor to the first column when typing '#' in .c files
set cinkeys=0{,0},0),:,!^F,o,O,e

" Incremental Search
" Jumps to the next match as you type
set incsearch

" Highlight search results
set hlsearch

" Disable case sensitive searches
set ignorecase

" Become case sensitive while searching only if search string contains at least one capital letter
set smartcase

" Save when lose focus, and ignore warnings when it fails
"au FocusLost * silent! wa

" Vertical splits will put new windows right of the current window
" Horizontal splits will put new windows above the current window
set splitright

" Enable mouse support
"set mouse+=a

" In Gvim, remove the menu bar, toolbar, and scrollbar completely
set guioptions=aegit

" Hide the tab line
set showtabline=0

" Treat octal numbers like decimal numbers, becuase that's what they are most of the time
set nrformats=bin,hex

" I don't even know
set nojoinspaces

" Disable cursor blinking
"set guicursor+=a:blinkon0

" Only blink cursor in insert mode
"set guicursor+=n-v-c:blinkon0

" Hide the startup message
set shortmess=I

" Share with system clipboard
set clipboard^=unnamedplus

" Automatically reload files when they are modified externally
set autoread

" Make history greater than default
set history=500

" Always show the stuff at the bottom
set ruler

" Less backslashes needed in regular expressions by default
set magic

" Disable annoying error sounds
set noerrorbells
set novisualbell

" Don't redraw screen while executing macro
" Good for performance
set lazyredraw

" Disable swap files, because we have version control anyway
set noswapfile

" Shows a menu on the status line with autocomplete options when pressing tab
set wildmenu

" Shows the input of an incomplete command
set showcmd

" Allows switching between multiple unsaved buffers
set hidden

" Backspace unconditionally works against auto indentation and more
set backspace=indent,eol,start

" Render tabs and trailing spaces, and non-breaking space
set list
set listchars=tab:>\ ,space:\ ,trail:-

" Set lisp mode for emacs lisp
au Filetype el setlocal lisp

" Pressing tab inserts four spaces
" Hard tabs appear four spaces wide
set tabstop=4
set shiftwidth=4
set expandtab

" Copy indent from current line when starting new line
set autoindent

" Don't run zig fmt after saving
let g:zig_fmt_autosave = 0

" Execute .vimrc file in current directory automatically
set exrc

" Prevents exrc and other stuff from running potentially dangerous shell commands
set secure

" Removes the delay after pressing escape in insert mode, hopefully
"set noesckeys
"set timeoutlen=1000 ttimeoutlen=0

" Minimal number of screen lines to keep above and below the cursor
" Set this to something big (999) to keep the cursor centered at all times.
set scrolloff=999

" Clear old mappings when sourcing this file
mapclear

" Map Y to be consistent with C and D
noremap Y y$

" Session slots
" TODO: Proper directory on windows/macos?
nnoremap <leader>1 :wa\|mksession! ~/.vim/sessions/1.vim<cr>
nnoremap <leader>! :so ~/.vim/sessions/1.vim<cr>
nnoremap <leader>2 :wa\|mksession! ~/.vim/sessions/2.vim<cr>
nnoremap <leader>@ :so ~/.vim/sessions/2.vim<cr>
nnoremap <leader>3 :wa\|mksession! ~/.vim/sessions/3.vim<cr>
nnoremap <leader># :so ~/.vim/sessions/3.vim<cr>

" Source .vimrc
nnoremap <leader>- :source $MYVIMRC\|AirlineToggle\|AirlineToggle<cr>

" Edit vimrc
noremap <leader>= :e $MYVIMRC\|set ft=vim<cr>

" Copy line (or selection) into command buffer and run it
"nnoremap <leader>- yy:<c-r>"<bs><cr>
"vnoremap <leader>- y:<c-r>"<cr>

" Delete trailing whitespace in buffer
nnoremap <leader>0 :%s/\s\+$//\|noh\|w<cr><c-o>

" Toggle spell checking locally
nnoremap <leader>9 :setlocal spell!<cr>

" Run zig fmt on current file
"nnoremap <leader>8 :up\|!zig fmt %<cr>

" Disable the annoying message in the command line when using Ctrl-c
nnoremap <c-c> <silent> <c-c>

" Write file with sudo permissions
nnoremap <leader>W :w !sudo tee %<cr>
noremap <silent> <leader>w :up<cr>

" Open vertical terminal
noremap <silent> <leader>t :vert term<cr>

" Don't let the integrated terminal interupt buffer switching
tnoremap <silent> <c-j> <c-\><c-n>:bn<cr>
tnoremap <silent> <c-k> <c-\><c-n>:bp<cr>

" Exit terminal mode easier
tnoremap <c-q> <c-\><c-n>

" Ctrl+backspace deletes whole word
inoremap <c-bs> <c-w>
cnoremap <c-bs> <c-w>
vnoremap <c-bs> b

inoremap <c-s-bs> <esc>vBda
cnoremap <c-s-bs> <c-w>

" Rebind the open man page on symbol binding
vnoremap K <nop>
noremap K m0i<cr><esc>'0

" Switch between buffers
noremap <silent> <c-k> :bp<cr>
inoremap <silent> <c-k> <esc>:bp<cr>
noremap <silent> <c-j> :bn<cr>
inoremap <silent> <c-j> <esc>:bn<cr>

" Closes the current buffer without closing the window
" Also doesn't leave any [New File]s around
" Provided by the vim-bbye plugin
noremap <silent> <leader>d :up\|Bdelete!<cr>

" Clear search buffer in normal mode when pressing escape<cr>
nnoremap <silent> <esc> :noh<cr><esc>

" Enable syntax highlighting
syntax on

" The font for gvim
set guifont=Inconsolata\ 12

"" Colorscheme
" Darker background
let g:alduin_Shout_Dragon_Aspect = 1

" Use underline matchparens instead of block
let g:alduin_Shout_Aura_Whisper = 1

" Disable string background highlight
let g:alduin_Shout_Animal_Allegiance = 1

colo alduin

" Make the cursor number line the same as the others
hi CursorLineNR guifg=#020202 guibg=#444444

" Red and black cursor
hi Cursor guifg=#000000 guibg=#ff0000 ctermfg=0 ctermbg=9

" Change match paren colors
"hi MatchParen guifg=#121212 guibg=#ff0000 ctermfg=233 ctermbg=9

" Search for file with fzf
nnoremap <silent> <leader>f :Files<cr>

" Grep for string using ripgrep
nnoremap <silent> <leader>s :Rg<cr>

" Search for open buffer
noremap <silent> <leader>b :Buffers<cr>

" Search marks
noremap <silent> <leader>m :Marks<cr>

" Search lines in open buffers
noremap <silent> <leader>l :Lines<cr>

" Search v:oldfiles and open buffers
noremap <silent> <leader>h :History<cr>

" Toggle hard line wrapping in format options
command! HardWrapToggle if &fo =~ 't' | set fo-=t | echo 'Hard line wrap disabled' | else | set fo+=t | echo 'Hard line wrap enabled' | endif

noremap <leader>8 :HardWrapToggle<cr>

" Disable the abomination known as netrw
let g:loaded_netrwPlugin = 1

" Show the list of open buffers and tabs at the top of the screen
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Modify the default ignored buffer names so that neovim's terminal shows up in the tabline
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" Make the bufferline prettier
let g:airline#extensions#bufferline#left_sep = ' '
let g:airline#extensions#bufferline#right_sep = ' '
let g:airline#extensions#bufferline#left_alt_sep = ' '
let g:airline#extensions#bufferline#right_alt_sep = ' '

"Make the tabline prettier
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '

" On the tabline, only show the file name with the full path on the right
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Set Airline theme with the vim-airline-themes plugin
let g:airline_theme = 'atomic'

" Make fzf match the color scheme (Doesn't fully work for :Rg)
let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'PreProc'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment'] }

" Set formatoptions (see :h fo-table)
" formatoptions are being overwritten from somewhere, so I'm using an autocommand as a workaround
autocmd BufNewFile,BufRead * setlocal formatoptions=q

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" Keep this
:noh
