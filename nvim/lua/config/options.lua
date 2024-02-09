-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
if in_wsl then
  vim.g.clipboard = {
    name = 'wsl clipboard',
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true
  }
end
