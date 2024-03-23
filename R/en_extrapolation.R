en_extrapolation <- function(en,
                             plot = TRUE) {
  extr_mass <- ifelse(en$mass >= min(enerscape::pontzer$Mass) &
                         en$mass <= max(enerscape::pontzer$Mass),
                       FALSE,
                       TRUE)
  v <- raster::values(en$rasters$Slope)
  min_slope <- min(v, na.rm = TRUE)
  max_slope <- max(v, na.rm = TRUE)
  extr_slope <- ifelse(min_slope >= min(enerscape::pontzer$Incline) &
                         max_slope <= max(enerscape::pontzer$Incline),
    FALSE,
    TRUE)
  extr_rast <- en$rasters$Slope
  if (extr_slope) {
    extr_rast[extr_rast >= min(enerscape::pontzer$Incline) &
                extr_rast <= max(enerscape::pontzer$Incline)] <- NA
    extr_rast[!is.na(extr_rast)] <- 1
  } else {
    extr_rast <- NULL
  }
  if (plot & extr_slope) {
    raster::plot(en$rasters$Slope)
    raster::plot(extr_rast,
                 add = TRUE,
                 legend = FALSE,
                 col = grDevices::adjustcolor("blue", alpha.f = 0.5))
  } else if (plot & !extr_slope) {
    message("No slope extrapolation detected")
  }
  return(list("Mass extrapolated" = extr_mass,
              "Slope extrapolated" = extr_slope,
              "Slope extrapolation" = extr_rast))
}
