vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
   callback = function()
      vim.hl.on_yank()
   end,
})

vim.api.nvim_set_hl(0, "DiagnosticLineError", { bg = "#321614" })
vim.api.nvim_set_hl(0, "DiagnosticLineWarn", { bg = "#6a6748" })
vim.api.nvim_set_hl(0, "DiagnosticLineInfo", { bg = "#1f2f3c" })
vim.api.nvim_set_hl(0, "DiagnosticLineHint", { bg = "#1f3c2f" })

-- Namespace for line highlights
local ns = vim.api.nvim_create_namespace("diagnostic_line_highlight")

-- Autocmd to apply highlights on diagnostics change
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
  callback = function(args)
    local bufnr = args.buf or vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

    for _, diagnostic in ipairs(vim.diagnostic.get(bufnr)) do
      local hl_group = ({
        [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
        [vim.diagnostic.severity.WARN]  = "DiagnosticLineWarn",
        [vim.diagnostic.severity.INFO]  = "DiagnosticLineInfo",
        [vim.diagnostic.severity.HINT]  = "DiagnosticLineHint",
      })[diagnostic.severity]

      if hl_group then
        -- Highlight the entire line using extmark
        vim.api.nvim_buf_set_extmark(bufnr, ns, diagnostic.lnum, 0, {
          end_line = diagnostic.lnum + 1,
          hl_group = hl_group,
          hl_eol = true, -- highlight full line to EOL
        })
      end
    end
  end,
})
