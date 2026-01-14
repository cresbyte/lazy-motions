return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" }, -- Saves when you stop typing or leave insert mode
  opts = {
    enabled = true,
    execution_message = { enabled = false }, -- Disable "saved" message
    trigger_events = {
      immediate_save = { "TextChanged" }, -- Save on text change
      defer_save = { "InsertLeave" }, -- Save after leaving insert mode
    },
    debounce_delay = 300, -- Wait 300ms after last change
  },
}
