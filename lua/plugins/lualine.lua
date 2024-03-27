return {
  "nvim-lualine/lualine.nvim",
  event = { "VimEnter", "InsertEnter", "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  config = function()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      return
    end

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { warn = "W ", error = "E " },
      colored = true,
      always_visible = false,
    }

    local branch = {
      "branch",
      icons_enabled = true,
      icon = ""
    }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
      cond = hide_in_width,
    }

    local location = {
      "location",
      padding = 0,
    }

    lualine.setup {
      options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "alpha", "dashboard" },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch },
        lualine_c = { "tabs", diagnostics },
        lualine_x = { diff, "filename" },
        lualine_y = { location },
        lualine_z = { "progress" },
      },
    }
  end
}
