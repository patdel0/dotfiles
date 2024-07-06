return {
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim"
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", mode = { "n" }, desc = "Open Neogit" }
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true
        }
      }
    end
  }
}
