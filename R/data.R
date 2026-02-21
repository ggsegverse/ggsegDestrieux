#' Destrieux Cortical Atlas
#'
#' Brain atlas for the Destrieux cortical parcellation (aparc.a2009s)
#' with 75 regions per hemisphere. Contains 2D polygon geometry
#' for [ggseg::geom_brain()].
#'
#' @family ggseg_atlases
#'
#' @references Destrieux C, Fischl B, Dale A, Halgren E (2010).
#'   Automatic parcellation of human cortical gyri and sulci using
#'   standard anatomical nomenclature.
#'   *NeuroImage*, 53(1), 1-15.
#'   \doi{10.1016/j.neuroimage.2010.06.010}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @export
#' @examples
#' desterieux()
desterieux <- function() .desterieux
