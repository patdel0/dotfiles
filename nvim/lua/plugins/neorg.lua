return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  lazy = false, -- specify lazy = false because some lazy.nvim distributions set lazy = true by default
  -- tag = "*",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/code/github.com/zettelkasten/",
              daily = "~/code/github.com/zettelkasten/daily",
              private = "~/code/github.com/private-zettelkasten/",
            },
          },
        },
      },
    })
  end,
}
