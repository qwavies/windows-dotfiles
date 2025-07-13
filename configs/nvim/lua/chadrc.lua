---@type ChadrcConfig
local M = {}

-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

local comment_style = {
  italic = false,
  fg  = "#BBBBBB",
  bg = "grey",
}

local visual_highlight = {
  bg = "#606a6b"
}

M.base46 = {
	theme = "catppuccin",
  transparency = true,

	hl_override = {
		Comment = comment_style,
    ["@comment"] = comment_style,
    Visual = visual_highlight,

    LineNr = { fg = "#BBBBBB" },
    CursorLineNr = {
      fg = "#cfd3ff",
      bold = true
    },

    FloatBorder = { fg = "#cfd3ff" },
    NormalFloat = { bg = "#444444" },
    TelescopeBorder = { fg = "#cfd3ff" },
    Pmenu = { bg = "#444444" },
	},
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
