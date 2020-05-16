if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

" Plugin config
"
" Airline
let g:airline_powerline_fonts = 1
" Gruvbox
let g:gruvbox_contrast_dark= 'hard'

" Basic config
set relativenumber
set number
colorscheme gruvbox
set termguicolors
" Transparent vim even with gruvbox syntax highlighting
highlight normal guibg=none ctermbg=none
hi CursorLineNR guibg=none cterm=bold gui=bold