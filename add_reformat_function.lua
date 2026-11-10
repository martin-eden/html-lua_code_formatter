local dom = require('js')

local set_field =
  function(field_name, data_str)
    dom.global.document:getElementById(field_name).value = data_str
  end

local get_field =
  function(field_name)
    return dom.global.document:getElementById(field_name).value
  end

local reformat
do
  local reformat_lua = request('reformat')
  reformat =
    function()
      set_field('input', reformat_lua(get_field('input')))
    end
end

dom.global.reformat = reformat
