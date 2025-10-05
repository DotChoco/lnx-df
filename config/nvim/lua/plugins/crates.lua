return {
  "saecki/crates.nvim",
  dependencies = { "saecki/crates.nvim" },
  ft = { "rust",  "toml" },
  config = function(_, opts)
    local crates = require('crates')
    crates.setup(opts)
    crates.show()
  end,
}
