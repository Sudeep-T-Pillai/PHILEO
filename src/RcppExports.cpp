#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// distances
NumericVector distances(NumericVector x, double center, double res);
RcppExport SEXP _enerscape_distances(SEXP xSEXP, SEXP centerSEXP, SEXP resSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type center(centerSEXP);
    Rcpp::traits::input_parameter< double >::type res(resSEXP);
    rcpp_result_gen = Rcpp::wrap(distances(x, center, res));
    return rcpp_result_gen;
END_RCPP
}
// energy
NumericVector energy(NumericVector slope, NumericVector distance, double mass, double res, bool kcal);
RcppExport SEXP _enerscape_energy(SEXP slopeSEXP, SEXP distanceSEXP, SEXP massSEXP, SEXP resSEXP, SEXP kcalSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type slope(slopeSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type distance(distanceSEXP);
    Rcpp::traits::input_parameter< double >::type mass(massSEXP);
    Rcpp::traits::input_parameter< double >::type res(resSEXP);
    Rcpp::traits::input_parameter< bool >::type kcal(kcalSEXP);
    rcpp_result_gen = Rcpp::wrap(energy(slope, distance, mass, res, kcal));
    return rcpp_result_gen;
END_RCPP
}
// energyscape
NumericMatrix energyscape(NumericMatrix x, int n, double mass, double res, bool kcal);
RcppExport SEXP _enerscape_energyscape(SEXP xSEXP, SEXP nSEXP, SEXP massSEXP, SEXP resSEXP, SEXP kcalSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< double >::type mass(massSEXP);
    Rcpp::traits::input_parameter< double >::type res(resSEXP);
    Rcpp::traits::input_parameter< bool >::type kcal(kcalSEXP);
    rcpp_result_gen = Rcpp::wrap(energyscape(x, n, mass, res, kcal));
    return rcpp_result_gen;
END_RCPP
}
// neighbours
NumericVector neighbours(int i, int j, int n, NumericMatrix x);
RcppExport SEXP _enerscape_neighbours(SEXP iSEXP, SEXP jSEXP, SEXP nSEXP, SEXP xSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type i(iSEXP);
    Rcpp::traits::input_parameter< int >::type j(jSEXP);
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    rcpp_result_gen = Rcpp::wrap(neighbours(i, j, n, x));
    return rcpp_result_gen;
END_RCPP
}
// slope
NumericVector slope(NumericVector x, double center, double res);
RcppExport SEXP _enerscape_slope(SEXP xSEXP, SEXP centerSEXP, SEXP resSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type x(xSEXP);
    Rcpp::traits::input_parameter< double >::type center(centerSEXP);
    Rcpp::traits::input_parameter< double >::type res(resSEXP);
    rcpp_result_gen = Rcpp::wrap(slope(x, center, res));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_enerscape_distances", (DL_FUNC) &_enerscape_distances, 3},
    {"_enerscape_energy", (DL_FUNC) &_enerscape_energy, 5},
    {"_enerscape_energyscape", (DL_FUNC) &_enerscape_energyscape, 5},
    {"_enerscape_neighbours", (DL_FUNC) &_enerscape_neighbours, 4},
    {"_enerscape_slope", (DL_FUNC) &_enerscape_slope, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_enerscape(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
