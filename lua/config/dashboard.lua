local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local M = {}

function M.setup()
  db.custom_center = {
    { icon = '  ',
      desc = 'Recent files                            ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f r' },
    { icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f' },
    { icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f w' },
  }
  db.custom_header = {
    [[            ▄▄▄▄▄▄▄▄▄            ]],
    [[          ▄█████████████▄          ]],
    [[  █████  █████████████████  █████  ]],
    [[  ▐████▌ ▀███▄       ▄███▀ ▐████▌  ]],
    [[    █████▄  ▀███▄   ▄███▀  ▄█████    ]],
    [[    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ]],
    [[    ███▄▀███▄  ▀███▀  ▄███▀▄███    ]],
    [[    ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ]],
    [[      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ]],
    [[      ▀███▄▀██ █████ ██▀▄███▀      ]],
    [[      █▄ ▀█████ █████ █████▀ ▄█      ]],
    [[      ███        ███        ███      ]],
    [[      ███▄    ▄█ ███ █▄    ▄███      ]],
    [[      █████ ▄███ ███ ███▄ █████      ]],
    [[      █████ ████ ███ ████ █████      ]],
    [[      █████ ████▄▄▄▄▄████ █████      ]],
    [[      ▀███ █████████████ ███▀      ]],
    [[        ▀█ ███ ▄▄▄▄▄ ███ █▀        ]],
    [[           ▀█▌▐█████▌▐█▀            ]],
    [[              ███████              ]],
    [[]],
    [[]],
  }

end

return M
