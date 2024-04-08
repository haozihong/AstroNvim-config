-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
  -- { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  { import = "astrocommunity.completion.codeium-vim" },

  { import = "astrocommunity.motion.nvim-surround" },

  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },  -- require neovim v0.10
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  {
    "karb94/neoscroll.nvim",
    opts = {
      easing_function = "circular",
    },
  },
  -- { import = "astrocommunity.scrolling.satellite-nvim" },  -- require neovim v0.10
  { import = "astrocommunity.utility.noice-nvim" },
}
