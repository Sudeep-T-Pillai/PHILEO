en_path <- function(
  en,
  p = NULL,
  draw = FALSE,
  n = NULL,
  plot = TRUE
) {
  if (is.null(p)) {
    if (draw & is.null(n)) {
      stop("Enter number of points to draw the path")
    } else if (draw & !is.null(n)) {
      graphics::par(mfrow = c(1, 1))
      raster::plot(en$rasters$DEM)
      p <- raster::click(n = n)
    } else {
      stop("Specify the path or draw it (draw = TRUE)")
    }
    p <- sp::SpatialLines(list(sp::Lines(sp::Line(p), 1)))
  } else if (class(p)[1] != "SpatialLines") {
    stop("Path must be a SpatialLines object")
  }
  w <- raster::extract(en$rasters$EnergyScape, p)[[1]]
  ans <- list(Path = p,
              Distance = sp::SpatialLinesLengths(p),
              Cost = sum(w))
  if (plot) {
    raster::plot(en$rasters$DEM)
    graphics::lines(p)
  }
  return(ans)
}
