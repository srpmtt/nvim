return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  config = function()
    local dap_config_file = vim.fn.getcwd() .. "/.nvim/dap.lua"
    local project_dap = nil

    if vim.fn.filereadable(dap_config_file) == 1 then
      project_dap = dofile(dap_config_file)
    end

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

    -- BASH
    dap.adapters.bashdb = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
      name = "bashdb",
    }

    local is_mac = vim.loop.os_uname().sysname == "Darwin"
    local bash_path = is_mac and "/opt/homebrew/bin/bash" or "/bin/bash"

    dap.configurations.sh = {
      {
        type = "bashdb",
        request = "launch",
        name = "launch",
        showDebugOutput = true,
        pathBashdb = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
        pathBashdbLib = vim.fn.stdpath "data" .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
        trace = true,
        file = "${file}",
        program = "${file}",
        cwd = "${workspaceFolder}",
        pathCat = "cat",
        pathBash = bash_path,
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        args = {},
        env = {},
        terminalKind = "integrated",
      },
    }

    -- C
    dap.adapters.codelldb = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/codelldb",
    }

    dap.configurations.c = {
      {
        name = "launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- DOTNET
    dap.adapters.coreclr = project_dap and project_dap.dap.adapters.coreclr
      or {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }

    dap.configurations.cs = project_dap and project_dap.dap.configurations.cs
      or {
        {
          type = "coreclr",
          name = "launch",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
        {
          type = "coreclr",
          name = "attach",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }

    -- GO
    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    dap.configurations.go = {
      {
        type = "go",
        name = "launch",
        request = "launch",
        program = "${file}",
      },
      {
        type = "go",
        name = "launch test",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      {
        type = "go",
        name = "launch test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }

    -- JAVASCRIPT
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}" },
      },
    }

    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    -- LUA
    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath "data" .. "/mason/packages/local-lua-debugger-vscode/extension/extension/debugAdapter.js",
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          c.extensionPath = vim.fn.stdpath "data"
            .. "/mason/packages/local-lua-debugger-vscode/extension/extension/debugAdapter.js"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }

    dap.configurations.lua = {
      {
        name = "launch",
        type = "local-lua",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = {
          lua = "lua",
          file = "${file}",
        },
        args = {},
      },
    }

    -- PYTHON
    dap.adapters.python = function(cb, config)
      if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb {
          type = "server",
          port = assert(port, "`connect.port` is required for a python `attach` configuration"),
          host = host,
          options = {
            source_filetype = "python",
          },
        }
      else
        cb {
          type = "executable",
          command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
          args = { "-m", "debugpy.adapter" },
          options = {
            source_filetype = "python",
          },
        }
      end
    end

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "launch",
        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "launch test",
        module = "pytest",
        args = { "${file}" },
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }

    -- RUST
    dap.adapters.codelldb = {
      type = "server",
      port = 13000,
      executable = {
        command = vim.fn.stdpath "data" .. "/mason/packages/codelldb/codelldb",
        args = { "--port", "13000" },
      },
    }

    dap.configurations.rust = {
      {
        name = "launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        args = {},
      },
      {
        name = "launch test",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}-test",
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        args = {},
      },
      {
        name = "launch test (specific test)",
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
  end,
}
