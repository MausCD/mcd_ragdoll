resource_manifest_version 'adamant'
games {'gta5'}

author 'MausCD'
description 'A small script that adds a chance to stumble/slip off'
version '1.0.1'

client_scripts {
    "config.lua",
    "client.lua"
}

-- server_script "startupmessage.lua"

server_scripts {
    "config.lua",
     "startupmessage.lua"
}