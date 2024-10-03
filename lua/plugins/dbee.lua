return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "muniftanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup {
      sources = {
        require("dbee.sources").MemorySource:new({
        }),
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
      },
      drawer = {
        disable_help = true
      }
    }
  end,
}
