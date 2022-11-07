-- local lsp_installer = require('nvim-lsp-installer')
--
-- local on_attach = function(client, bufnr)
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--   
--
--
--
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end
--
-- lsp_installer.on_server_ready(function(server)
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--
--   local opts = {
--     on_attach = on_attach,
--     capabilities = capabilities
--   }
--
--   if server.name == 'sumneko_lua' then
--     opts.settings = { Lua = { diagnostics = { globals = { 'vim' }}}}
--   end
--
--   server:setup(opts)
-- end)
--
local on_attach = function(client, bufnr)
  -- use null-ls for formatting instead of lsp servers
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()

require("mason-lspconfig").setup({
  automatic_installation = true,
  ensure_installed = {
    "sumneko_lua",
    "tsserver",
  },
})

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({ capabilities = capabilities })
  end,

  ["sumneko_lua"] = function()
    require("lspconfig").sumneko_lua.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          telemetry = {
            enable = false,
          },
        },
      },
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ["tsserver"] = function()
    require("lspconfig").tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
