function [number] = found_number (f)

%f is frequenz around original frequenz we need to put it back to origin frequenz
if f(1) < 710
  f1 = 697;
end
if f(1) < 780 && f(1) > 760
  f1 = 770;
end
if f(1) < 860 && f(1) > 840
  f1 = 852;
end
if f(1) > 930
  f1 = 941;
end
if f(2) < 1220
  f2 = 1209;
end
if f(2) < 1350 && f(2) > 1320
  f2 = 1336;
end
if f(2) > 1460
  f2 = 1477;
end

%decode number out of frequencies
if f1 == 697 && f2 == 1209
  number = "1";
end
if f1 == 697 && f2 == 1336
  number = "2";
end
if f1 == 697 && f2 == 1477
  number = "3";
end
if f1 == 770 && f2 == 1209
  number = "4";
end
if f1 == 770 && f2 == 1336
  number = "5";
end
if f1 == 770 && f2 == 1477
  number = "6";
end
if f1 == 852 && f2 == 1209
  number = "7";
end
if f1 == 852 && f2 == 1336
  number = "8";
end
if f1 == 852 && f2 == 1477
  number = "9";
end
if f1 == 941 && f2 == 1209
  number = "*";
end
if f1 == 941 && f2 == 1336
  number = "0";
end
if f1 == 941 && f2 == 1477
  number = "#";
end

end