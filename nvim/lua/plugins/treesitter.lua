return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'bash', 'c', 'comment', 'cpp', 'java', 'json', 'lua',
                'markdown', 'markdown_inline', 'python', 'tmux', 'yaml'
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
				-- TreeSitter runs its own highlight.Turns of vim's redundant regex highlighting with TS enabled
                additional_vim_regex_highlighting = false
            },
			-- Use Treessitter indent instead of vim regex based indent
            indent = {
                enable = true
            }
        },
        config = function(_, opts)
            require('nvim-treesitter').setup(opts)
        end
    }
}
