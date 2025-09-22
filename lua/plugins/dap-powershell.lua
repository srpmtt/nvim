return {
  "willem-j-an/nvim-dap-powershell",
  event = "VeryLazy",
  config = function()
    require("dap-powershell").setup {
      include_configs = true,
      pwsh_executable = "pwsh",
      vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/PowerShellEditorServices/",
    }
  end,
}
