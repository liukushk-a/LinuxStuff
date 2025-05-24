local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    dependencies = { "zbirenbaum/copilot-cmp" },
    config = function(_, config)
      local cmp = require("cmp")
      config.sources = cmp.config.sources(vim.list_extend(config.sources, {
        {
          mapping = {
            ["<Tab>"] = vim.schedule_wrap(function(fallback)
              if cmp.visible() and has_words_before() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end),
          },
        },
      }))
    end,
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
    end,
  },
}
