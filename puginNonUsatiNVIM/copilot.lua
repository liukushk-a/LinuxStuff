return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter", -- lo carica quando entri in modalità inserimento
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>", -- oppure usa <C-l>, come preferisci
        },
      },
      panel = { enabled = false },
    })
  end,
}
