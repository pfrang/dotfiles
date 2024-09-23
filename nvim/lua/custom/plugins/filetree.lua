-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    config = function()
        require('neo-tree').setup {
            close_if_last_window = true,
            window = {
                mappings = {
                    ['P'] = { 'toggle_preview', config = { use_float = false, use_image_nvim = true } },
                    ['<F5>'] = 'refresh',
                    ["<bs>"] = "navigate_up",
                },
            },
            filesystem = {
                use_libuv_file_watcher = true,
                bind_to_cwd = false,
                hijack_netrw_behavior = "disabled",
                follow_current_file = {
                    enabled = true,
                },
                filtered_items = {
                    visible = true,
                },
            },
        }
    end,
}
