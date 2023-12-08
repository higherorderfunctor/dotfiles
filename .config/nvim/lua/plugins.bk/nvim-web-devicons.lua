return {
  "nvim-tree/nvim-web-devicons",
     config = function(_, opts)
       require("nvim-web-devicons").setup(opts)
      require("nvim-web-devicons").set_default_icon('', '#6d8086', 65)
    end
}
