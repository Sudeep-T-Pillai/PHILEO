.calc_arc <- function(
  slope,
  m,
  work_in_kcal = TRUE,
  j_to_kcal = 4184
) {
  en_res <- get("en_res", envir = parent.frame())
  E_ar <- 8 * m ^ (-0.34)
  E_mec <- 100 * (1 + sin((2 * slope - 74) / 180 * pi)) * m ^ (-0.12)
  work <- (E_ar + E_mec) * m * en_res / abs(cos(slope * pi / 180))
  if (work_in_kcal) {
    work <- work / j_to_kcal
  }
  return(work)
}
.calc_arc_cond <- function(
  slope,
  m,
  work_in_kcal = TRUE,
  j_to_kcal = 4184
) {
  en_res <- get("en_res", envir = parent.frame())
  E_ar <- 8 * m ^ (-0.34)
  E_mec <- 100 * (1 + sin((2 * slope - 74) / 180 * pi)) * m ^ (-0.12)
  work <- (E_ar + E_mec) * m * en_res / abs(cos(slope * pi / 180))
  if (work_in_kcal) {
    work <- work / j_to_kcal
  }
  cond <- 1 / work
  return(cond)
}
.calc_cycling <- function(
  height,
  slope,
  m,
  v,
  work_in_kcal = TRUE,
  j_to_kcal = 4184
) {
  en_res <- get("en_res", envir = parent.frame())
  m <- m + 7 #add mass of bike
  temp <- (15.04 - 0.00649 * height) #air temperature
  atm <- 101.29 * ((temp + 273.1) / 288.08) ^ 5.256 #atmospheric pressure
  atm <- atm * 7.500638 #in Torr
  temp <- temp + 272.15 #in Kelvin
  VO2 <- (8.6 * 10^-3 * m +
            7.8 * 10^-3 * 1.8 * atm / temp * v^2 +
            1.87 * m * sin(slope / 180 * pi)) * v
  E <- VO2 * 20.9 #ml O2 to J
  E <- E * en_res / abs(cos(slope * pi / 180)) / v
  if (work_in_kcal) {
    E <- E / j_to_kcal
  }
  return(E)
}
.calc_cycling_cond <- function(
  height,
  slope,
  m,
  v,
  work_in_kcal = TRUE,
  j_to_kcal = 4184
) {
  en_res <- get("en_res", envir = parent.frame())
  m <- m + 7 #add mass of bike
  temp <- (15.04 - 0.00649 * height) #air temperature
  atm <- 101.29 * ((temp + 273.1) / 288.08) ^ 5.256 #atmospheric pressure
  atm <- atm * 7.500638 #in Torr
  temp <- temp + 272.15 #in Kelvin
  VO2 <- (8.6 * 10^-3 * m +
            7.8 * 10^-3 * 1.8 * atm / temp * v^2 +
            1.87 * m * sin(slope / 180 * pi)) * v
  E <- VO2 * 20.9 #ml O2 to J
  E <- E * en_res / abs(cos(slope * pi / 180)) / v
  if (work_in_kcal) {
    E <- E / j_to_kcal
  }
  return(1 / E)
}
