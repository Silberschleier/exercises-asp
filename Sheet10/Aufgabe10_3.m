1;
clear;
pkg load statistics;

% creating timeline
sample_frequenz = 1000;
x = 0:1/sample_frequenz:1-1/sample_frequenz;

% creating sinewave
amplitude = 1;
frequenz = 1;
phase = 0;
y = amplitude*sin(2*pi*frequenz*x+phase);

% creating noise
noise_faktor = 0.1;
noise = normrnd(0, 0.8, 1, length(y));

% add noise to sinewave
y = y + noise;

% plot noisy sinewave
figure(1)
plot(x,y)

% averaging ?lter
N = 50;
average = zeros(1,length(y));

for i = 1:length(y)
  start = i - round(N/2);
  ende = i + round(N/2);
  % index out of bounds handle
  if start < 1
    start = 1;
  end
  if ende > length(y)
    ende = length(y);
  end
  
  %calculate average of original signal
  help = y(start:ende);
  average(i) = sum(help)/length(help);
end

% plot average signal
figure(2)
plot(x,average)

% hann filter
w = transpose(hanning(N+1));
tmp = [zeros(1,25),y,zeros(1,25)];
tmp2 = sum(w);

hann_signal = zeros(1,length(y));

  %calculate hann of original signal
for i = 1:length(y)
  hlp1 = tmp(i:i+50);
  hann_signal(i) = sum(w.*hlp1)/tmp2;
end

% plot hann signal
figure(3)
plot(x,hann_signal)

% calculate frequency out of the signals
FT_signal = abs(fft(y));
FT_average = abs(fft(average));
FT_hann = abs(fft(hann_signal));

% plot frequenz of noisy signal without calculating the right frequency
figure(4)
plot(fftshift(FT_signal))

% plot frequenz of averaging signal without calculating the right frequency
figure(5)
plot(fftshift(FT_average))

% plot frequenz of hanning signal without calculating the right frequency
figure(6)
plot(fftshift(FT_hann))
