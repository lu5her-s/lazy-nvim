-- lazy.nvim only imports top-level files of `lua/plugins/`; subdirectories
-- need an init.lua that re-imports them.
return {
  { import = "plugins.lang" },
}