return {
   "sphamba/smear-cursor.nvim",
   event = "VeryLazy",

   opts = {
      -- enabled = false,
      cursor_color = "#cfd3ff",

      gamma = 1,

      never_draw_over_target = true,

      smear_insert_mode = false,
      min_vertical_distance_smear = 9, -- doesnt work??

      time_interval = 16, -- ms
      stiffness = 0.9,
      trailing_stiffness = 0.4,
      damping = 0.99, -- stops bouncing

      -- anticipation = 0.2,
      -- distance_stop_animating = 0.6,

   },
}
