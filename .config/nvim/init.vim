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
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'dawikur/base16-vim-airline-themes'
call plug#end()

""""""""""""""""
" Plugin config
""""""""""""""""
" Airline
let g:airline_powerline_fonts = 1
" Base16
let base16colorspace=256
set termguicolors
colorscheme base16-gruvbox-dark-hard

" """"""""""""
" Basic config
" """"""""""""
set relativenumber
set number
" Transparent vim even with gruvbox syntax highlighting
highlight normal guibg=NONE ctermbg=NONE
hi CursorLineNR guibg=none cterm=bold gui=bold

" """"""""""""""""""
" Automatic actions
" """"""""""""""""""
" Auto-refresh after config
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost init.vim source % | echom "Reloaded init.vim" 
  augroup END
au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
au BufWritePost *Xresources,*Xdefaults !xrdb %
