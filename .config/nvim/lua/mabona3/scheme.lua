local api = vim.api;
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values;
local finders = require "telescope.finders"
local utils = require "telescope.utils"
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"

-- this is the original telescope function but I wanted to change in this function.
return function(opts)
    local before_background = vim.o.background
    local before_color = api.nvim_exec2("colorscheme", { output = true }).output
    local need_restore = not not opts.enable_preview

    local colors = opts.colors or { before_color }
    if not vim.tbl_contains(colors, before_color) then
        table.insert(colors, 1, before_color)
    end

    colors = vim.list_extend(
        colors,
        vim.tbl_filter(function(color)
            return not vim.tbl_contains(colors, color)
        end, vim.fn.getcompletion("", "color"))
    )

    -- if lazy is available, extend the colors list with unloaded colorschemes
    local lazy = package.loaded["lazy.core.util"]
    if lazy and lazy.get_unloaded_rtp then
        local paths = lazy.get_unloaded_rtp ""
        local all_files = vim.fn.globpath(table.concat(paths, ","), "colors/*", true, true)
        for _, f in ipairs(all_files) do
            local color = vim.fn.fnamemodify(f, ":t:r")
            if not vim.tbl_contains(colors, color) then
                table.insert(colors, color)
            end
        end
    end

    if opts.ignore_builtins then
        -- stylua: ignore
        local builtins = {
            "blue", "darkblue", "default", "delek", "desert", "elflord", "evening",
            "habamax", "industry", "koehler", "lunaperche", "morning", "murphy",
            "pablo", "peachpuff", "quiet", "retrobox", "ron", "shine", "slate",
            "sorbet", "torte", "unokai", "vim", "wildcharm", "zaibatsu", "zellner",
        }
        colors = vim.tbl_filter(function(color)
            return not vim.tbl_contains(builtins, color)
        end, colors)
    end

    local previewer
    if opts.enable_preview then
        -- define previewer
        local bufnr = api.nvim_get_current_buf()
        local p = api.nvim_buf_get_name(bufnr)

        -- show current buffer content in previewer
        previewer = previewers.new_buffer_previewer {
            get_buffer_by_name = function()
                return p
            end,
            define_preview = function(self)
                if vim.uv.fs_stat(p) then
                    conf.buffer_previewer_maker(p, self.state.bufnr, { bufname = self.state.bufname })
                else
                    local lines = api.nvim_buf_get_lines(bufnr, 0, -1, false)
                    api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
                end
            end,
        }
    end

    local picker = pickers.new(opts, {
        prompt_title = "Change Colorscheme",
        finder = finders.new_table {
            results = colors,
        },
        sorter = conf.generic_sorter(opts),
        previewer = previewer,
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if selection == nil then
                    utils.__warn_no_selection "builtin.colorscheme"
                    return
                end

                need_restore = false
                actions.close(prompt_bufnr)
                if opts.func then
                else
                    vim.cmd.colorscheme(selection.value);
                    opts.func(selection.value);
                end
            end)
            return true
        end,
        on_complete = {
            function()
                local selection = action_state.get_selected_entry()
                if selection == nil then
                    utils.__warn_no_selection "builtin.colorscheme"
                    return
                end
                if opts.enable_preview then
                    vim.cmd.colorscheme(selection.value)
                end
            end,
        },
    })

    if opts.enable_preview then
        -- rewrite picker.close_windows. restore color if needed
        local close_windows = picker.close_windows
        picker.close_windows = function(status)
            close_windows(status)
            if need_restore then
                vim.o.background = before_background
                vim.cmd.colorscheme(before_color)
            end
        end

        -- rewrite picker.set_selection so that color schemes can be previewed when the current
        -- selection is shifted using the keyboard or if an item is clicked with the mouse
        local set_selection = picker.set_selection
        picker.set_selection = function(self, row)
            set_selection(self, row)
            local selection = action_state.get_selected_entry()
            if selection == nil then
                utils.__warn_no_selection "builtin.colorscheme"
                return
            end
            if opts.enable_preview then
                vim.cmd.colorscheme(selection.value)
            end
        end
    end

    picker:find()
end
