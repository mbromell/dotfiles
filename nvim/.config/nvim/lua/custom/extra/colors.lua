return {
  {
    "f-person/auto-dark-mode.nvim",
    priority = 999,
    opts = function()
      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = {
      options = {
        styles = {
          comments = "italic",
        },
      },
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
        auto_integrations = true,
        integrations = {
          neotest = true,
        },
        custom_highlights = function(colors)
          local util = require("catppuccin.utils.colors")
          return {
            Operator = { fg = colors.subtext1 },
            ["@tag.delimiter"] = { fg = colors.subtext1 },

            -- neotest
            NeotestSkipped = { fg = colors.overlay1 },

            -- dap
            DapStoppedLine = { bg = util.darken(colors.red, 0.25) },
          }
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      return {
        style = "moon",
        on_highlights = function(hl, c)
          -- defaults
          hl.LineNr = { fg = c.comment }
          hl.LineNrAbove = { fg = c.comment }
          hl.LineNrBelow = { fg = c.comment }
          hl.CursorLineNr = { fg = c.comment }

          -- dap
          hl.DapBreakpoint = { fg = c.red }
          hl.DapBreakpointLine = { bg = "#4D2F3A" }
          hl.DapLogPoint = { fg = c.red }
          hl.DapStopped = { fg = c.fg }
          hl.DapStoppedLine = { bg = "#3B405D" }

          -- dap-ui
          hl.DapUIScope = { fg = c.teal }
          hl.DapUIType = { fg = c.magenta }
          hl.DapUIModifiedValue = { fg = c.teal, bold = true }
          hl.DapUIDecoration = { fg = c.teal }
          hl.DapUIThread = { fg = c.yellow }
          hl.DapUIStoppedThread = { fg = c.teal }
          hl.DapUISource = { fg = c.magenta }
          hl.DapUILineNumber = { fg = c.purple }
          hl.DapUIFloatBorder = { fg = c.teal }
          hl.DapUIWatchesEmpty = { fg = c.purple }
          hl.DapUIWatchesValue = { fg = c.yellow }
          hl.DapUIWatchesError = { fg = c.red }
          hl.DapUIBreakpointsPath = { fg = c.teal }
          hl.DapUIBreakpointsInfo = { fg = c.yellow }
          hl.DapUIBreakpointsCurrentLine = { fg = c.yellow, bold = true }
          hl.DapUIBreakpointsDisabledLine = { fg = c.fg_dark }
          hl.DapUIStepOver = { bg = c.bg_dark, fg = c.teal }
          hl.DapUIStepOverNC = { link = "DapUIStepOver" }
          hl.DapUIStepInto = { bg = c.bg_dark, fg = c.teal }
          hl.DapUIStepIntoNC = { link = "DapUIStepInto" }
          hl.DapUIStepBack = { bg = c.bg_dark, fg = c.teal }
          hl.DapUIStepBackNC = { link = "DapUIStepBack" }
          hl.DapUIStepOut = { bg = c.bg_dark, fg = c.teal }
          hl.DapUIStepOutNC = { link = "DapUIStepOut" }
          hl.DapUIStop = { bg = c.bg_dark, fg = c.red }
          hl.DapUIStopNC = { link = "DapUIStop" }
          hl.DapUIPlayPause = { bg = c.bg_dark, fg = c.green }
          hl.DapUIPlayPauseNC = { link = "DapUIPlayPause" }
          hl.DapUIRestart = { bg = c.bg_dark, fg = c.green }
          hl.DapUIRestartNC = { link = "DapUIRestart" }
          hl.DapUIUnavailable = { bg = c.bg_dark, fg = c.fg_dark }
          hl.DapUIUnavailableNC = { link = "DapUIUnavailable" }
          hl.DapUIWinSelect = { fg = c.teal, bold = true }
        end,
      }
    end,
  },
}
