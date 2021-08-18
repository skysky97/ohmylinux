" Generic {{{
" ----------------------------------------------------------------------------
syntax enable
set encoding=utf-8
set hidden
set nocompatible
set updatetime=300
set nobackup
set nowritebackup
set directory=~/.cache/vim//
set laststatus=1
set cmdheight=1
" }}}

" Plugin {{{
" ----------------------------------------------------------------------------{{{}}}
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn --install --frozen-lockfile'}
Plug 'skysky97/vim-colors-solarized'
Plug 'seebi/dircolors-solarized'
call plug#end()
" }}}

" Style {{{
" ----------------------------------------------------------------------------
set number
set signcolumn=number
set nowrap
set linebreak
set breakindent
set breakindentopt=shift:4
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,nostop
" }}}

" Color & Theme {{{
" ----------------------------------------------------------------------------
set t_Co=16
set background=dark
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_termcolors=16
let g:solarized_termtrans=0
colorscheme solarized
" overwrite float window color
hi Pmenu cterm=none ctermfg=Cyan ctermbg=Black
hi PmenuSbar cterm=none ctermfg=Cyan ctermbg=DarkGray
" }}}

" vim:foldmethod=marker:foldlevel=0
