fx_version 'cerulean'
game 'gta5'

author 'Ian'
description 'Laptop plugin for Fivem'
version '1.0.0'

-- What to run
client_scripts {
    'client.lua',
    'client_two.lua'
}

server_script 'server.lua'

ui_page 'ui/public/index.html'

files {
    'ui/public/index.html'
}
