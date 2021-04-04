

" Vim with all enhancements


highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE

source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set rnu
set laststatus=2
set noshowmode
set clipboard=unnamed
set mouse=a
set nospell
set cursorline
hi CursorLine term=bold cterm=bold
hi clear SpellBad
hi SpellBad cterm=underline
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

call plug#begin("~/.vim/plugged")

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
 Plug 'prettier/vim-prettier', {
   \ 'do': 'yarn install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'benmills/vimux'
Plug 'goballooning/vim-conque'
Plug 'alvan/vim-closetag'
Plug 'phpactor/phpactor'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ap/vim-css-color'
Plug 'easymotion/vim-easymotion'
"Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'anned20/vimsence'
call plug#end()

let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode


colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
set bg=dark

let NERDTreeQuitOnOpen=1
let g:airline#extensions#tabline#enabled = 1
"let g:kite_supported_languages = ['python', 'javascript']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Start autocompletion after 4 chars
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" air-line
let g:airline_powerline_fonts = 1

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>p :Prettier<CR>
