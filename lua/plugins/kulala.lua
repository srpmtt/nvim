return {
  "mistweaverco/kulala.nvim",
  event = "VeryLazy",
  config = function()
    vim.filetype.add {
      extension = {
        ["http"] = "http",
      },
    }
    require("kulala").setup {
      display_mode = "float",
      split_direction = "vertical",
      default_view = "headers_body",
      default_env = "dev",
      debug = false,
      contenttypes = {
        ["application/json"] = {
          ft = "json",
          formatter = { "jq", "." },
          pathresolver = require("kulala.parser.jsonpath").parse,
        },
        ["application/xml"] = {
          ft = "xml",
          formatter = { "xmllint", "--format", "-" },
          pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
        },
        ["text/html"] = {
          ft = "html",
          formatter = { "xmllint", "--format", "--html", "-" },
          pathresolver = {},
        },
      },
      show_icons = "on_request",
      icons = {
        inlay = {
          loading = "",
          done = "",
          error = "",
        },
        lualine = "🐼",
      },
      additional_curl_options = {},
      scratchpad_default_contents = {
        "@MY_TOKEN_NAME=my_token_value",
        "",
        "# @name scratchpad",
        "POST https://httpbin.org/post HTTP/1.1",
        "accept: application/json",
        "content-type: application/json",
        "",
        "{",
        '  "foo": "bar"',
        "}",
      },
      winbar = false,
      vscode_rest_client_environmentvars = false,
    }
  end,
}
