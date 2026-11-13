-- SPDX-License-Identifier: MIT
-- Copyright (c) 2025 Andrew Vasilyev < me@retran.me >

-- @file: lua/plugins/persistence.lua
-- @brief: Session management with auto-save and restore on startup.
--
-- persistence only understands `dir`, `need` and `branch`; the `options` and
-- `pre_save` keys that used to be set here were silently ignored (session
-- contents come from `vim.o.sessionoptions`, set in lua/config/options.lua).

return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  -- Registered in init (not config) so the auto-restore hook exists on every
  -- startup, even when the plugin would otherwise stay lazy (e.g. nvim started
  -- in an empty project dir, where no BufReadPre fires).
  init = function()
    local config_ok, config = pcall(require, "meowvim.config")
    if config_ok and config.get("sessions.auto_restore", true) == false then
      return
    end
    vim.api.nvim_create_autocmd("VimEnter", {
      group = vim.api.nvim_create_augroup("PersistenceAutoRestore", { clear = true }),
      nested = true,
      callback = function()
        require("utils.session").auto_restore()
      end,
    })
  end,
  opts = function()
    local config_ok, config = pcall(require, "meowvim.config")
    return {
      -- persistence appends the git branch to the session name on its own;
      -- its default is `true`, which contradicted `sessions.per_branch = false`.
      branch = config_ok and config.get("sessions.per_branch", false) or false,
    }
  end,
  config = function(_, opts)
    require("persistence").setup(opts)

    local config_ok, config = pcall(require, "meowvim.config")
    local auto_save = not config_ok or config.get("sessions.auto_save", true) ~= false

    if not auto_save then
      -- setup() starts persistence, which saves on VimLeavePre; stopping it is
      -- the only way to turn that save off.
      require("persistence").stop()
      return
    end

    -- persistence names the session file from getcwd(), so the save has to
    -- run before :cd, while the cwd still belongs to the session being left;
    -- after it, the old buffers would land in the new directory's session.
    vim.api.nvim_create_autocmd("DirChangedPre", {
      group = vim.api.nvim_create_augroup("PersistenceAutoSave", { clear = true }),
      pattern = "global",
      callback = function()
        local persistence = require("persistence")
        -- persistence.stop(), which <leader>qd calls, turns this save off too.
        if not persistence.active() then
          return
        end
        -- Like persistence's own `need = 1` check on exit, and a little stricter
        -- because it also requires buflisted: skip the save when no file
        -- buffer is open, so an empty editor never overwrites a useful
        -- session. save() fires no PersistenceSavePre/Post; nothing here
        -- listens for them.
        local has_file = vim.iter(vim.api.nvim_list_bufs()):any(function(buf)
          return vim.bo[buf].buflisted
            and vim.bo[buf].buftype == ""
            and not vim.tbl_contains({ "gitcommit", "gitrebase", "jj" }, vim.bo[buf].filetype)
            and vim.api.nvim_buf_get_name(buf) ~= ""
        end)
        if has_file then
          persistence.save()
        end
      end,
    })
  end,
}
