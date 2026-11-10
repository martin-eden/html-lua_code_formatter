local dom = require('js')
local document = dom['global'].document

local on_key_press =
  function(element, event)
    if event.ctrlKey and (event.key == 'Enter') then
      event:preventDefault()
      dom.global.reformat()
    end
  end

local input = document:getElementById('input')
input:addEventListener('keydown', on_key_press)
