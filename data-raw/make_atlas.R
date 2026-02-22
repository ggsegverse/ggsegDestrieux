# Create destrieux Cortical Atlas
#
# Recreates the destrieux cortical atlas from FreeSurfer's
# aparc.a2009s.annot annotation on fsaverage5 using ggsegExtra.
#
# Requirements:
#   - FreeSurfer installed with fsaverage5 subject
#   - ggsegExtra package
#   - ggseg.formats package
#
# Run with: Rscript data-raw/make_atlas.R

Sys.setenv(
  FREESURFER_HOME = "/Applications/freesurfer/7.4.1",
  DISPLAY = "/private/tmp/com.apple.launchd.Vyo4YHAmWh/org.xquartz:0"
)

library(dplyr)
library(ggseg.extra)
library(ggseg.formats)

options(freesurfer.verbose = FALSE)
options(chromote.timeout = 120)
future::plan(future::sequential)
progressr::handlers("cli")
progressr::handlers(global = TRUE)

# ── Locate source files ──────────────────────────────────────────
fs_dir <- freesurfer::fs_dir()
fsaverage5_dir <- file.path(fs_dir, "subjects", "fsaverage5")

if (!dir.exists(fsaverage5_dir)) {
  cli::cli_abort(c(
    "fsaverage5 not found",
    "i" = "Expected: {.path {fsaverage5_dir}}",
    "i" = "Ensure FreeSurfer is properly installed"
  ))
}

annot_files <- file.path(
  fsaverage5_dir,
  "label",
  c("lh.aparc.a2009s.annot", "rh.aparc.a2009s.annot")
)

for (f in annot_files) {
  if (!file.exists(f)) {
    cli::cli_abort("Annotation not found: {.path {f}}")
  }
}

# ── Create atlas ─────────────────────────────────────────────────
cli::cli_h1("Creating destrieux cortical atlas")

atlas_raw <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "destrieux",
  output_dir = "data-raw",
  tolerance = 1,
  smoothness = 2,
  skip_existing = TRUE,
  cleanup = FALSE
)

# ── Post-processing ──────────────────────────────────────────────
atlas_raw <- atlas_raw |>
  atlas_region_contextual("Unknown", "label")

# ── Inspect and save ─────────────────────────────────────────────
.destrieux <- atlas_raw

cli::cli_alert_success("Atlas created with {nrow(destrieux$core)} regions")
print(.destrieux)

usethis::use_data(
  .destrieux,
  overwrite = TRUE,
  compress = "xz",
  internal = TRUE
)
