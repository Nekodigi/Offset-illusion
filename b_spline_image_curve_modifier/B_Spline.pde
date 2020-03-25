PVector Spline(float t) {//Position at t.
  PVector sum = new PVector();
  PVector p;
  for (int i = 0; i < P.size(); i++) {
    p = P.get(i);
    sum.add(PVector.mult(p, SplineBlend(i, DI, knots, t)));
  }
  for(int i = 0; i < DI-1; i++){
    p = P.get(i);
    sum.add(PVector.mult(p, SplineBlend(P.size()+i, DI, knots, t)));
  }
  return sum;
}

int[] SplineKnots(int n, int t) {//size of control point, degree
  int[] u = new int[n + t + 1 + t];

  for (int j = 0; j < n + t + t; j++) {
    if (close) {
      u[j] = j - t + 1;
    } else {
      if (j < t) u[j] = 0;
      else if (j <= n) u[j] = j - t + 1;
      else if (j > n) u[j] = n - t + 2;
    }
  }
  return u;
}

float oMod(float a, float b) {//original mod. if -1%8, return 7
  float result = a%b;
  while (result < 0) {
    result += b;
  }
  return result;
}

float SplineBlend(int k, int t, int[] u, float v) {//index, degree, knots, position
  float rvalue = 0;
  if (t == 1) {
    if ((u[k] <= v)&&(v < u[k + 1]))
      rvalue = 1;
    else
      rvalue = 0;
  } else {
    if ((u[k + t - 1] == u[k])&&(u[k + t] == u[k + 1]))
      rvalue = 0;
    else if (u[k + t - 1] == u[k])
      rvalue = (u[k + t] - v) / (u[k + t] - u[k + 1]) * SplineBlend(k + 1, t - 1, u, v);
    else if (u[k + t] == u[k + 1])
      rvalue = (v - u[k]) / (u[k + t - 1] - u[k]) * SplineBlend(k, t - 1, u, v);
    else//same as above two formula
      rvalue = (v - u[k]) / (u[k + t - 1] - u[k]) * SplineBlend(k, t - 1, u, v) + (u[k + t] - v) / (u[k + t] - u[k + 1]) * SplineBlend(k + 1, t - 1, u, v);
  }
  return rvalue;
}