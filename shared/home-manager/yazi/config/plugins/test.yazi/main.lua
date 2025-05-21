local image = require("yazi.preview.image")

local M = {}

-- This previewer only cares about directories
M.mime   = "inode/directory"
-- Weight > the built-in directory-previewer (default is 90) so we run first
M.weight = 100


-- Return true/false telling Yazi whether we’ve handled this file
-- `ctx.file` is a yazi.fs.File object
function M:preview(ctx)
        -- Absolute path to   <dir>/folder.jpg
        local cover = ctx.file:path() .. "/folder.jpg"

        -- Quick existence check; `vim.loop.fs_stat` is available everywhere
        if vim.loop.fs_stat(cover) then
                -- Delegate the actual drawing to the stock image previewer
                -- (this automatically falls back to kitty/imgcat/ueberzugpp depending
                --  on what your Yazi was compiled with and what terminal you run.)
                return image.preview(ctx, cover)
        end

        -- Returning false tells Yazi “I didn’t draw anything, ask the next
        -- previewer in the chain” – that will fall back to the normal
        -- directory preview.
        return false
end

return M
