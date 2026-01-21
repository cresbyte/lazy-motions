local M = {}

-- Get UV python path
function M.get_uv_python_path()
  local uv = vim.uv
  local cwd = vim.fn.getcwd()
  
  -- Check for UV venv in current directory
  local local_path = cwd .. "/.venv/bin/python"
  local stat = uv.fs_stat(local_path)
  if stat and stat.type == "file" then
    return local_path
  end
  
  return nil
end

-- Setup Pyright with UV environment
function M.setup_pyright()
  local python_path = M.get_uv_python_path()
  if not python_path then
    return  -- No UV venv found
  end
  
  -- Configure pyright
  require("lspconfig").pyright.setup({
    settings = {
      python = {
        pythonPath = python_path,
        analysis = {
          typeCheckingMode = "off",  -- Disable temporarily to avoid errors
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
    single_file_support = true,
  })
end

-- Auto-setup when opening Python files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    M.setup_pyright()
  end,
})

-- Also setup when entering project directory
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    if vim.bo.filetype == "python" then
      M.setup_pyright()
    end
  end,
})

return M
