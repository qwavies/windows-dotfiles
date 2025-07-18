return {
  "sphamba/smear-cursor.nvim",

  opts = {
    -- enabled = false,
    cursor_color = "#cfd3ff",

    never_draw_over_target = true,
    smear_insert_mode = false,
    -- min_vertical_distance_smear = 1,

    time_interval = 17, -- ms
    stiffness = 0.9,
    trailing_stiffness = 0.4,
    damping = 1, -- stops bouncing

    -- anticipation = 0.2,
    -- distance_stop_animating = 0.6,
  },
}
