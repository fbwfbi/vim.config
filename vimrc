"Get out of VI's compatible mode..
set nocompatible
"末尾不要加换行
set noendofline

"gVim启动窗口位置 大小
"设定文件编码
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

" 在中文 Windows 里编辑的文件，为了兼顾与其他软件的兼容性，文件编码
" 还是设置为 GB2312/GBK 比较合适，因此 fileencoding 建议设置为 chinese
" (chinese 是个别名，在 Unix 里表示 gb2312，在 Windows 里表示 cp936，也
" 就是 GBK 的代码页)。
" 在vim中运行以下命令后再保存文件，可以转换文件夹编码格式
if has("win32")
    set fileencoding=utf-8
else
    set fileencoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

"自动编码检测
set fencs=utf-8,gbk,ucs-bom,gb18030,gb2312,cp936

"添加第三方执行路径 VAM
"exe 'set runtimepath+='. $VIM .'/vimfiles/third_runtimepath/vim-addon-manager'

filetype plugin indent on
syntax on

"配色风格
"earendel  错误提示不会用背景色，更安逸一点
"candycode
"desert
"molokai
"solarized

if (has("gui_running"))
    "颜色偏黄
    "let g:molokai_original=1
    colorscheme molokai
else
    colorscheme desert
endif

"文本缩进设置
set nosmarttab
set tabstop=4 "一个Tab键显示为几个空格，默认为8个太长了
set softtabstop=4 "在Insert模式下，按下Tab键输入几个空格长的空间。如果设置了expandtab，则全部为空格，否则用Tab和Space拼接而成
set shiftwidth=4 "VIM为你自动缩进时，或者你按<<或>>进行对齐时，每个缩进占几个空格
set expandtab "将所有的Tab都转换为响应的空格

function! CustomSetTab()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
endfunction

"set autoindent
set smartindent

set noeb

set showcmd         " 输入的命令显示出来，看的清楚些
"状态行显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
function! CurrectDir()
    let curdir = substitute(getcwd(), "", "", "g")
    return curdir
endfunction
"set statusline=\ [PWD]\ %r%{CurrectDir()}%h\ \ [File]\ %f%m%r%h\ %w\ %=[L\ %l,R\ %c,T\ %L]\ %=\ %P
set statusline=\ [PWD]\ %r%{CurrectDir()}%h\ \ [File]\ %f%m%r%h\ %w\ \ \ \ [L\ %l,R\ %c,T\ %L]\ \ %P
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)

"自动切换目录
set autochdir

"搜索路径列表
set path=.,,

"设定折叠方式
set foldmethod=manual

"Sets how many lines of history VIM har to remember
set history=1000

"文件在外部被修改则自动保存
set autoread

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler
set cursorline              " 突出显示当前行
set magic                   " 设置魔术，对搜索字符串有应用

"The commandbar is 2 line high(Ex模式)
set cmdheight=1

"Show line number 显示行号
set nu

"Set backspace
"设想这样一个情况： 当前光标前面有若干字母， 我们按下 i 键进入了 Insert 模式， 然后输入了 3 个字母， 再按 5 下删除(Backspace)。 默认情况下， Vim 仅能删除我们新输入的 3 个字母， 然后喇叭“嘟嘟”响两声。 如果我们“set backspace=start”， 则可以在删除了新输入的 3 个字母之后， 继续向前删除原有的两个字符。 再设想一个情况： 有若干行文字， 我们把光标移到中间某一行的行首， 按 i 键进入 Insert 模式， 然后按一下 Backspace。 默认情况下， 喇叭会“嘟”一声， 然后没有任何动静。 如果我们“set backspace=eol”， 则可以删除前一行行末的回车， 也就是说将两行拼接起来。 当我们设置了自动缩进后， 如果前一行缩进了一定距离， 按下回车后， 下一行也会保持相同的缩进。 默认情况下， 我们不能在 Insert 模式下直接按 Backspace 删除行首的缩进。 如果我们“set backspace=indent”， 则可以开启这一项功能。 上述三项功能， 你可以根据自己的需要， 选择其中一种或几种， 用逗号分隔各个选项。 建议把这三个选项都选上。

set backspace=eol,start,indent


