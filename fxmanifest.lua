lua54 {'yess'}

fx_version {'cerulean'} ---Latest

games {'gta5'}

author {"Prosper"}

client_scripts{
    'client.lua'
}

shared_scripts{
    '@ox_lib/init.lua',
    'Config.lua',
    '@es_extended/imports.lua',
}

server_scripts{
	'@oxmysql/lib/MySQL.lua',
    'server.lua'
}

files{'Modules/shared/*.lua'}