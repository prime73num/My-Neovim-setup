local width = vim.o.columns * 0.8
require('nvim-test').setup {
  run = true,                 -- run tests (using for debug)
  commands_create = true,     -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
  silent = false,             -- less notifications
  term = "toggleterm",          -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "float",
    width = width,
    height = 23,
    go_back = false,
    stopinsert = "true",      -- exit from insert mode (true|false|"auto")
    keep_one = true,          -- keep only one terminal for testing
  },
  termExec = function(cmd, cfg, termCfg)
    local command = cmd[1]
    for i = 2, #cmd do
      command = command .. " " .. vim.fn.shellescape(cmd[i])
    end
    local term = require("user.toggleterm").open_terminal()
    term:toggle()
    term:change_dir(cfg.working_directory)
    term:send(command, false)
  end,
  runners = {               -- setup tests runners
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  }
}
