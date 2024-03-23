#include <Rcpp.h>
using namespace Rcpp;
NumericVector slope ( NumericVector x , double center , double res ) {
  const double PI =  3.1415926535;
  int n = x.size();
  NumericVector ans(n);
  double h;
  for (int i = 0; i < n; i++) {
    h = center - x[i];
    ans[i] = atan(h / res) * 180 / PI;
  }
  //diagonal corrections
  if (n == 8) {
    h = center - x[0];
    ans[0] = atan(h / (sqrt(2) * res)) * 180 / PI;
    h = center - x[2];
    ans[2] = atan(h / (sqrt(2) * res)) * 180 / PI;
    h = center - x[5];
    ans[5] = atan(h / (sqrt(2) * res)) * 180 / PI;
    h = center - x[7];
    ans[7] = atan(h / (sqrt(2) * res)) * 180 / PI;
  }
  return ans;
}
