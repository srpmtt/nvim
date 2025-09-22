return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      event = "VeryLazy",
    },
    {
      "nvim-neotest/nvim-nio",
      event = "VeryLazy",
    },
  },
  config = function()
    require("dapui").setup {
      expand_lines = true,
      icons = { expanded = "", collapsed = "", circular = "" },
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.8 },
            { id = "watches", size = 0.2 },
            { id = "repl", size = 0 },
          },
          size = 0.20,
          position = "right",
        },
        -- {
        --   elements = {
        --     { id = "repl", size = 0 },
        --   },
        --   size = 2,
        --   position = "bottom",
        -- },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.9,
        border = "rounded",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      controls = {
        enabled = vim.fn.exists "+winbar" == 1,
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
          disconnect = "",
        },
      },
      render = {
        max_type_length = nil,
        max_value_lines = 100,
        indent = 1,
      },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    local dap, dapui = require "dap", require "dapui"
    dap.listeners.before.attach.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
