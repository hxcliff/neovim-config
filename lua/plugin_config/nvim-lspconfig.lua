local lspconfig = require('lspconfig')
local lspconfig_utils = require("lspconfig.util")

local on_attach = function(_, bufnr)
  local opt = { noremap = true, silent = true }
  local function mapbuf(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  mapbuf('n', ',r', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)
  mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true })
end

lspconfig.lua_ls.setup({
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.experimental = {
  hoverActions = true,
  hoverRange = true,
  serverStatusNotification = true,
  snippetTextEdit = true,
  codeActionGroup = true,
  ssr = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities.experimental.commands = {
  commands = {
    "rust-analyzer.runSingle",
    "rust-analyzer.debugSingle",
    "rust-analyzer.showReferences",
    "rust-analyzer.gotoLocation",
    "editor.action.triggerParameterHints",
  },
}

local function get_root_dir(filename)
  local fname = filename or vim.api.nvim_buf_get_name(0)
  local cargo_crate_dir = lspconfig_utils.root_pattern("Cargo.toml")(fname)
  local cmd = { "cargo", "metadata", "--no-deps", "--format-version", "1" }
  if cargo_crate_dir ~= nil then
    cmd[#cmd + 1] = "--manifest-path"
    cmd[#cmd + 1] = lspconfig_utils.path.join(cargo_crate_dir, "Cargo.toml")
  end
  local cargo_metadata = ""
  local cm = vim.fn.jobstart(cmd, {
    on_stdout = function(_, d, _)
      cargo_metadata = table.concat(d, "\n")
    end,
    stdout_buffered = true,
  })
  if cm > 0 then
    cm = vim.fn.jobwait({ cm })[1]
  else
    cm = -1
  end
  local cargo_workspace_dir = nil
  if cm == 0 then
    cargo_workspace_dir = vim.fn.json_decode(cargo_metadata)["workspace_root"]
  end
  return cargo_workspace_dir
      or cargo_crate_dir
      or lspconfig_utils.root_pattern("rust-project.json")(fname)
      or lspconfig_utils.find_git_ancestor(fname)
end

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = get_root_dir,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false,
      },
      inlayHints = {
        maxLength = 512
      }
    }
  }
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      -- vim.lsp.inlay_hint(args.buf, true)
    end
  end
})
