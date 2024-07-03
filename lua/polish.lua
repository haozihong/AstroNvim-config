-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

vim.filetype.add({ filename = { Config = "brazil-config" } })


-- ===== Barium =====
-- local lspconfig = require 'lspconfig'
-- local configs = require 'lspconfig.configs'
--
-- -- Check if the config is already defined (useful when reloading this file)
-- if not configs.barium then
--     configs.barium = {
--         default_config = {
--             cmd = {'barium'};
--             filetypes = {'brazil-config'};
--             root_dir = function(fname)
--                 return lspconfig.util.find_git_ancestor(fname)
--             end;
--             settings = {};
--         };
--     }
-- end
--
-- lspconfig.barium.setup {}
