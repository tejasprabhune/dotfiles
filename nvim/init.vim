set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Powerline/Airline Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" LaTeX Plugins
Plugin 'lervag/vimtex'
Plugin 'KeitaNakamura/tex-conceal.vim'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" YouCompleteMe Plugin
" Plugin 'ycm-core/YouCompleteMe'

" Autosave Plugin
Plugin '907th/vim-auto-save'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Powerline/airline setup
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" LaTeX setup
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsEditSplit = "vertical"
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" Spellcheck setup

au FileType tex setlocal spell
au FileType tex set spelllang=en_us
au FileType tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Tabstop setup
set tabstop=2
set shiftwidth=2

" YouCompleteMe setup
 if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Autosave setup
" let g:auto_save = 1
set number
set relativenumber
highlight LineNr ctermfg=grey

set regexpengine=1
" imap <Tab> <C-P>
