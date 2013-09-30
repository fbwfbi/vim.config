set guioptions -=m "隐藏菜单栏
set guioptions -=T "隐藏工具栏
set guioptions-=r  "隐藏右侧滚动条
set guioptions-=l  "隐藏左侧滚动条
set guioptions-=L  "隐藏左侧滚动条,横向分割窗口时
set guioptions-=b  "隐藏底部滚动条
"set showtabline=0  "隐藏Tab栏

if has("win32")
    set guifont=Bitstream\ Vera\ Sans\ Mono:h12
    set guifont=Bitstream\ Vera\ Sans\:h12
else
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
    set guifont=Droid\ Sans\ Mono\ 13
    set guifontwide=Droid\ Sans\ 13

endif

"去掉声音提示
set noerrorbells
set novisualbell
"靠，居然加了下面这一句才起作用，逆天了啊
set vb t_vb=

winpos 173 162
set lines=38 columns=135

"alt + number 切换tab
function! TabPos_ActivateBuffer(num)
    let s:count = a:num
    exe "tabfirst"
    exe "tabnext" s:count
endfunction

function! TabPos_Initialize()
    for i in range(1, 9)
        exe "map <M-" . i . "> :call TabPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call TabPos_ActivateBuffer(10)<CR>"
endfunction
autocmd VimEnter * call TabPos_Initialize()
map<A-l> :tabnext<CR>
map<A-h> :tabprev<CR>


if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:vimrc_iswindows=1
else
    let g:vimrc_iswindows=0
endif
