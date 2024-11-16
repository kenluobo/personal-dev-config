set modelines=0		" CVE-2007-2438 
" Configuration file for vim

set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1
set encoding=utf-8                      " set encoding
set number                              " 打开行号

set t_Co=256                            " 使用256色
" set background=dark                   " 设置背景色
syntax enable                           " 开启语法高亮
syntax on                               " 打开语法高亮

set showmode                            " 打开vim模式
set showcmd                             " 打开显示键入指令
" set mouse=a                           " 打开使用鼠标

set autoindent                          " 智能缩进
set expandtab                           " 将tab与空格一直
set tabstop=4                           " 设置tab缩紧
set shiftwidth=4                        " 设置格式化时制表符空格数
set softtabstop=4                       " 一个tab转化为多少空格

filetype indent on                      " 自适应不同语言的智能缩进
filetype on                             " 文件类型侦测
filetype plugin on

set hlsearch                            " 设置高亮显示搜索结果
set cursorline                          " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn                        " Highlight cursor line underneath the cursor vertically.

set foldmethod=indent                   " 基于缩进或语法的代码折叠
set nofoldenable                        " 启动vim时关闭折叠代码



" Clear status line when vimrc is reloaded.
" set statusline=
" Status line left side.
" set statusline+=\ %F\ %M\ %Y\ %R
" Use a divider to separate the left side from the right side.
" set statusline+=%=
" Status line right side.
" set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
" Show the status on the second to last line.
" set laststatus=2

call plug#begin('~/.vim/plugged')                                   " vim plug
" Plug 'Yggdroot/indentLine'
" Plug 'Tabnine'
" Plug 'Syntastic'
" Plug 'ack'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'nathanaelkane/vim-indent-guides'

Plug 'preservim/NERDTree'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'derekwyatt/vim-fswitch'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/joshdick/onedark.vim.git'
Plug 'vim-autoformat/vim-autoformat'
Plug 'sbdchd/neoformat'

call plug#end()


" Airline
let g:airline#extensions#tabline#enabled=1                          " 开启 tab 栏
" let g:airline_theme='luna'

" YouCompleteMe
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5     " 菜单
" highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900  " 选中项
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_add_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_autocloase_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostics_ui=1                                   " 禁用语法检查
let g:ycm_key_list_stop_completion=['<CR>']
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |            " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|     " 跳转到定义处
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <Down> pumvisible() ? '\<C-n>' : '\<Down>'
inoremap <expr> <Up> pumvisible() ? '\<C-p>' : '\<Up>'

" hi link YcmInlayHint Comment
" call prop_type_add( 'YCM_INLAY_Type', #{ highlight: 'Comment' } )
"
" let g:ycm_anable_semantic_highlighting=1
" let MY_YCM_HIGHLIGHT_GROUP = {
"       \   'typeParameter': 'PreProc',
"       \   'parameter': 'Normal',
"       \   'variable': 'Normal',
"       \   'property': 'Normal',
"       \   'enumMember': 'Normal',
"       \   'event': 'Special',
"       \   'member': 'Normal',
"       \   'method': 'Normal',
"       \   'class': 'Special',
"       \   'namespace': 'Special',
"       \ }
"
" for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
"   call prop_type_add( 'YCM_HL_' . tokenType,
"                     \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
" endfor
"
" let g:ycm_enable_inlay_hints=1
" let g:ycm_clear_inlay_hints_in_insert_mode=1

" indent_guides
" let g:indent_guides_enable_on_vim_startup=1                         " 随 vim 自启动
" let g:indent_guides_start_level=2                                   " 从第二层开始可视化显示缩进
" let g:indent_guides_guide_size=1                                    " 色块宽度
" nmap <silent> <Leader>i <Plug>IndentGuidesToggle                   " 快捷键 i 开/关缩进可视化

" fswitch
nmap <silent> <Leader>sw :FSHere<cr>                                " *.cpp 和 *.h 间的切换

" nerdcommenter
let g:NERDCreateDefaultMappings = 1                 " Create default mappings
let g:NERDSpaceDelims = 1                           " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1                       " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'                     " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1                        " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1                     " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1                " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1                   " Enable NERDCommenterToggle to check all selected lines is commented or not 

" NERDTree
let NERDTreeWinPos="right"
" let NERDTreeWinSize=32
let NERDTreeAutoDeleteBuffer=1                      " 删除文件是自动删除buffer

" oneDark theme 
colorscheme onedark 

" auto-pair 
let g:AutoPairs= {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" au FileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
au FileType html let b:AutoPairs=AutoPairsDefine({'<!--' : '-->'})
au FileType * let b:AutoPairs=AutoPairsDefine({'\w<':'>'})

" use vim-autoformat to call clang-format 
autocmd FileType c,cpp,hpp,h,json,js,python autocmd BufWritePre * :Neoformat

