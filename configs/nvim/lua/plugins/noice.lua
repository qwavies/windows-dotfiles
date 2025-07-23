return {
   "folke/noice.nvim",
   event = "VeryLazy",
   dependencies = {
      "muniftanjim/nui.nvim",
      {
         "rcarriga/nvim-notify",
         config = function ()
            require("notify").setup({
               stages = "static", -- fade, slide, static
               timeout = 3000, -- ms
               merge_duplicates = true,

               background_colour = "#444444",
               -- background_colour = "normal",

               icons = {
                  error = "",
                  warn  = "",
                  info  = "",
                  debug = "",
                  trace = "✎",
               },

               minimum_width = 5,
               max_width = 50,
               max_height = 6,
               render = "minimal", -- minimal, compact
               top_down = true,

            })
            vim.notify = require("notify")
         end
      }
   },
   opts = {
      cmdline = {
         -- enabled = false,
         view = "cmdline",
         format = {
            -- cmdline = { pattern = "^:", icon = ":", lang = "vim" },
            cmdline = false,
            search_down = false,
            search_up = false,
            filter = false,
            lua = false,
            help = false,
            input = false, -- used by input()
            -- lua = false, -- to disable a format, set to `false`
         },
      },
      lsp = {
         progress = { enabled = false }
      },
   },
}

-- return {
--    "rcarriga/nvim-notify",
--    event = "verylazy",
--    config = function ()
--       require("notify").setup({
--          stages = "static", -- fade, slide, static
--          timeout = 3000, -- ms
--          merge_duplicates = true,
--
--          background_colour = "#444444",
--          -- background_colour = "normal",
--
--          icons = {
--             error = "",
--             warn  = "",
--             info  = "",
--             debug = "",
--             trace = "✎",
--          },
--
--          minimum_width = 40,
--          max_width = 60,
--          render = "minimal", -- minimal, compact
--          top_down = true,
--
--       })
--       vim.notify = require("notify")
--    end
-- }
