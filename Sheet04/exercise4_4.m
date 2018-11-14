#program is written in octave code (4.0.2)
#written by Gerd Mund

1;
clear;
#fix := first array input set which variable is fix 0 := f_0 fix
#                                                   1 := k fix
#       second array input set value of fixed variable
#       third array input set time of plot
#variable := vektor of values of varibale which was not fixed 

fix = [0, 1, 5];    #f_0 fix, f_0 = 1, time = 5 seconds
variable = [2, 4, 6, 8, 10];  #variable values of k

chirp_signal(fix, variable)