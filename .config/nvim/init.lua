print("Neovim Config")

require("config.lazy")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.textwidth = 80
--TODO: clipboard set
--vim.opt.clipboard = "unnamedplus"
vim.diagnostic.enable()

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- LSP keymaps
-- vim.keymap.set("n", )

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('cs-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = '',
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
  end,
})

-- Terminal stuff
local job_id
vim.keymap.set("n", "<space>ter", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 8)

  job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>test", function()
  vim.fn.chansend(job_id, { "echo 'hi'\r\n" })
end)

-- Diagnostic setup
vim.diagnostic.config({ virtual_text = true })
vim.api.nvim_create_user_command(
  'ToggleDiagnosticVirtualText',
  function()
    if vim.diagnostic.config().virtual_text then
      vim.diagnostic.config({ virtual_text = false })
    else
      vim.diagnostic.config({ virtual_text = true })
    end
  end,
  {}
)

vim.api.nvim_create_user_command(
  'ToggleDiagnostic',
  function()
    if vim.diagnostic.is_enabled() then
      vim.diagnostic.enable(false)
    else
      vim.diagnostic.enable()
    end
  end,
  {}
)

--vim.keymap.set('n', '<Leader>tvt', ':lua vim.cmd("ToggleDiagnosticVirtualText")<CR>')
--vim.keymap.set('n', '<Leader>td', ':lua vim.cmd("ToggleDiagnostic")<CR>')
