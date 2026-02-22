# Create destrieux Cortical Atlas - Robust version
#
# Handles rgl/X11 GL context failures by retrying failed snapshot operations.

Sys.setenv(
  FREESURFER_HOME = "/Applications/freesurfer/7.4.1",
  DISPLAY = "/private/tmp/com.apple.launchd.Vyo4YHAmWh/org.xquartz:0"
)

library(dplyr)
library(ggsegExtra)
library(ggseg.formats)

options(freesurfer.verbose = FALSE)
future::plan(future::sequential)
progressr::handlers("cli")
progressr::handlers(global = TRUE)

fs_dir <- freesurfer::fs_dir()
fsaverage5_dir <- file.path(fs_dir, "subjects", "fsaverage5")

annot_files <- file.path(
  fsaverage5_dir,
  "label",
  c("lh.aparc.a2009s.annot", "rh.aparc.a2009s.annot")
)

max_attempts <- 50
attempt <- 0
success <- FALSE

while (attempt < max_attempts && !success) {
  attempt <- attempt + 1
  cat(sprintf("\n=== Attempt %d ===\n", attempt))

  result <- tryCatch(
    {
      atlas_raw <- create_cortical_atlas(
        input_annot = annot_files,
        atlas_name = "destrieux",
        output_dir = "data-raw",
        tolerance = 1,
        smoothness = 2,
        skip_existing = TRUE,
        cleanup = FALSE
      )
      list(atlas = atlas_raw, success = TRUE)
    },
    error = function(e) {
      cat("Error:", conditionMessage(e), "\n")
      try(rgl::close3d(), silent = TRUE)
      list(atlas = NULL, success = FALSE)
    }
  )

  success <- result$success
  if (!success) {
    Sys.sleep(1)
  }
}

if (!success) {
  stop("Failed to create atlas after ", max_attempts, " attempts")
}

atlas_raw <- result$atlas

atlas_raw <- atlas_raw |>
  atlas_region_contextual("Unknown", "label")

atlas_raw <- atlas_raw |>
  atlas_view_gather()

destrieux <- atlas_raw

cli::cli_alert_success("Atlas created with {nrow(destrieux$core)} regions")
print(destrieux)

brain_pals <- stats::setNames(
  list(destrieux$palette),
  destrieux$atlas
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")

usethis::use_data(destrieux, overwrite = TRUE, compress = "xz")
cli::cli_alert_success("Saved to data/destrieux.rda")
