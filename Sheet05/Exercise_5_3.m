%Written by Gerd Mund
%Written for Octave 4.0.2
%Should be run with matlab

%The function DT_Exp_Plot await 2 vectors. 
%With the first vector 
%parameters := [frequency_omega, amplitude_c, start_time, end_time]
%the parameters are given to the function
%The second vector gives the number of samples in the time interval

1;
clear;

parameters = [0.7, 1, 0, 5];
sample_values = [20:10:200];

DT_Exp_Plot(parameters, sample_values)