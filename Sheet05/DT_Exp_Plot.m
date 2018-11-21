%Written by Gerd Mund
%Written for Octave 4.0.2
%Should be run with matlab

%The function await 2 vectors. 
%With the first vector 
%parameters := [frequency_omega, amplitude_c, start_time, end_time]
%the parameters are given to the function
%The second vector gives the number of samples in the time interval


function DT_Exp_Plot (parameters, sample_values)
  %rename parameters for better overview
  frequency_omega = parameters(1);
  amplitude_c = parameters(2);
  start_time = parameters(3);
  end_time = parameters(4);
  %calculating length of time interval
  length_of_time_interval = end_time - start_time;
  
  for m = 1:length(sample_values)     %for all sample_values
    %calculating stepside to get the right number of samples for the interval
    stepside = length_of_time_interval / (sample_values(m)-1);
    %creating x-array
    time_line = start_time:stepside:end_time;
    %creating y-array
    values = zeros(1, length(time_line));
    
    for n = 1:length(time_line)       %calculating all f(x)    
      values(n) = amplitude_c * exp(i*(frequency_omega+2*pi)*time_line(n));   
    end

    %plotting the graph
    figure(m);
    plot(time_line, values, 'b.');
    xlabel('time')
    sample = int2str(sample_values(m));
    string = ['Plot for ', sample, ' samples'];
    title(string)
    pause(0.5)    
  end
end
