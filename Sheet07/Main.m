1;
clear;

%read in *.wav file
[y, fs] = audioread("dialtones.wav");
number_of_dialed_numbers = 6;

%found out how many points 1 sec are
len = length(y)/number_of_dialed_numbers;

%cut the *.wav file into 6 pieces
y1 = y(1:len);
y2 = y(len+1:2*len);
y3 = y(2*len+1:3*len);
y4 = y(3*len+1:4*len);
y5 = y(4*len+1:5*len);
y6 = y(5*len+1:length(y));

%find the two frequencies into the piece of *.wav file
%decode after the dialed number out of the two frequencies
f1 = found_frequenz(y1);
Number1 = found_number(f1);
f2 = found_frequenz(y2);
Number2 = found_number(f2);
f3 = found_frequenz(y3);
Number3 = found_number(f3);
f4 = found_frequenz(y4);
Number4 = found_number(f4);
f5 = found_frequenz(y5);
Number5 = found_number(f5);
f6 = found_frequenz(y6);
Number6 = found_number(f6);

%output dialed number
disp(["The dialed number is ", Number1, Number2, Number3, Number4, Number5, Number6])