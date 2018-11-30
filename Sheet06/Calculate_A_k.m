function [A_k] = Calculate_A_k (k)
   
  f1 = @(x) -1.*cos(2.*pi.*k.*x);
  f2 = @(x) cos(2.*pi.*k.*x);

  q1 = quadgk(f1, 0, 0.5);
  q2 = quadgk(f2, 0.50000000000000000000000000000000000000000011, 1);

  A_k = sqrt(2)*(q1+q2);

end