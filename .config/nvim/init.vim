if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo'
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

" Automatic actions
" Auto-refresh after config
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost init.vim source % | echom "Reloaded init.vim" 
augroup END

augroup hotkey
	au BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END

augroup xresources
	au BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END
