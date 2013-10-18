let s:glibSrc='/var/workroom/webkit/WebKitBuild/Dependencies/Source/glib'

set path=.,,

execute 'set path+=' . s:glibSrc
execute 'set path+=' . s:glibSrc . '/glib'
"execute 'set path+=' . s:glibSrc . '/gobject'


