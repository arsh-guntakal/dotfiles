-- Misc. small plugins 
return {
	--- Make comments work like VSCode basically
	{
        'numToStr/Comment.nvim',
        opts = {
            toggler = { line = '<C-/>' },
            opleader = { line = '<C-/>' },
            mappings = { extra = false },
            post_hook = function(ctx)
                if ctx.cmotion == require('Comment.utils').cmotion.v or
                    ctx.cmotion == require('Comment.utils').cmotion.V then
                    vim.cmd('norm! gv')
                end
            end
        }
    },
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            log_level = 'error',
            auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/'
        }
    },	
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            file_types = { 'markdown' }
        }
    }
}
