call plug#begin( '~/.config/nvim/plugins' )

Plug 'itchyny/lightline.vim'
" Plug 'airodactyl/neovim-ranger.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'


" Initialize plugin system
call plug#end()


set laststatus=2
map <F9> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Activation coloration syntaxique
syntax on


" Ajout numerotation des lignes
set number
" highlight LineNr ctermbg=black ctermfg=gray
" highlight LineNr ctermbg=blue ctermfg=gray
" Ajout d'une ligne coloree pour surligner la ligne en cours
set cursorline
" highlight CursorLine term=reverse cterm=reverse
" highlight CursorLine term=underline cterm=underline
" Lingueur Maximale des lignes
" set textwidth=80
" Surligne la colonne du dernier caractere autorise par textwidth
" set cc=+1

" Amelioration de la lisibilite des noms des onglets
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue

" Ouverture des fichiers avec le curseur a la position de la
" derniere edition
function! s:CursorOldPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal g`\""
    endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()

" pas de copie de sauvegarde
set nobackup

"tabulation
nnoremap <TAB> >>
" nnoremap <ESC>[Z <<
vnoremap <TAB> >
" vnoremap <ESC>[Z <
" vnoremap <SHIFT><TAB> <

map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>

" Ajout utilisation uft8
if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
"    set bomb
"   set termencoding=iso-8859-15
    set termencoding=utf-8
    set fileencodings=ucs-bom,iso-8859-15,iso-8859-3,utf-8
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

"FZF plugin
nnoremap <space>f :FZF<cr>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" fzf fuzzy completion
set rtp+=/usr/local/opt/fzf

set nofoldenable

" Activation/Desactivation de la enetre d'exploration de fichier
" map <F9> <Esc>:NERDTreeToggle<CR>
" map <F9> <Esc>:NERDTreeToggle<CR>
map <F9> <plug>NERDTreeTabsToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



