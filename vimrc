" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'pechorin/any-jump.vim'
call plug#end()
" let g:AutoPairsShortcutToggle = '<C-p>'
let g:deoplete#enable_at_startup = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
"let g:AutoPairs['<']='>'

let mapleader="\<space>"
map ; :
map <leader>/ :!
map <leader>sr :%s/

color snazzy

map J 5j
map K 5k

map S :w<CR>
map Q :q<CR>

map <F2> :NERDTreeToggle<CR>


" Leade 插件配置
noremap <leader>f :LeaderfSelf<cr> 
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBufTagAll<cr>
noremap <leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>

" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tl :-tabnext<CR>
map tr :+tabnext<CR>
" Move the tabs with tmn and tmi
map tml :-tabmove<CR>
map tmr :+tabmove<CR>

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sd :set splitbelow<CR>:split<CR>
map sl :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sr :set splitright<CR>:vsplit<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <F8> :TagbarToggle<CR>

map <leader>ct :call RunCFTest()<CR>
func! RunCFTest()
	exec "w"
	exec "!cf test"
endfunc

map <leader>cs :call RunCFSubmit()<CR>
func! RunCFSubmit()
	exec "w"
	exec "!cf submit"
endfunc


syntax on " 自动语法高亮
set cursorline " 突出显示当前行
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix "从Win上复制文件时，避免换行符错误
set hlsearch " 搜索时高亮显示被找到的文本
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch " 输入搜索内容时就显示搜索结果
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set magic " 设置魔术
set nocompatible " 关闭 vi 兼容模式
set number " 显示行号
set relativenumber "显示相对行号
" set paste 打开会导致在mac下不能使用auto pairs 插件问题 " 解决拷贝的时遇到注释会自动注释后续所有行的问题
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set smartindent " 开启新行时使用智能自动缩进
set tabstop=4 " 设定 tab 长度为 4
set ambiwidth=double " 设置为双字宽显示，否则无法完整显示如:☆
set wildmode=list:longest
