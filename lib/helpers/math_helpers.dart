import 'dart:math';

double mapToLogScale(double position) {
  // position will be between 0.1 and 10
  double minp = 0.1;
  double maxp = 10;

  // The result should be between 0.1 an 10
  double minv = log(0.1);
  double maxv = log(10);

  // calculate adjustment factor
  var scale = (maxv - minv) / (maxp - minp);

  return exp(minv + scale * (position - minp));
}
