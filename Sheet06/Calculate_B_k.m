function [B_k] = Calculate_B_k (k)
   
  f1 = @(x) -1.*sin(2.*pi.*k.*x);
  f2 = @(x) sin(2.*pi.*k.*x);

  q1 = quadgk(f1, 0, 0.5);
  q2 = quadgk(f2, 0.50000000000000000000000000000000000000000001, 1);

  B_k = sqrt(2)*(q1+q2);
  
end