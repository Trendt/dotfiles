local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- TODO! everything

-- for dap-setups: https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
--

local select_file = coroutine.create(function(coro)
  local opts = {}
  pickers
      .new(opts, {
        prompt_title = "Path to executable",
        finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(buffer_number)
          actions.select_default:replace(function()
            actions.close(buffer_number)
            coroutine.resume(coro, action_state.get_selected_entry()[1])
          end)
          return true
        end,
      })
      :find()
end)

return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    local dap_ui = require("dapui").setup()
    -- adapters
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = 'cppdbg',
    }

    dap.configurations.rust = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        program = select_file,
        initCommands = function()
          -- Find out where to look for the pretty printer Python module.
          local rustc_sysroot = vim.fn.trim(vim.fn.system 'rustc --print sysroot')
          assert(
            vim.v.shell_error == 0,
            'failed to get rust sysroot using `rustc --print sysroot`: '
            .. rustc_sysroot
          )
          local script_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py'
          local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

          -- The following is a table/list of lldb commands, which have a syntax
          -- similar to shell commands.
          --
          -- To see which command options are supported, you can run these commands
          -- in a shell:
          --
          --   * lldb --batch -o 'help command script import'
          --   * lldb --batch -o 'help command source'
          --
          -- Commands prefixed with `?` are quiet on success (nothing is written to
          -- debugger console if the command succeeds).
          --
          -- Prefixing a command with `!` enables error checking (if a command
          -- prefixed with `!` fails, subsequent commands will not be run).
          --
          -- NOTE: it is possible to put these commands inside the ~/.lldbinit
          -- config file instead, which would enable rust types globally for ALL
          -- lldb sessions (i.e. including those run outside of nvim). However,
          -- that may lead to conflicts when debugging other languages, as the type
          -- formatters are merely regex-matched against type names. Also note that
          -- .lldbinit doesn't support the `!` and `?` prefix shorthands.
          return {
            ([[!command script import '%s']]):format(script_file),
            ([[command source '%s']]):format(commands_file),
          }
        end,
      },
    }

    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>do", dap.step_over)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>da", dap.step_out)
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader>dr", dap.repl.open)
  end
}
