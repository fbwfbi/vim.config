let s:webkitSrc = "/var/workroom/webkit"

let s:webkitoutdir = s:webkitSrc . "/WebKitBuild/Debug"
let s:dependenciesSrc =  s:webkitSrc . "/WebKitBuild/Dependencies/Source"

set tags=tags,./tags
"set path=.,,
cscope reset

let tagFilesList = []
let cscopeFilesList = []

let s:jhbuildDependencies = []
call add(s:jhbuildDependencies, ['glib', ['gio', 'glib', 'gmodule', 'gobject', 'gthread']])
call add(s:jhbuildDependencies, ['gtk+', ['gdk', 'gtk', 'libgail-util']])
call add(s:jhbuildDependencies, ['cairo', []])
call add(s:jhbuildDependencies, ['libsoup', ['libsoup']])

function! s:addDirTagFiles(dir, csprepath)
    if (filereadable(a:dir . '/tags'))
        echo a:dir . '/tags'
        execute 'set tags+=' . a:dir . '/tags'
    endif
    if (filereadable(a:dir . '/cscope.out'))
        if empty(a:csprepath)
            echo a:dir . '/cscope.out'
        else
            echo a:dir . '/cscope.out [pre-path:' . a:csprepath . ']'
        endif
        let l:cmd = 'cs add ' . a:dir . '/cscope.out ' . a:csprepath
        execute  l:cmd
    endif
endfunction

"webkit tags(absolute path, it doesn't need pre-path)
call s:addDirTagFiles(s:webkitoutdir, '')

for s:item in s:jhbuildDependencies
    let s:dir = s:item[0]
    "echo s:dir

    let s:itemRootDir = s:dependenciesSrc . '/' . s:dir
    call s:addDirTagFiles(s:itemRootDir, s:itemRootDir)
    execute 'set path+=' . s:itemRootDir

    for s:subdir in s:item[1]
        "echo ' '.s:subdir
        let s:itemTagDir = s:dependenciesSrc . '/' . s:dir . '/'. s:subdir
        call s:addDirTagFiles(s:itemTagDir, s:itemRootDir)
    endfor
endfor


"path include
let s:WebCore = s:webkitSrc . '/Source/WebCore'
let s:WebInspectorUI = s:webkitSrc . '/Source/WebInspectorUI'
let s:WebKit = s:webkitSrc . '/Source/WebKit/gtk'
let s:WebKit2 = s:webkitSrc . '/Source/WebKit2'
let s:source = s:webkitSrc . '/Source'
let s:wtf = s:webkitSrc . '/Source/WTF'
let s:wtf_port = s:webkitSrc . '/Source/WTF/wtf'


"webcore_cppflags += 
execute 'set path+=' . s:webkitSrc . '/Source/ThirdParty/ANGLE/src'
execute 'set path+=' . s:webkitSrc . '/Source/ThirdParty/ANGLE/include'
execute 'set path+=' . s:webkitSrc . '/Source/ThirdParty/ANGLE/include/GLSLANG'
execute 'set path+=' . s:webkitSrc . '/Source/ThirdParty/ANGLE/include/KHR'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/battery'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/filesystem'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/gamepad'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/geolocation'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/indexeddb'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/indexeddb/leveldb'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/indieui'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/mediasource'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/mediastream'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/navigatorcontentutils'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/notifications'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/proximity'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/quota'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/webaudio'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/webdatabase'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/Modules/websockets'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/accessibility'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bindings'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bindings/generic'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bindings/js'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bridge'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bridge/c'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/bridge/jsc'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/css'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/dom'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/dom/default'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/editing'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/fileapi'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/history'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html/canvas'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html/forms'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html/parser'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html/shadow'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/html/track'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/inspector'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/appcache'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/archive'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/archive/mhtml'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/cache'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/icon'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/mathml'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/page'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/page/animation'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/page/scrolling'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/animation'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/audio'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/cpu/arm'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/cpu/arm/filters/'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/filters'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/filters/texmap'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/freetype'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/gpu'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/harfbuzz'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/harfbuzz/ng'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/opengl'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/opentype'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/transforms'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/bmp'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/gif'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/ico'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/jpeg'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/png'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/image-decoders/webp'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/leveldb'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/linux'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/mediastream'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/mediastream/gstreamer'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/mock'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/network'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/network/gtk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/sql'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/text'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/text/transcoder'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/win'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/plugins'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/plugins/win'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/rendering'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/rendering/mathml'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/rendering/shapes'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/rendering/style'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/rendering/svg'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/storage'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/style'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/svg'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/svg/animation'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/svg/graphics'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/svg/graphics/filters'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/svg/properties'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/testing'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/testing/js'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/websockets'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/workers'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/xml'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/xml/parser'
execute 'set path+=' . s:webkitSrc . '/WebCore/bindings/js'
execute 'set path+=' . s:webkitSrc . '/DerivedSources/WebCore'
execute 'set path+=' . s:webkitSrc . '/DerivedSources'
execute 'set path+=' . s:webkitSrc . '/DerivedSources/JavaScriptCore'

execute 'set path+=' . s:webkitSrc . '/Source/WebCore/accessibility/atk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/loader/gtk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/page/gtk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/cairo'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/audio/gstreamer'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/cairo'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/freetype'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/glx'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/harfbuzz'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/harfbuzz/ng'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/egl'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/gstreamer'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/graphics/gtk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/gtk'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/network/soup'
execute 'set path+=' . s:webkitSrc . '/Source/WebCore/platform/text/enchant'

execute 'set path+=' . s:WebCore . '/bindings'
execute 'set path+=' . s:WebCore . '/bindings/gobject'
execute 'set path+=' . s:WebKit
execute 'set path+=' . s:WebKit . '/WebCoreSupport'
execute 'set path+=' . s:WebKit . '/webkit'

"$(GENSOURCES_WEBKIT)
"$(GENSOURCES_WEBKITDOM)
