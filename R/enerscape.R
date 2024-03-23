enerscape <- function(
    dem,
    m,
    unit = "joule",
    neigh = 8
) {
  if (is.null(dem) | is.null(m)) {
    stop("Missing mandatory input - see ?enerscape::enerscape for details.")
  }
  if (!is(dem, "SpatRaster")) {
    stop("Digital elevation model must be a SpatRaster (terra).")
  }
  if (!unit %in% c("joule", "kcal")) {
    stop("unit must be one of 'joule' or 'kcal'.")
  }
  # check units of DEM
  work_in_kcal <- ifelse(unit == "kcal", TRUE, FALSE)
  stopifnot( abs(res(dem)[1] - res(dem)[2]) <= 1e-2 ) #tolerance = 1 cm 
  en_res <- res(dem)[1]
  message("DEM is assumed to have planar CRS in meters.")
  x <- matrix(dem, nrow = nrow(dem), ncol = ncol(dem), byrow = TRUE)
  en <- energyscape(x,
                    n = neigh,
                    mass = m,
                    kcal = work_in_kcal,
                    res = en_res)
  ans <- rast(en)
  names(ans) <- "EnergyScape"
  crs(ans) <- crs(dem)
  ext(ans) <- ext(dem)
  ans[ans == 0] <- NA
  return (ans)
}
