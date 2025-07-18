return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000", -- Background color override
          mantle = "#1e1e2e", -- Darker background
          crust = "#11111b", -- Darkest background
          -- You can override any color from the palette
          -- blue = "#89b4fa",
          -- lavender = "#b4befe",
          -- sapphire = "#74c7ec",
          -- sky = "#89dceb",
          -- teal = "#94e2d5",
          -- green = "#a6e3a1",
          -- yellow = "#f9e2af",
          -- peach = "#fab387",
          -- maroon = "#eba0ac",
          -- red = "#f38ba8",
          -- mauve = "#cba6f7",
          -- pink = "#f5c2e7",
          -- flamingo = "#f2cdcd",
          -- rosewater = "#f5e0dc",
        },
      },
      custom_highlights = function(colors)
        return {
          -- Example custom highlights
          Comment = { fg = colors.overlay1, style = { "italic" } },
          LineNr = { fg = colors.overlay0 },
          CursorLineNr = { fg = colors.lavender },
          -- Override specific syntax groups
          ["@variable"] = { fg = colors.text },
          ["@function"] = { fg = colors.blue },
          ["@keyword"] = { fg = colors.mauve, style = { "italic" } },
          ["@string"] = { fg = colors.green },
          ["@number"] = { fg = colors.peach },
          ["@boolean"] = { fg = colors.peach },
          ["@type"] = { fg = colors.yellow },
          ["@constant"] = { fg = colors.peach },
          -- LSP highlights
          ["@lsp.type.class"] = { fg = colors.yellow },
          ["@lsp.type.decorator"] = { fg = colors.mauve },
          ["@lsp.type.enum"] = { fg = colors.yellow },
          ["@lsp.type.enumMember"] = { fg = colors.teal },
          ["@lsp.type.function"] = { fg = colors.blue },
          ["@lsp.type.interface"] = { fg = colors.yellow },
          ["@lsp.type.macro"] = { fg = colors.teal },
          ["@lsp.type.method"] = { fg = colors.blue },
          ["@lsp.type.namespace"] = { fg = colors.yellow },
          ["@lsp.type.parameter"] = { fg = colors.maroon },
          ["@lsp.type.property"] = { fg = colors.teal },
          ["@lsp.type.struct"] = { fg = colors.yellow },
          ["@lsp.type.type"] = { fg = colors.yellow },
          ["@lsp.type.typeParameter"] = { fg = colors.maroon },
          ["@lsp.type.variable"] = { fg = colors.text },
          -- Plugin-specific highlights
          TelescopeNormal = { bg = colors.mantle },
          TelescopeBorder = { fg = colors.blue },
          TelescopePromptNormal = { bg = colors.surface0 },
          TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
          TelescopePromptTitle = { fg = colors.pink },
          TelescopePreviewTitle = { fg = colors.green },
          TelescopeResultsTitle = { fg = colors.lavender },
          -- NvimTree highlights
          NvimTreeNormal = { bg = colors.mantle },
          NvimTreeFolderIcon = { fg = colors.blue },
          NvimTreeRootFolder = { fg = colors.pink },
          NvimTreeSpecialFile = { fg = colors.yellow },
          NvimTreeExecFile = { fg = colors.green },
          NvimTreeOpenedFile = { fg = colors.pink },
          -- Lualine integration (if using lualine)
          -- These will be automatically applied if lualine integration is enabled
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- Add other integrations as needed
        telescope = {
          enabled = true,
          -- style = "nvchad"
        },
        lsp_trouble = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    -- Set the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
