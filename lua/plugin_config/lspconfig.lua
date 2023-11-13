local lspconfig = require('lspconfig')
local lspconfig_util = require("lspconfig.util")
local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  local opt = { noremap = true, silent = true }
  local function mapbuf(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  mapbuf('n', '<leader>ra', '<cmd>lua vim.lsp.buf.rename()<CR>', opt)
  mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', opt)
  mapbuf('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opt)
  mapbuf('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opt)

  local cmd = '<cmd>lua require("conform").format({ async = true, lsp_fallback = true })<CR>'
  mapbuf('n', '<leader>f', cmd, { noremap = true })

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('DocumentHighlight', { clear = false })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      group = 'DocumentHighlight',
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      group = 'DocumentHighlight',
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  if client.supports_method(protocol.Methods.textDocument_inlayHint) then
    local inlay_hints_group = vim.api.nvim_create_augroup('ToggleInlayHints', { clear = false })

    vim.defer_fn(function()
      local mode = vim.api.nvim_get_mode().mode
      vim.lsp.inlay_hint(bufnr, mode == 'n' or mode == 'v')
    end, 250)

    vim.api.nvim_create_autocmd('InsertEnter', {
      group = inlay_hints_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.inlay_hint(bufnr, false)
      end
    })

    vim.api.nvim_create_autocmd('InsertLeave', {
      group = inlay_hints_group,
      buffer = bufnr,
      callback = function()
        vim.lsp.inlay_hint(bufnr, true)
      end
    })
  end
end

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
  end)()
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
  end)()
})

lspconfig.lemminx.setup({
  on_attach = on_attach,
})

lspconfig.lua_ls.setup({
  on_attach = on_attach,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
})

lspconfig.taplo.setup({
  on_attach = on_attach,
})

lspconfig.pylsp.setup({
  on_attach = on_attach,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
})

lspconfig.clangd.setup({
  on_attach = on_attach,
})

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = (function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
  end)(),
}

lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = function(fname)
    local root_dir = lspconfig_util.root_pattern "tsconfig.json" (fname) or
        lspconfig_util.root_pattern("package.json", "jsconfig.json", ".git")(fname)

    local node_modules_index = root_dir and root_dir:find("node_modules", 1, true)
    if node_modules_index and node_modules_index > 0 then
      root_dir = root_dir:sub(1, node_modules_index - 2)
    end

    return root_dir
  end,
  single_file_support = true,
  capabilities = (function()
    local capabilities = {
      textDocumentSync = protocol.TextDocumentSyncKind.Incremental,
      executeCommandProvider = {
        commands = {
          "invoke_additional_rename",
          "call_api_function"
        }
      },
      renameProvider = {
        prepareProvider = false
      },
      completionProvider = {
        resolveProvider = true,
        triggerCharacters = {
          ".",
          '"',
          "'",
          "`",
          "/",
          "@",
          "<"
        }
      },
      hoverProvider = true,
      definitionProvider = true,
      typeDefinitionProvider = true,
      inlayHintProvider = true,
      foldingRangeProvider = true,
      semanticTokensProvider = {
        documentSelector = nil,
        legend = {
          tokenTypes = {
            "class",
            "enum",
            "interface",
            "namespace",
            "typeParameter",
            "type",
            "parameter",
            "variable",
            "enumMember",
            "property",
            "function",
            "member"
          },
          tokenModifiers = {
            "declaration",
            "static",
            "async",
            "readonly",
            "defaultLibrary",
            "local"
          }
        },
        full = true
      },
      declarationProvider = false,
      implementationProvider = true,
      referencesProvider = true,
      documentSymbolProvider = true,
      documentHighlightProvider = true,
      signatureHelpProvider = {
        triggerCharacters = { "(", ",", "<" },
        retriggerCharacters = { ")" }
      },
      codeActionProvider = {
        codeActionKinds = {
          "",
          "quickfix",
          "refactor",
          "refactor.extract",
          "refactor.inline",
          "refactor.rewrite",
          "source",
          "source.organizeImports"
        },
        resolveProvider = true
      },
      workspace = {
        fileOperations = {
          willRename = {
            filters = {
              {
                scheme = "file",
                pattern = { glob = "**/*.{ts,js,jsx,tsx,mjs,mts,cjs,cts}", matches = "file" }
              },
              {
                scheme = "file",
                pattern = { glob = "**/*", matches = "folder" }
              }
            }
          }
        }
      },
      documentFormattingProvider = true,
      documentRangeFormattingProvider = true,
      callHierarchyProvider = true,
      workspaceSymbolProvider = true
    }
    return capabilities
  end)()
})

lspconfig.dartls.setup({
  on_attach = on_attach,
  root_dir = function(_)
    local ROOT_PATTERNS = { ".git", "pubspec.yaml" }

    local client = vim.lsp.get_active_clients({ name = 'dartls', bufnr = bufnr })[1]
    local root_dir = client and client.config.root_dir or nil
    if root_dir then return root_dir end

    local buf = vim.api.nvim_get_current_buf()
    local buf_path = vim.api.nvim_buf_get_name(buf)

    return root_dir or vim.fs.dirname(vim.fs.find(ROOT_PATTERNS, {
      path = buf_path,
      upward = true,
    })[1])
  end,
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
      analysisExcludedFolders = {},
      updateImportsOnRename = true,
    },
  },
  capabilities = (function()
    local capabilities = protocol.make_client_capabilities()
    capabilities.workspace.configuration = true
    capabilities.workspace.workspaceEdit.documentChanges = true
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.documentColor = { dynamicRegistration = true }
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    }
    return capabilities
  end)()
})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  root_dir = function(filename)
    local fname = filename or vim.api.nvim_buf_get_name(0)
    local cargo_crate_dir = lspconfig_util.root_pattern("Cargo.toml")(fname)
    local cmd = { "cargo", "metadata", "--no-deps", "--format-version", "1" }
    if cargo_crate_dir ~= nil then
      cmd[#cmd + 1] = "--manifest-path"
      cmd[#cmd + 1] = lspconfig_util.path.join(cargo_crate_dir, "Cargo.toml")
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
        or lspconfig_util.root_pattern("rust-project.json")(fname)
        or lspconfig_util.find_git_ancestor(fname)
  end,
  capabilities = (function()
    local capabilities = protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.experimental = {
      hoverActions = true,
      hoverRange = true,
      serverStatusNotification = true,
      snippetTextEdit = true,
      codeActionGroup = true,
      ssr = true
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
      }
    }
    return capabilities
  end)(),
  settings = {
    ['rust-analyzer'] = {
      -- cargo = {
      --   target = "wasm32-unknown-unknown"
      -- },
      diagnostics = {
        enable = true,
      },
      inlayHints = {
        maxLength = 512
      }
    }
  }
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*/Cargo.toml',
  callback = function()
    local clients = vim.lsp.get_active_clients()

    for _, client in ipairs(clients) do
      if client.name == 'rust_analyzer' then
        client.request('rust-analyzer/reloadWorkspace', nil, function(err)
          if err then
            error(tostring(err))
          end
        end, 0)
      end
    end
  end,
  group = vim.api.nvim_create_augroup('RustReload', { clear = true }),
})
