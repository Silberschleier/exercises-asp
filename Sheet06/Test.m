1;
clear;

%calculate fourier coefficients
k = [5, 25, 50];
A_k = zeros(1,length(k));
B_k = zeros(1,length(k));



for i = 1:3
  A_k(i) = Calculate_A_k(k(i));
  B_k(i) = Calculate_B_k(k(i));
end

%plot f(t)
#t = 0:0.001:1;
#t1 = 0:0.001:0.5;
#y1 = -1.*ones(1, length(t1));
#t2 = 0.5001:0.001:1;
#y2 = ones(1,length(t2));

#hold
#plot(t1,y1, "b")
#plot(t2,y2, "b")
#plot(0.5, 1, "bo")
#plot(t,zeros(1,length(t)), "k")
#axis([0,1,-2,2])

% plot Fourier series expansion

t = 0:0.001:1;
t1 = 0:0.001:0.5;
f1 = -1;
t2 = 0.5001:0.001:1;
f2 = 1;

function [y] = fourier_exp(f, t,k, A_k, B_k)
  y = zeros(1,length(t))
  for i = 1:length(t)
    y(i) = f + sum(A_k)*sqrt(2)*cos(2 *pi*k*i) + sum(B_k)*sqrt(2)*sin(2*pi*k*i)
  end
end

for k = 1:5
  hold on
  plot(t1, fourier_exp(f1, t1, k, A_k, B_k), "b")
  plot(t2, fourier_exp(f2, t2, k, A_k, B_k), "b")
  plot(0.5, 1, "bo")
  plot(k,zeros(1,length(t)), "k")
  axis([0,1,-2,2])
end