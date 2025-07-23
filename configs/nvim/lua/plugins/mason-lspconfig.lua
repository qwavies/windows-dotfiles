-- NOTE: add new servers here.
-- Will be installed automatically
local installed_servers = {
   "lua_ls",
   "clangd",
   "pyright",
   "rust_analyzer",
}

-- NOTE: NVChad-esque diagnostics
local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
   virtual_text = {
      prefix = function(diagnostic)
         local icons = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = " ",
         }
         return icons[diagnostic.severity] or "●"
      end,

      spacing = 2,
   },
   signs = false,
   underline = true,
   update_in_insert = false,
   severity_sort = true,
})

local mason = {
   "mason-org/mason.nvim",
   opts = {
      ui = {
         icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
         }
      }
   }
}

local lspconfig = {
   "neovim/nvim-lspconfig",
   config = function()
      -- TODO: look more into this idk if needed
      -- require("lspconfig").lua_ls.setup{}
   end
}

local lazydev = {
   "folke/lazydev.nvim",
   ft = "lua", -- only load on lua files
   opts = {
      library = {
         -- See the configuration section for more details
         -- Load luvit types when the `vim.uv` word is found
         { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
   },
}

return {
   "mason-org/mason-lspconfig.nvim",
   event = "VeryLazy",
   -- event = { "BufReadPre", "BufNewFile" },
   opts = {},
   dependencies = {
      mason,
      lspconfig,
      lazydev,
   },
   config = function()
      require("mason-lspconfig").setup({
         ensure_installed = installed_servers,
         automatic_installation = true,
      })
   end
}
