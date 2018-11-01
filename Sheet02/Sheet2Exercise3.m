#created with Octave vers. 4.2.2

########################################
#Input values
a = 4+i*5; #complex number to convert
number = 4; #number := n-th root
########################################

#exercise 2.3 a
function [r, theta] = convert_C_to_Pol(complexNumber)
  real = real(complexNumber);
  imag = imag(complexNumber);
  
  r = sqrt(real^2 + imag^2);
  theta = atan2(imag, real);
  return
endfunction

function complexNumber = convert_Pol_to_C(r, theta)
  
  real = r*cos(theta);
  imag = r*sin(theta);
  
  complexNumber = real+i*imag;
  return
endfunction  

[r, theta] = convert_C_to_Pol(a);
complexNumber = convert_Pol_to_C(r, theta);

#exercise 2.3 b
function plot_nth_roots_of_unity(number)
  roots = zeros(1,number);
  help3 = 0+i*(2*pi);
  for n = 0:(number-1)
    roots(n+1) = exp(help3/number)^n;
  endfor
  
  figure(1);
  hold;
  compass(roots, 'b')
  for o = 1:number
    if gcd(o, number) == 1
      compass(roots(o), 'r')
    endif
  endfor
  
  t = linspace(0,2*pi,100)'; 
  circsx = cos(t); 
  circsy = sin(t); 
  plot(circsx,circsy);
  grid on
  xlim([-1.5 1.5])
  ylim([-1.5 1.5])
  title ("Drawing primitive n-th roots of unity");
  xlabel ("Re(z)");
  ylabel ("Im(z)i");
  legend ('n-th roots', 'unit circle', 'primitive = red', "location", "northeastoutside");
endfunction

plot_nth_roots_of_unity(number);

#exercise 2.3 c
grad = (2*pi / 360);
radiant = [0:720];
alpha = radiant .* grad;

cos_alpha = cos(alpha);

calc = zeros(1, 721);
for m = 1:721
  help1 = exp(0+i*alpha(m));
  help2 = exp(0-i*alpha(m));
  calc(m) = (help1+help2)/2;   
endfor

error = cos_alpha .- calc;



printf("##########################################\n")
printf("            Sheet 2 Exercise 3\n")
printf("Task a:\n")
printf("Input complex number: ")
a
printf("Converted to polar coordinats:\n")
printf("   - radius: %f\n", r)
printf("   - theta:  %f\n", theta)
printf("Converted back:\n")
complexNumber
printf("\nTask c:\n")
printf("Drawing the n-th roots of unity with n = %d \n", number)
printf("##########################################\n")


figure(2);
plot(radiant, cos_alpha, '+b')
hold on;
plot(radiant, calc, '*r')
plot(radiant, error, '-k')
hold off;
title ("Plot to show cos(a) = [exp(a*i) + exp(-a*i)]/2");
h = legend ({"cos(a)", "[exp(a*i) + exp(-a*i)]/2", "error: |+| - |*|"});
legend (h, "location", "northeastoutside");



