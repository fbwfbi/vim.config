let s:webkitSrc = "/var/workroom/webkit"
let s:webkitoutput = s:webkitSrc . "/WebKitBuild"

let s:webkitoutdir = s:webkitoutput . "/Debug"
let s:dependenciesSrc = s:webkitoutput . '/Dependencies/Source'

set tags=tags,./tags
cscope reset

let tagFilesList = []
let cscopeFilesList = []

let s:jhbuildDependencies = []
call add(s:jhbuildDependencies, ['glib', ['gio', 'glib', 'gmodule', 'gobject', 'gthread']])
call add(s:jhbuildDependencies, ['gtk', ['gdk', 'gtk', 'libgail-util']])
call add(s:jhbuildDependencies, ['cairo', []])
call add(s:jhbuildDependencies, ['libsoup', ['libsoup']])

function! s:addDirTagFiles(dir)
    if (filereadable(a:dir . '/tags'))
        echo a:dir . '/tags'
        execute 'set tags+=' . a:dir . '/tags'
    endif
    if (filereadable(a:dir . '/cscope.out'))
        echo a:dir . '/cscope.out'
    endif
endfunction

"webkit tags
call s:addDirTagFiles(s:webkitoutdir)

for s:item in s:jhbuildDependencies
    let s:dir = s:item[0]
    "echo s:dir
    let s:itemRootDir = s:dependenciesSrc . '/' . s:dir
    call s:addDirTagFiles(s:itemRootDir)

    for s:subdir in s:item[1]
        "echo ' '.s:subdir
        let s:itemTagDir = s:dependenciesSrc . '/' . s:dir . '/'. s:subdir
        call s:addDirTagFiles(s:itemTagDir)
    endfor
endfor
