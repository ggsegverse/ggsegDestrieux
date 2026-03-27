# Create Destrieux Cortical Atlas
#
# Recreates the destrieux cortical atlas from FreeSurfer's
# aparc.a2009s.annot annotation on fsaverage5 using ggseg.extra
# vertex projection pipeline.
#
# Requirements:
#   - FreeSurfer installed with fsaverage5 subject
#   - ggseg.extra (>= 2.0.0.9000)
#   - ggseg.formats
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

fs_dir <- freesurfer::fs_dir()
fsaverage5_dir <- file.path(fs_dir, "subjects", "fsaverage5")

annot_files <- file.path(
  fsaverage5_dir, "label",
  c("lh.aparc.a2009s.annot", "rh.aparc.a2009s.annot")
)

destrieux <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "destrieux",
  output_dir = "data-raw",
  tolerance = 0,
  skip_existing = TRUE,
  cleanup = FALSE
) |>
  atlas_region_contextual("Unknown|Medial_wall", "label")

print(destrieux)
plot(destrieux)

.destrieux <- destrieux
usethis::use_data(
  .destrieux,
  overwrite = TRUE,
  compress = "xz",
  internal = TRUE
)
