
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
server_scripts {
    'config.lua',
    'server.lua',
    '@mysql-async/lib/MySQL.lua'
}
client_scripts {
    'config.lua',
    'client.lua'
}

files {
    'html/style.css',
    'html/script.js',
    'html/index.html'
}
files {
	'data/[D3sBlueSideRunners]/vehicles.meta',
	'data/[D3sBlueSideRunners]/carcols.meta',
	'data/[D3sBlueSideRunners]/carvariations.meta',
}

data_file 'VEHICLE_METADATA_FILE' 'data/[D3sBlueSideRunners]/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/[D3sBlueSideRunners]/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/[D3sBlueSideRunners]/carvariations.meta'
files {
	'data/[lightbar]/vehicles.meta',
	'data/[lightbar]/carcols.meta',
	'data/[lightbar]/carvariations.meta',
}

data_file 'VEHICLE_METADATA_FILE' 'data/[lightbar]/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/[lightbar]/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/[lightbar]/carvariations.meta'


ui_page {
    'html/index.html'
}


