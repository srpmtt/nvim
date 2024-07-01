return {
  "chrisgrieser/nvim-rip-substitute",
  event = "VeryLazy",
  config = function()
    require("rip-substitute").setup {
      popupWin = {
        border = "single",
        matchCountHlGroup = "Keyword",
        noMatchHlGroup = "ErrorMsg",
        hideSearchReplaceLabels = false,
        position = "top",
      },
      prefill = {
        normal = "cursorWord",
        visual = "selectionFirstLine",
        startInReplaceLineIfPrefill = false,
      },
      keymaps = {
        confirm = "<CR>",
        abort = "q",
        prevSubst = "<Up>",
        nextSubst = "<Down>",
        insertModeConfirm = "<C-CR>",
      },
      incrementalPreview = {
        matchHlGroup = "IncSearch",
        rangeBackdrop = {
          enabled = true,
          blend = 50,
        },
      },
      regexOptions = {
        pcre2 = true,
        ---@type "case-sensitive"|"ignore-case"|"smart-case"
        casing = "case-sensitive",
        autoBraceSimpleCaptureGroups = true,
      },
      editingBehavior = {
        autoCaptureGroups = false,
      },
      notificationOnSuccess = true,
    }
  end
}
