return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Store the original lualine_y to move it to lualine_z
      local new_lualine_z = vim.deepcopy(opts.sections.lualine_y)

      -- Clear the original lualine_z (remove time display)
      opts.sections.lualine_z = {}

      -- Move original lualine_y components to lualine_z
      opts.sections.lualine_z = new_lualine_z

      -- Create new lualine_y with programming language, encoding, and file size
      opts.sections.lualine_y = {
        -- File type/programming language
        {
          "filetype",
          icon = { align = "right" },
          padding = { left = 1, right = 0 },
        },
        -- File encoding
        {
          "encoding",
        },
        -- File size
        {
          "filesize",
        },
      }

      return opts
    end,
  },
}
