return {
   {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
      },
      config = function()
         local cmp = require("cmp")

         cmp.setup({
            -- snippet = {
            --    expand = function(_) end, -- disables snippets
            -- },
            mapping = cmp.mapping.preset.insert({
               ["<C-j>"] = cmp.mapping.select_next_item(),
               ["<C-k>"] = cmp.mapping.select_prev_item(),
               ["<Tab>"] = cmp.mapping.confirm({ select = true }),
               ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "buffer" },
               { name = "path" },
            }),
            window = {
               -- completion = {
               --    border = "rounded",
               --    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
               -- },
               -- documentation = {
               --    border = "rounded",
               -- }
            },
            experimental = {
               ghost_text = true,
               native_menu = false,
            }
         })

         cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = "buffer" },
            },
         })

         cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
               { name = "path" },
            }, {
               { name = "cmdline" },
            }),
         })
      end,
   },
}
