distances <- function(x, center, res) {
    .Call(`_enerscape_distances`, x, center, res)
}
energy <- function(slope, distance, mass, res, kcal = TRUE) {
    .Call(`_enerscape_energy`, slope, distance, mass, res, kcal)
}
energyscape <- function(x, n = 4L, mass = 0, res = 0, kcal = TRUE) {
    .Call(`_enerscape_energyscape`, x, n, mass, res, kcal)
}
neighbours <- function(i, j, n, x) {
    .Call(`_enerscape_neighbours`, i, j, n, x)
}
slope <- function(x, center, res) {
    .Call(`_enerscape_slope`, x, center, res)
}

