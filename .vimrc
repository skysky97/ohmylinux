" Name:     vim configuration
" Author:   liyunting<pourlove@msn.cn>
" URL:      https://github.com/skysky97/ohmyvim
" 
" Good luck, have fun.
"

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
let g:solarized_termcolors=16
let g:solarized_termtrans=0
colorscheme solarized
" coc semantic highlight
let g:coc_default_semantic_highlight_groups=1
autocmd ColorScheme * :call <SID>do_highlight()
function! s:do_highlight()
  " overwrite float window color
  hi Pmenu cterm=none ctermfg=Cyan ctermbg=Black
  hi PmenuSbar cterm=none ctermfg=Cyan ctermbg=DarkGray
  hi Property cterm=none ctermfg=Magenta
  hi link CocSem_property Property
  hi link CocSem_namespace Normal
  hi link CocSem_variable Normal
  hi link CocSem_parameter Normal
  hi link CocSem_operator Type
endfunction
" }}}

" Navigation {{{
" ----------------------------------------------------------------------------
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" switch c/c++ source header
nmap <silent> gf :CocCommand clangd.switchSourceHeader<CR>
" coc-lists pre/next
nnoremap <silent><nowait> gj :<C-u>CocNext<CR>
nnoremap <silent><nowait> gk :<C-u>CocPrev<CR>
nnoremap <silent><nowait> gp :<C-u>CocListResume<CR>
" show documentation in preview window.
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" }}}

" Search & Explore  {{{
" ----------------------------------------------------------------------------
" search file
nmap <C-p> :CocList files<CR>
" search recently opened file
nmap ff :CocList mru<CR>
" search semantic symbol
nmap fs :CocList -I symbols<CR>
" search word in current buffer
nmap fw :CocList -I words<CR>
" search word in cwd
nmap fa :CocList -I grep -w<CR>
" search word in cwd by regex
nmap fA :CocList -I grep -e<CR>
" explore outline
nmap fo :CocList outline<CR>
" explore project
nmap fe :CocList explorer --quit-on-open<CR>
" buildin explorer
nmap <leader>e :Explore<CR>
" }}}

" Refactor  {{{
" ----------------------------------------------------------------------------
nmap <leader>fh <plug>(coc-cursors-word)
xmap <leader>fh <plug>(coc-cursors-range)
nmap <leader>fR <plug>(coc-refactor)
nmap <leader>fr <plug>(coc-rename)
nmap <leader>ff <plug>(coc-format-selected)
xmap <leader>ff <plug>(coc-format-selected)
nmap <leader>fq <plug>(coc-fix-current)
" }}}

" vim:foldmethod=marker:foldlevel=0
