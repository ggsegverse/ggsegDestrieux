describe("destrieux atlas", {
  it("is a ggseg_atlas", {
    expect_s3_class(destrieux(), "ggseg_atlas")
    expect_s3_class(destrieux(), "cortical_atlas")
  })

  it("is valid", {
    expect_true(ggseg.formats::is_ggseg_atlas(destrieux()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("ggplot2")
    skip_if_not_installed("vdiffr")
    p <- ggplot2::ggplot() +
      ggseg::geom_brain(
        atlas = destrieux(),
        mapping = ggplot2::aes(fill = label),
        position = ggseg::position_brain(hemi ~ view),
        show.legend = FALSE
      ) +
      ggplot2::scale_fill_manual(
        values = destrieux()$palette,
        na.value = "grey"
      ) +
      ggplot2::theme_void()
    vdiffr::expect_doppelganger("destrieux-2d", p)
  })

})
