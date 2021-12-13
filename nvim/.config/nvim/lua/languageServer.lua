--Language Server Configuration
local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'
local global_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
global_capabilities.textDocument.completion.completionItem.snippetSupport = true

local function cpp()
  require'lspconfig'.clangd.setup{}
end

local function css()
  --Enable (broadcasting) snippet capability for completion
  --local capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = global_capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    cmd = {"css-languageserver", "--stdio"},
}
end

local function emmet()
if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less', 'sss'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

lspconfig.ls_emmet.setup{ capabilities = capabilities }
end

local function golsp()
    require'lspconfig'.gopls.setup{}
end

local function html()
  --Enable (broadcasting) snippet capability for completion
  local capabilities = global_capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.html.setup {
    capabilities = capabilities,
     cmd = {"html-languageserver", "--stdio"},
     configurationSection = { "html", "css", "javascript"},
     embeddedLanguages = {
         css = true,
         javascript = true,
     },
     filetypes = { "html", "php", "jsx", "js"},
  }
end

local function lua()
  -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
  local sumneko_root_path = '/opt/language-servers/lua-language-server'
  local sumneko_binary = sumneko_root_path .. "/Linux/lua-language-server"

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

local function json()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
}
end

local function php()
  local capabilities = global_capabilities
  require'lspconfig'.intelephense.setup{
    capabilities = capabilities,
  }
  -- require'lspconfig'.phpactor.setup{
  --   capabilities = capabilities,
  --   cmd = { "phpactor", "language-server" },
  --   filetypes = { "php" },
  -- }
end

local function python()
  local capabilities = global_capabilities
  require'lspconfig'.pyright.setup{
      capabilities = capabilities
  }
end

local function tailwindcss()
    require'lspconfig'.tailwindcss.setup{}
end

local function tsserver()
    require'lspconfig'.tsserver.setup{}
end

function Config()
  cpp()
  css()
  emmet()
  golsp()
  html()
  lua()
  json()
  php()
  python()
  tailwindcss()
  tsserver()
  -- cmp_tabnine()
end


Config()
