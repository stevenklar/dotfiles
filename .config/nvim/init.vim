" Init
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "go,html,javascript,php,python"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"General Settings
set number
set relativenumber
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set nojoinspaces

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Searching stuff
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Setup Plugins (vim-plug)
call plug#begin()

"" Themes
Plug 'dracula/vim'
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'

"" Autocompletion
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
"Plug 'roxma/nvim-completion-manager' @ERROR

"" Find
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'

"" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/dockerfile.vim'

"" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" ZenMode :)
Plug 'junegunn/goyo.vim'

call plug#end()

set bg=dark
"colorscheme gruvbox
colorscheme nord

" Configure keybindings
let mapleader="\<SPACE>"

" quick edit
nnoremap <Leader>i :e $HOME/.config/i3/config<CR>
nnoremap <Leader>ii :e $HOME/.config/polybar/config<CR>
nnoremap <Leader>t :e $HOME/buffer.md<CR>
nnoremap <Leader>e :e $HOME/dotfiles/vim/init.vim<CR>
nnoremap <Leader>h :e $HOME/dotfiles/zsh/rc<CR>
map <F8> <ESC>:source %<CR>

" ZenMode
nnoremap <Leader>z :Goyo<CR>

" CtrlP
nnoremap <C-p> :FZF!<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <Leader>r :CtrlPMRUFiles<CR>
nnoremap <C-f> :CtrlPMRUFiles<CR>

" File, Buffer and Tabs stuff
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>Q :qall!<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

nnoremap <Leader>n :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Search and Replace
nmap <Leader>s :%s/

" clear the highlighting of :set hlsearch.
nnoremap <silent> <Leader><cr> :nohlsearch<CR><C-L>

" Better movement
nmap j gj
nmap k gk
imap jk <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Split window
nnoremap <Leader>c :sp<cr><C-w>j
nnoremap <Leader>v :vs<cr><C-w>l

" Copy and paste from system clipboard (Might require xsel/xclip install)
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

let @q = 'EBdEmm?php/useOiuse pa;0wx`$byw`mpb'

nnoremap ; :

" Auto commands DONT DO TO MANY OF THEM!
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

augroup vimrc_autocmds
        autocmd!
            " highlight characters past column 120
            autocmd FileType php highlight Excess ctermbg=DarkGrey guibg=Black
            autocmd FileType php match Excess /\%121v.*/
            autocmd FileType php set nowrap
augroup END

