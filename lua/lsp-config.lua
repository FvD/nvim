local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')


-- bash
if not configs.bashls then
  configs.bashls = {
    default_config = {
      cmd = { "bash-language-server", "start" },
      cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
    },
    filetypes = { "sh" },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true
    },
  }
end

lspconfig.bashls.setup{}

-- R language
-- install.packages("LanguageServer")
if not configs.r_language_server then 
  configs.r_language_server = {
  default_config = {
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd" },
        root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end,
    log_level = vim.lsp.protocol.MessageType.Warning,
--    root_dir = lspconfig.util.root_pattern(".git") or vim.loop.os_homedir(),
    },
  }
end

-- lspconfig.r_language_server.setup{}
lspconfig.r_language_server.setup({
  on_attach = on_attach_custom,
  -- Debounce "textDocument/didChange" notifications because they are slowly
  -- processed (seen when going through completion list with `<C-N>`)
  flags = { debounce_text_changes = 150 },
})

-- Julia
-- Pkg.add("JuliaLanguageServer)
if not configs.julials then
  configs.julials = {
   default_config = {
    cmd = { "julia", "--startup-file=no", "--history-file=no", "-e", '    # Load LanguageServer.jl: attempt to load from ~/.julia/environments/nvim-lspconfig\n    # with the regular load path as a fallback\n    ls_install_path = joinpath(\n        get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")),\n        "environments", "nvim-lspconfig"\n    )\n    pushfirst!(LOAD_PATH, ls_install_path)\n    using LanguageServer\n    popfirst!(LOAD_PATH)\n    depot_path = get(ENV, "JULIA_DEPOT_PATH", "")\n    project_path = let\n        dirname(something(\n            ## 1. Finds an explicitly set project (JULIA_PROJECT)\n            Base.load_path_expand((\n                p = get(ENV, "JULIA_PROJECT", nothing);\n                p === nothing ? nothing : isempty(p) ? nothing : p\n            )),\n            ## 2. Look for a Project.toml file in the current working directory,\n            ##    or parent directories, with $HOME as an upper boundary\n            Base.current_project(),\n            ## 3. First entry in the load path\n            get(Base.load_path(), 1, nothing),\n            ## 4. Fallback to default global environment,\n            ##    this is more or less unreachable\n            Base.load_path_expand("@v#.#"),\n        ))\n    end\n    @info "Running language server" VERSION pwd() project_path depot_path\n    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path)\n    server.runlinter = true\n    run(server)\n  ' },
    filetypes = { "julia" },
    root_dir = function(fname)
          return lspconfig.util.root_pattern 'Project.toml'(fname) or lspconfig.util.find_git_ancestor(fname)
        end,
    single_file_support = true
    },
  }
end

lspconfig.julials.setup{}

-- SQL
-- npm i -g sql-language-server

if not configs.sqlls then
  configs.sqlls = {
    default_config = {
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql", "mysql" },
    root_dir = function(startpath)
        return lspconfig.util.M.search_ancestors(startpath, matcher)
      end,
    settings = {}
  },
}
end 

lspconfig.sqlls.setup{}

-- JavaScript


-- Python


-- Golang
if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { 'golangci-lint-langserver' },
      root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
      filetypes = { 'go' },
      init_options = {
        command = { 'golangci-lint', 'run', '--fast', '--out-format', 'json' },
      },
    },
  }
end
lspconfig.golangcilsp.setup{}

-- Docker
-- npm install -g dockerfile-language-server-nodejs
if not configs.dockerls then
  configs.dockerls = {
    default_config = {
      cmd = { "docker-langserver", "--stdio" },
      filetypes = { "dockerfile" },
      root_dir = lspconfig.util.root_pattern("Dockerfile"),
      single_file_support = true,
  },
}
end 

lspconfig.dockerls.setup{}

