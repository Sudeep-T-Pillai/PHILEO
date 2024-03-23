en_passage <- function(
  en,
  or,
  dest,
  theta = 4,
  simulate_random_points = FALSE,
  rep = 10,
  plot = TRUE
) {
  if (class(en) != "enerscape") {
    stop("en must be an enerscape object")
  } else {
    x <- en$rasters$DEM
    cond <- en$cond_tr
  }
  ans <- list() #initialize return value
  if (simulate_random_points) { #random points
    rp <- list()
    for (i in seq_len(rep)) {
      message(i, " of ", rep, "random points ...")
      p <- raster::xyFromCell(x, sample(raster::ncell(x), 2))
      while (any(is.na(raster::extract(x, p)))) {
        p <- raster::xyFromCell(x, sample(raster::ncell(x), 2))
      }
      rp[[i]] <- gdistance::passage(cond, p[1, ], p[2, ], theta)
      ans[["Origins"]] <- rbind(ans[["Origins"]], p[1, ])
      ans[["Destinations"]] <- rbind(ans[["Destinations"]], p[2, ])
    }
    rp <- raster::stack(rp)
    ans[["Passages"]] <- rp
    rp <- sum(rp)
    rp <- rp / max(raster::values(rp), na.rm = TRUE)
    ans[["Cumulative net passage"]] <- rp
    if (plot == TRUE) {
      raster::plot(rp, col = grDevices::topo.colors(100),
                   main = paste0("Cumulative net passage for ", rep,
                                 " random points"))
      raster::contour(x, nlevels = 5, add = TRUE, col = "gainsboro", lt = 2)
      graphics::points(ans[["Origins"]],
                       pch = 20,
                       col = grDevices::adjustcolor("gold", alpha.f = 0.75))
      graphics::points(ans[["Destinations"]],
                       pch = 20,
                       col = grDevices::adjustcolor("tomato", alpha.f = 0.75))
    }
    return(ans)
  } else { #with defined coordinates
    p <- rbind(or, dest)
    if (class(p)[1] == "data.frame") {
      p <- as.matrix(p)
    } else if (class(p)[1] != "matrix") {
      stop("Origin and destination must be data.frames, matrices, or vectors")
    }
    if (any(names(p) != c("x", "y"))) {
      names(p) <- c("x", "y")
    }
    rp <- gdistance::passage(cond, p[1, ], p[2, ], theta)
    if (plot == TRUE) {
      raster::plot(rp, col = grDevices::topo.colors(100),
                   main = paste0("Cumulative net passage"))
      raster::contour(x, nlevels = 5, add = TRUE, col = "gainsboro", lt = 2)
      graphics::points(ans[["Origins"]],
                       pch = 20,
                       col = grDevices::adjustcolor("gold", alpha.f = 0.75))
      graphics::points(ans[["Destinations"]],
                       pch = 20,
                       col = grDevices::adjustcolor("tomato", alpha.f = 0.75))
    }
    ans[["Origins"]] <- p[1, ]
    ans[["Destination"]] <- p[2, ]
    ans[["Passage"]] <- rp
    return(rp)
  }
}
