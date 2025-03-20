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


    local function tabs_component()
      local tabpages = vim.api.nvim_list_tabpages()
      local current_tab = vim.api.nvim_get_current_tabpage()
      local tab_count = #tabpages
      local tab_numbers = {}

      for index, tab in ipairs(tabpages) do
        if tab == current_tab then
          table.insert(tab_numbers, "[" .. tostring(index) .. "]")
        else
          table.insert(tab_numbers, tostring(index))
        end
      end

      if tab_count > 1 then
        return table.concat(tab_numbers, " ")
      else
        return ""
      end
    end


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
        lualine_c = { tabs_component, diagnostics },
        lualine_x = { diff },
        lualine_y = { { "filename", path = 1 } },
        lualine_z = { location },
      },
    }
  end
}
