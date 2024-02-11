fx_version 'adamant'

game 'gta5'

description 'Provides a way for players to customise their appearence with accessories)'
lua54 'yes'

version '1.1' 
legacyversion '1.9.1'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

dependencies {
    'es_extended',
    'esx_skin',
    'esx_datastore'
}
