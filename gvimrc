set guioptions -=m "隐藏菜单栏
set guioptions -=T "隐藏工具栏
set guioptions-=r  "隐藏右侧滚动条
set guioptions-=l  "隐藏左侧滚动条
set guioptions-=L  "隐藏左侧滚动条,横向分割窗口时
set guioptions-=b  "隐藏底部滚动条
"set showtabline=0  "隐藏Tab栏

if has("win32")
    set guifont=Bitstream\ Vera\ Sans\ Mono:h16
    "set guifont=Bitstream\ Vera\ Sans\:h14
elseif has("gui_macvim")
    set guifont=Droid\ Sans\ Mono:h16
    "set guifont=Monaco:h15
else
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
    set guifont=Droid\ Sans\ Mono\ 16
    set guifontwide=Droid\ Sans\ 16

endif

"去掉声音提示
set noerrorbells
set novisualbell
"靠，居然加了下面这一句才起作用，逆天了啊
set vb t_vb=

if has("gui_macvim")
    "winpos 173 162
    set lines=30 columns=110
    set macmeta
else
    winpos 173 162
    set lines=38 columns=135
endif

"alt + number 切换tab
function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction

function! s:TabPos_Initialize()
    for i in range(1, 9)
        exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
        if has("gui_macvim")
            exe "map <D-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
        endif
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call s:TabPos_Initialize()

map<A-h> :tabprev<CR>
map<A-l> :tabnext<CR>

if has("gui_macvim")
    map<D-h> :tabprev<CR>
    map<D-l> :tabnext<CR>
endif


if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif
