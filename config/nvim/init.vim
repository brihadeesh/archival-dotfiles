" VimPlug load
call plug#begin('~/.config/nvim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Goyo
Plug 'junegunn/goyo.vim'

" Theme probably more suitable for Goyo and vim in general
Plug 'junegunn/limelight.vim'
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGrey'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.3

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"  When there's no empty line between the paragraphs
"  and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Github Dashboard
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }

" Nord colorscheme
Plug 'arcticicestudio/nord-vim'

" Vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Airline theme to nord
let g:airline_theme='nord'

" nvim-R
Plug 'jalvesaq/Nvim-R'

" Completions
"Plug 'Valloric/YouCompleteMe'

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'

"Colorschemes ??


" close VimPlug
call plug#end()

" Nord colorscheme
colorscheme nord
let g:nord_comment_brightness = 20
set background=dark
"colorscheme darkblue

" Enable the use of the mouse for all modes
set mouse=a

" Print the line number in front of each line
set number

" Remove trailing characters on save
autocmd BufWritePre * :%s/\s\+$//e

" Open new tab by <Ctrl+T>
map <C-t> :tabnew<CR>

" Do smart autoindenting when starting a new line
set smartindent

" Set default indent size to 2
set
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" Do smart autoindenting when starting a new line
set smartindent

" Set default indent size to 2
set
  \ tabstop=2
  \ softtabstop=2
  \ shiftwidth=2

" Vertical line
set colorcolumn=81
