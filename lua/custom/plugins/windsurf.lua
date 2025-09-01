-- Needed to properly toggle codeium
local codeium_enabled = false

-- function to toggle codeium_enabled
local function toggle_codeium()
  codeium_enabled = not codeium_enabled
  if codeium_enabled then
    vim.cmd('CodeiumEnable')
  else
    vim.cmd('CodeiumDisable')
  end
end

return {
  'Exafunction/windsurf.vim',
  config = function()
    vim.g.codeium_enabled = false
    -- Example: Change Codeium keymaps
    vim.g.codeium_disable_bindings = 1 -- Disable default keybindings

    -- Set custom keybindings
    vim.keymap.set('i', '<C-a>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('n', '<C-A-K>', function()
      return vim.fn['codeium#Chat']()
    end, { noremap = true, silent = true })
    vim.keymap.set('i', '<C-j>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })


    -- Toggle codeium
    vim.keymap.set('n', '<Leader>tc', toggle_codeium, { noremap = true, silent = true })


  end,
}
