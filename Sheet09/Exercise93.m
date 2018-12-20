clear;

function_number = 1;
if function_number == 1
  % Get a signal out of a file
  File = load("random_signal.mat", "-mat");
  signal = File.signal;
end

if function_number == 2
  % sin function
  time = 0:0.01:4*pi;
  signal = sin(time);
end

% plot the original signal
figure(1)
hold on
plot(signal, 'r')
axis ('tight')


% the function get the original signal and a array with count of samples and the max amplitude
% originial_signal is a 1xn array
% options is a 1x2 array := (#_samples, +/-x_max)
function [manipulated_signal] = uniform_scalar_quantizer(original_signal, options)
  % calculation of some variables needed to manipulate the signal
  count_samples = options(1);
  x_max = options(2);
  original_signal_size = length(original_signal);
  
  % calculate the point from the original signal where i have to get the sample from
  steps = round(original_signal_size / (count_samples-1));
  
  % get the samples wrt to x_max
  man_signal = zeros(1, original_signal_size);
  
  % first samples
  for i = 1:steps
    sample = original_signal(round(steps/2));
    if sample < -x_max
      sample = -x_max;
    end
    if sample > x_max
      sample = x_max;
    end
    man_signal(i) = sample;
  end
  % middle samples
  for i = 1:count_samples-2
    for j = -round(steps/2):1:round(steps/2)
      sample = original_signal(i*steps);
      if sample < -x_max
        sample = -x_max;
      end
      if sample > x_max
        sample = x_max;
      end
      man_signal((i*steps)+j) = sample;
    end
  end
  % last samples
  for i = (((count_samples-2)*steps)+round(steps/2)):original_signal_size
    sample = original_signal(original_signal_size);
    if sample < -x_max
      sample = -x_max;
    end
    if sample > x_max
      sample = x_max;
    end
    man_signal(i) = sample;    
  end
  
  % plot the sampled signal into the same figure like the original one
  plot(man_signal, 'b')
  
  % plot x_max
  line([0, original_signal_size], [x_max, x_max], "linestyle", "--", "color", "k")
  line([0, original_signal_size], [-x_max, -x_max], "linestyle", "--", "color", "k")
  
  % plot zero line
  line([0, original_signal_size], [0, 0], "linestyle", "-", "color", "k")
  
  %plotting error
  figure(2)
  hold on
  plot((original_signal.-man_signal))
  % plot zero line
  line([0, original_signal_size], [0, 0], "linestyle", "-", "color", "k")
  
  % creating the output of the function
  manipulated_signal = [man_signal];
  
end

% testing the function
x_max = 0.75;
count_sample = 40;
options = [count_sample, x_max];
manipulated_signal = uniform_scalar_quantizer(signal, options);
