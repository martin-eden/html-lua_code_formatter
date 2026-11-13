package.path = package.path .. ';../../?.lua'
require('workshop.base')

local create_server
do
  local server_config
  do
    local files_plugin
    do
      local files_config = { location = './' }
      files_plugin = require('pegasus.plugins.files'):new(files_config)
    end
    local add_to_list = request('!.concepts.list.add_item')
    server_config =
      { host = '127.0.0.1', port = '1025', plugins = { } }
    add_to_list(server_config.plugins, files_plugin)
  end
  local pegasus = require('pegasus')
  create_server =
    function()
      return pegasus:new(server_config)
    end
end

local server = create_server()
server:start()
