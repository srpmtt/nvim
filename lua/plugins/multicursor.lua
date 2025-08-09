return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    local set = vim.keymap.set
    -- set({ "n", "v" }, "<up>",
    -- function() mc.lineAddCursor(-1) end)
    -- set({ "n", "v" }, "<down>",
    -- function() mc.lineAddCursor(1) end)
    -- set({ "n", "v" }, "<leader><up>",
    -- function() mc.lineSkipCursor(-1) end)
    -- set({ "n", "v" }, "<leader><down>",
    -- function() mc.lineSkipCursor(1) end)
    set({ "n", "v" }, "<c-d>",
      function() mc.matchAddCursor(1) end)
    -- set({ "n", "v" }, "<leader>s",
    -- function() mc.matchSkipCursor(1) end)
    -- set({ "n", "v" }, "<leader>N",
    -- function() mc.matchAddCursor(-1) end)
    -- set({ "n", "v" }, "<leader>S",
    -- function() mc.matchSkipCursor(-1) end)
    -- set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors)
    -- set({ "n", "v" }, "<left>", mc.nextCursor)
    -- set({ "n", "v" }, "<right>", mc.prevCursor)
    -- set({ "n", "v" }, "<leader>x", mc.deleteCursor)
    -- set("n", "<c-leftmouse>", mc.handleMouse)
    set({ "n", "v" }, "<c-q>", mc.toggleCursor)
    -- set({ "n", "v" }, "<leader><c-q>", mc.duplicateCursors)
    set("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
      end
    end)
    -- set("n", "<leader>gv", mc.restoreCursors)
    -- set("n", "<leader>a", mc.alignCursors)
    -- set("v", "S", mc.splitCursors)
    -- set("v", "I", mc.insertVisual)
    -- set("v", "A", mc.appendVisual)
    -- set("v", "M", mc.matchCursors)
    -- set("v", "<leader>t",
    -- function() mc.transposeCursors(1) end)
    -- set("v", "<leader>T",
    -- function() mc.transposeCursors(-1) end)
    -- set({ "v", "n" }, "<c-i>", mc.jumpForward)
    -- set({ "v", "n" }, "<c-o>", mc.jumpBackward)
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { link = "Cursor" })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end
}
