return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    local dap = require "dap"

    local dap_ui_status_ok, dapui = pcall(require, "dapui")
    if not dap_ui_status_ok then
      return
    end

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- DOTNET
    dap.adapters.coreclr = {
      type = 'executable',
      command = 'netcoredbg',
      args = { '--interpreter=vscode' },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch",
        request = "launch",
        program = function()
          return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end
      },
      {
        type = "coreclr",
        name = "attach",
        request = "attach",
        processId = require("dap.utils").pick_process
      },
    }

    -- GO
    dap.adapters.go = {
      type = 'server',
      port = '${port}',
      executable = {
        command = "dlv",
        args = { 'dap', '-l', '127.0.0.1:${port}' },
      }
    }

    dap.configurations.go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}"
      },
      {
        type = "go",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
      },
      {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
      }
    }

    -- PYTHON
    dap.adapters.python = function(cb, config)
      if config.request == 'attach' then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or '127.0.0.1'
        cb({
          type = 'server',
          port = assert(port, '`connect.port` is required for a python `attach` configuration'),
          host = host,
          options = {
            source_filetype = 'python',
          },
        })
      else
        cb({
          type = 'executable',
          command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        })
      end
    end

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      },
      {
        type = 'python',
        request = 'launch',
        name = "Launch test",
        module = "pytest",
        args = { "${file}" },
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      },
    }

    -- RUST
    dap.adapters.codelldb = {
      type = 'server',
      port = 13000,
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb",
        args = { "--port", "13000" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Debug",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        args = {},
      },
      {
        name = "Debug test",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}-test",
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        args = {},
      },
      {
        name = "Debug test (specific test)",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}-test",
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        args = { "--test", "${input:testName}" },
        input = {
          testName = {
            type = "string",
            description = "Enter the name of the test to run",
          },
        },
      },
    }
  end
}
