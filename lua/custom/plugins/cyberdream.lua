return {
  'scottmckendry/cyberdream.nvim',
  priority = 1000,
  config = function ()
    vim.opt.termguicolors = true
    require('cyberdream').setup({
      transparent = true,
    })
    vim.cmd.colorscheme('cyberdream')
  end
}
