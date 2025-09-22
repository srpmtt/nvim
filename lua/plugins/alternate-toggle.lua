return {
  "rmagatti/alternate-toggler",
  event = "BufReadPost",
  config = function()
    require("alternate-toggler").setup {
      alternates = {
        ["true"] = "false",
        ["True"] = "False",
        ["TRUE"] = "FALSE",
        ["Yes"] = "No",
        ["YES"] = "NO",
        ["enabled"] = "disabled",
        ["Enabled"] = "Disabled",
        ["ENABLED"] = "DISABLED",
        ["on"] = "off",
        ["On"] = "Off",
        ["ON"] = "OFF",
        ["1"] = "0",
        ["<"] = ">",
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ['"'] = "'",
        ['""'] = "''",
        ["+"] = "-",
        ["=="] = "!=",
        ["==="] = "!==",
        ["&&"] = "||",
        ["||"] = "&&",
      },
    }
  end,
}
