return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim", -- Add the file browser extension
  },
  keys = {
    -- Add a keymap to open the file browser
    {
      "<leader>sB",
      ":Telescope file_browser path=%:p:h<CR>",
      desc = "Browse Files",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts) -- Setup main Telescope
    -- Load the file browser extension
    telescope.load_extension("file_browser")
  end,
}
