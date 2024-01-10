require("plugins")

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

vim.g.gitgutter_max_signs = -1   -- default value (otherwise)

vim.cmd.colorscheme('kanagawa')

require("defaults")
require("keybindings")

