local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

local M = {}

function M.setup()
    bufferline.setup {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
            },
            show_close_icon = false,
        },
    }
end

return M
