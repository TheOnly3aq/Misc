
author "Vroom"
description "Vroom's Miscellaneous scripts (VMS)"
version "1.2.0"
repository 'https://github.com/theonly3aq'

fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "shared/*.lua",
    "@ox_lib/init.lua"
}

server_scripts {
    "server/*.lua",
    "@oxmysql/lib/MySQL.lua"
}

client_scripts {
    "client/*.lua",
}

ui_page {
    'html/index.html',
}
files {
    'html/index.html',
    'html/*.css',
    'html/*.js',
}

exports {
    "StartLockPickCircle"
}

dependency "oxmysql"