
author "Vroom Vroom Man"
description "Vroom's Miscellaneous scripts (VMS)"
version "1.0.2"
repository 'https://github.com/theonly3aq/misc'

fx_version "cerulean"
game "gta5"
lua54 "yes"

shared_scripts {
    "shared/*.lua",
    "@ox_lib/init.lua"
}

server_scripts {
    "server/*.lua",
}

client_scripts {
    "client/*.lua",
}

exports {
    "StartLockPickCircle"
}

