%program is written in octave code (4.0.2)
%written by Gerd Mund
%rewritten for matlab2014

function p_plot(p)
  x = -1:0.001:1;
  x2 = [x, x];
  y = zeros(1,length(x));

  color = ['r', 'b', 'k', 'g', 'm', 'c'];
  hold on
  
  for j = 1:length(p)
    for i = 1:length(x)
      y(i) = (1-(abs(x(i)))^p(j))^(1/p(j));     %calculating p-norm
    end
    y2 = [-y, y];
    txt = ['p = ',num2str(p(j))];
    plot(x2,y2, 'Color', color(mod(j, 6)+1),'DisplayName', txt)
  end
  title('p-norm');
  xlabel('x');
  ylabel('y');
  legend show;
  axis('image');
end