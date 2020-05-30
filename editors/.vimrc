set number
set tabstop=4
set shiftwidth=4
syntax on
autocmd Filetype tex inoremap ; <Bslash>
autocmd Filetype tex inoremap <Bslash> ;
call plug#begin()
Plug 'lervag/vimtex'
call plug#end()
