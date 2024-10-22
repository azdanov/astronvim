-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      background = {
        light = "latte",
        dark = "macchiato",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local astrocore, astroui = require "astrocore", require "astroui"
      local function truncate(str, len)
        if not str then return end
        local truncated = vim.fn.strcharpart(str, 0, len)
        return truncated == str and str or truncated .. astroui.get_icon "Ellipsis"
      end

      if not opts.formatting then opts.formatting = {} end
      opts.formatting.format = astrocore.patch_func(opts.formatting.format, function(format, ...)
        local vim_item = format(...)
        vim_item.menu = truncate(vim_item.menu, math.floor(0.2 * vim.o.columns))
        return vim_item
      end)
    end,
  },
}
