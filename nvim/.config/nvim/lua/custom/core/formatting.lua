return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = function()
    local conform = require("conform")

    vim.keymap.set("n", "<leader>rf", function()
      conform.format({ lsp_format = "fallback" })
    end, { desc = "Format file" })

    vim.keymap.set("n", "<leader><space>", function()
      conform.format({ lsp_format = "fallback" })
      vim.cmd("write")
    end, { desc = "Format and save" })

    conform.setup({
      formatters_by_ft = {
        ["_"] = { "trim_whitespace" },
        css = { "biome-check" },
        html = { "biome-check" },
        javascript = { "biome-check" },
        javascriptreact = { "biome-check" },
        json = { "biome-check" },
        jsonc = { "biome-check" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        python = { "ruff_organize_imports", "ruff_format" },
        sh = { "shfmt" },
        terraform = { "terraform_fmt" },
        typescript = { "biome-check" },
        typescriptreact = { "biome-check" },
      },
      formatters = {
        mdformat = {
          prepend_args = { "--number" },
        },
      },
    })
  end,
}
