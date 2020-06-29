" """""""""""""""""""""""""""""""""""
" Download vim-plug if not installed
" """""""""""""""""""""""""""""""""""
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" """""""""""""
" Plugin list
" """""""""""""
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
<<<<<<< HEAD
Plug 'chriskempson/base16-vim'
Plug 'dawikur/base16-vim-airline-themes'
||||||| 3ab5da9
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo'
=======
Plug 'dawikur/base16-vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
>>>>>>> ee559f2187425062a950320ba28e30183d6174b2
call plug#end()

""""""""""""""""
" Plugin config
""""""""""""""""
" Airline
let g:airline_powerline_fonts = 1
<<<<<<< HEAD
" Base16
let base16colorspace=256
set termguicolors
colorscheme base16-gruvbox-dark-hard
||||||| 3ab5da9
" Gruvbox
let g:gruvbox_contrast_dark= 'hard'
=======
" Gruvbox
" let g:gruvbox_contrast_dark= 'hard'
>>>>>>> ee559f2187425062a950320ba28e30183d6174b2

" """"""""""""
" Basic config
" """"""""""""
set relativenumber
set number
<<<<<<< HEAD
||||||| 3ab5da9
colorscheme gruvbox
set termguicolors
=======
colorscheme base16-one-light
set termguicolors
>>>>>>> ee559f2187425062a950320ba28e30183d6174b2
" Transparent vim even with gruvbox syntax highlighting
<<<<<<< HEAD
highlight normal guibg=NONE ctermbg=NONE
hi CursorLineNR guibg=none cterm=bold gui=bold
||||||| 3ab5da9
highlight normal guibg=none ctermbg=none
hi CursorLineNR guibg=none cterm=bold gui=bold
=======
" highlight normal guibg=none ctermbg=none
" hi CursorLineNR guibg=none cterm=bold gui=bold

>>>>>>> ee559f2187425062a950320ba28e30183d6174b2

" """"""""""""""""""
" Automatic actions
" """"""""""""""""""
" Auto-refresh after config
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost init.vim source % | echom "Reloaded init.vim" 
augroup END

augroup hotkey
	au! BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END

augroup xresources
	au! BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END

" Bindings
