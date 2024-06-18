local util = require("custom.util")

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- Putting these up here for better visibility on what is pulled in
    require("mason").setup()
    require("mason-lspconfig").setup()
    local telescope = require("telescope.builtin")
    local lspconfig = require("lspconfig")
    local installer = require("mason-tool-installer")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Key map later used in the LspAttach auto command
    local keys = {
      { "<leader>ld", telescope.lsp_definitions, desc = "[G]oto [D]efinition" },
      { "<leader>lr", telescope.lsp_references, desc = "[G]oto [R]eferences" },
      { "<leader>li", telescope.lsp_implementations, desc = "[G]oto [I]mplementation" },
      { "<leader>lt", telescope.lsp_type_definitions, desc = "Type [D]efinition" },
      { "<leader>lD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
      { "<leader>ar", vim.lsp.buf.rename, desc = "[R]e[n]ame" },
      { "<leader>aa", vim.lsp.buf.code_action, desc = "[C]ode [A]ction" },
      { "H", vim.lsp.buf.hover, desc = "Hover Documentation" },
    }

    -- LSP to install and their configuration, `true` for default config.
    -- See `:help lspconfig-all` for more server config details
    local servers = {
      clangd = true,
      gopls = true,
      pyright = true,
      tsserver = true,
      bashls = true,
      svelte = true,
      html = true,
      yamlls = true,
      lua_ls = true,
    }

    -- Anything else from mason that is not an LSP
    local packages = {
      "stylua",
      "ruff",
      "prettierd",
      "prettier",
      "mdformat",
    }

    -- Make life easy for me and install what I need
    local install_list = {}
    installer.setup({ ensure_isntalled = install_list })

    -- Adding actual functionality to the servers (idk what I'm doing)
    -- stylua: ignore
    local capabilities = vim.tbl_deep_extend('force',
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities()
    )

    -- Setting up the servers
    for name, config in pairs(servers) do
      if config == true then
        ---@diagnostic disable-next-line: cast-local-type
        config = {}
      end
      if config ~= false then
        config.capabilities = capabilities
        lspconfig[name].setup(config)
      end
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("mbromell-lsp-attach", { clear = true }),
      callback = function(event)
        util.keys(keys, { buffer = event.buf })
      end,
    })
  end,
}