"Bbackspace and cursor keys wrap to
" 默认情况下， 在 VIM 中当光标移到一行最左边的时候， 我们继续按左键， 光标不能回到上一行的最右边。 同样地， 光标到了一行最右边的时候， 我们不能通过继续按右跳到下一行的最左边。 但是， 通过设置 whichwrap 我们可以对一部分按键开启这项功能。 如果想对某一个或几个按键开启到头后自动折向下一行的功
set whichwrap+=<,>,h,l

"show matching bracets
set showmatch
set matchtime=1

"How many tenths of a second to blink
"光标闪动的频率
set mat=2

set tags=tags,./tags
function s:autoSetCxSystemTags()
    let l:currentExt = expand("%:e")
    if (l:currentExt == "c" || l:currentExt == "cc" || l:currentExt == "cpp")
        set tags+=~/.vim/systags
    else
        set tags-=~/.vim/systags
    endif
endfunction
au BufNewFile,BufRead,BufNew,BufWinEnter,TabEnter * call s:autoSetCxSystemTags()
"冒号前面其实不用加\
command -nargs=0 CtagsCreate exe "silent! !ctags -R --c++-kinds=+lpx --fields=+iaS --extra=+q" . expand("%:h")


"共享剪贴板
set clipboard+=unnamed
"从不备份
set nobackup

set ignorecase
"搜索逐字符高亮
set hlsearch
"搜索时实时显示/跳转到匹配的串
set incsearch
"行内替换所有
set gdefault

"显示回车换行符
"set list listchars=tab:»-,eol:\¶
set list listchars=tab:»-

"窗口切换
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"关闭当前窗口
map <A-w> :q<CR>
let mapleader=","

"保存当前文件
map <C-s> :w<CR>
map <M-s> :w<CR>
imap <C-s> <C-o>:w<CR>
imap <M-s> <C-o>:w<CR>
"编辑状态下撤消
imap <M-u> <C-o>u
"退出编辑状态
imap <M-i> <ESC>

imap <M-h> <LEFT>
imap <M-k> <UP>
imap <M-j> <DOWN>
imap <M-l> <RIGHT>

imap <M-f> <C-o>f

"插入空行
map <M-o> o<ESC>
"退出
map <M-q> :wq<CR>
"建立新tab
map <M-n> :tabnew<CR>

map <M-f> <C-f>
map <M-d> <C-d>
map <M-u> <C-u>

"session保存设置
"autocmd VimEnter * SessionOpenLast

"tagbar配置
nmap <F8> :TagbarToggle<CR>

"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"vimball默认安装路径配置
"let g:vimball_home=$VIM . "/vimfiles"

"winmanager
let g:winManagerWindowLayout='FileExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList'
"let g:winManagerWindowLayout="FileExplorer|BufExplorer"
"let g:winManagerWidth = 30
nmap <leader>e :WMToggle<CR>

"command-t
"nmap <F3> :CommandT<CR>

"{{ jsbeautify
"let g:plugin_Root_direcoty = $VIM . "/vimfiles/vim-addons/jsbeautify/"
"map <c-f> :call JsBeautify()<cr>
" or{
"autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
"}

function s:BeautifyFormat()
    let ext = expand("%:e")
    if (ext == 'js')
        call JsBeautify()
    elseif (ext == 'css')
        call CSSBeautify()
    elseif (ext == 'html')
        call HtmlBeautify()
    endif
endfunction

command! -nargs=0 BeautifyFormat call s:BeautifyFormat()
"}}

"末尾空白
au BufNewFile,BufRead,BufNew * match ExtraWhitespace /\s\+$/

"vam start. See help file to install
fun! SetupVAM()
  "let l:plugins = ['vimcdoc', 'Mark', 'snipMate', 'snipmate-snippets', 'vim-addon-mw-utils', 'tlib', 'vim-addon-commenting', 'neocomplcache', 'vimproc', 'SuperTab', 'vim-jsbeautify', 'vimshell', 'unite', 'Auto_Pairs', 'html5']
  let l:plugins = ['vimcdoc', 'Mark', 'snipMate', 'snipmate-snippets', 'vim-addon-mw-utils', 'tlib', 'vim-addon-commenting', 'vimproc', 'SuperTab', 'vim-jsbeautify',  'unite', 'html5', 'eclim', 'mru', 'tComment', 'surround']

  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$VIM/vimfiles/vim-addons')
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  call vam#ActivateAddons(l:plugins, {'auto_install' : 0})
endfun
call SetupVAM()
"VAM export

"==========自动补全==========
"set completeopt+=longest,menuone
"==========自动补全==========
