%program is written in octave code (4.0.2)
%written by Gerd Mund
%rewritten for matlab2014

function chirp_signal(fix, variable)
  time = 0:0.001:fix(3);
  y = zeros(1, length(time));
  for j = 1:length(variable)
    if (fix(1) == 0)  %f0 is fix
      for i = 1:length(time)
        y(i) = sin(2*pi*(fix(2)+(variable(j)*time(i)/2))*time(i));
      end
      figure(j)
      name = ['Fix f_0 = ', num2str(fix(2)), ' and k = ', num2str(variable(j))];
      plot(time, y)
      title(name);
      xlabel('time');
    end
    if (fix(1) == 1)  %k is fix
      for i = 1:length(time)
        y(i) = sin(2*pi*(variable(j)+(fix(2)*time(i)/2))*time(i));
      end
      figure(j)
      name = ['Fix k = ', num2str(fix(2)), ' and f_0 = ', num2str(variable(j))]; 
      plot(time, y)
      title(name);
      xlabel('time');
    end
  end
end