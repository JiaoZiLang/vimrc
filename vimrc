":CocInstall coc-json coc-tsserver ===
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
Plug 'luochen1990/rainbow'
Plug 'glepnir/dashboard-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'connorholyday/vim-snazzy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'pechorin/any-jump.vim'
call plug#end()

" =============================================
" let g:AutoPairsShortcutToggle = '<C-p>'
let g:deoplete#enable_at_startup = 1
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
"let g:AutoPairs['<']='>'

" =============================================
let mapleader="\<space>"
map ; :
map <leader>/ :!
map <leader>sr :%s/

color snazzy

"change word to uppercase, I love this very much
inoremap <C-u> <esc>gUiwea

map J 5j
map K 5k

" =============================================
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>


" =============================================
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

" =============================================
nmap <F8> :TagbarToggle<CR>

" =============================================
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


" =============================================
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


" =============================================
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" 按键冲突，屏蔽这个
" nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" 按键冲突，屏蔽这个
" xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" =============================================
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = { '0': '0 ', '1': '1 ', '2': '2 ', '3': '3 ','4': '4 ', '5': '5 ', '6': '6 ', '7': '7 ', '8': '8 ', '9': '9 '}
" 设置切换tab的快捷键 <> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"


" +=================================== tagbar =======================================+ "

let g:tagbar_width=30
