omniscape_skeleton <- function(
  en = NULL,
  path = NULL,
  radius = NULL,
  aggr_fact = 1
) {
  if (is.null(en) | is.null(radius)) {
    stop("Missing mandatory input")
  }
  if (is.null(path)) path <- getwd()
  if (aggr_fact > 1) {
    w <- aggregate(en, aggr_fact)
  } else {
    w <- en
  }
  writeRaster(w, file.path(path, "EnergyScape.tif"), overwrite = TRUE)
  omni_file <- file(file.path(path, "omniscape.ini"), open = "w")
  if (!isOpen(omni_file)) {
    stop("Connection to file cannot be established")
  }
  writeLines(text = c(
    "[Required arguments]",
    paste0("resistance_file = ", path, "/EnergyScape.tif"),
    paste0("radius = ", radius),
    paste0("block_size = ", 1),
    paste0("project_name = ", path, "/omniscape"),
    "",
    "[General options]",
    "source_from_resistance = true",
    "calc_normalized_current = true",
    "",
    "parallelize = true",
    "parallel_batch_size = 10",
    "",
    "[Output options]",
    "write_raw_currmap = true"),
    con = omni_file)
  close(omni_file)
}
