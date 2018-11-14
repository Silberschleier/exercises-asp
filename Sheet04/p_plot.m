#program is written in octave code (4.0.2)
#written by Gerd Mund

function p_plot(p)
  x = [-1:0.01:1];
  y = zeros(1,length(x));

  color = ['r', 'b', 'k', 'g', 'm', 'c'];
  hold on
  h = 0;
  
  for j = 1:length(p)
    for i = 1:length(x)
      y(i) = (1-(abs(x(i)))^p(j))^(1/p(j));     #calculating p-norm
    endfor
    txt = ['p = ',num2str(p(j))];
    plot(x,y, 'Color', color(mod(j, 6)+1),'DisplayName', txt)               #plot +y of p-norm
    plot(x,-y, color(mod(j, 6)+1))                                          #plot -y of p-norm
  endfor
  title("p-norm");
  xlabel("x");
  ylabel("y");
  legend show;
endfunction