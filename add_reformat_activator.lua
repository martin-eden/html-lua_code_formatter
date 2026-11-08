local dom = require('js')
local document = dom['global'].document

local set_field =
  function(field_name, data_str)
    document:getElementById(field_name).value = data_str
  end

local get_field =
  function(field_name)
    return document:getElementById(field_name).value
  end

local reformat
do
  local reformat_lua = require('reformat')
  reformat =
    function()
      set_field('input', reformat_lua(get_field('input')))
    end
end

local on_key_press =
  function(element, event)
    if event.ctrlKey and (event.key == 'Enter') then
      event:preventDefault()
      reformat()
    end
  end

local input = document:getElementById('input')
input:addEventListener('keydown', on_key_press)
