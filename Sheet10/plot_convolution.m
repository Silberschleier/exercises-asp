function [] = plot_convolution(x, y)
  current_x = x;
  
  for n = 1:length(x)+1
    % in each step, plot the current result of the convolution, and the 
    % remaining values of x
    figure()
    range = (0:length(x)-1)
    plot(range, current_x,  '*')
    
    conv_value = 0
    for k = 0:length(x)-1
      if (n-k > 0) & (n-k <= length(y))
        conv_value = conv_value + ( x(k+1) * y(n-k) )
      end
    end
    
    current_x(n) = conv_value
end