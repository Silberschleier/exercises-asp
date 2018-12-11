clear;

% Load the *.mat file 
File = load("random_signal.mat", "-mat");
% File is a struct, so read out the values of the struct
tmp = 1; % to show, how more samples lower the error of reconstruction
Fs = File.Fs/tmp;
signal = File.signal;

% Calculate the length of the signal in seconds and create a time array
t = 0:1/Fs:length(signal)/Fs-(1/Fs);

% Calculate the time to take samples
Ts = 0:Fs:length(signal);
Ts = Ts./Fs;
% Take samples at sample time
sampels = signal(1:Fs-1:length(signal));

% Plot signal and samples
figure(1)
line([0 20*tmp], [0 0], "linestyle", "--", "color", "k")
hold on
plot(t, signal, 'r')
stem(Ts, sampels, 'bo')
title('Signal[red] and Sampels [blue]')


% Reconstruct the original signal out of samples
% Calculate for each sample the sinc function shifted to sample time and wrt sample amplitude
y = zeros(length(sampels), length(t));
for i = 1:length(sampels)
  y(i,:) = sinc(t-(i-1))*sampels(i);
end

figure(2)
plot(t, signal, 'r')
hold on
plot(t, y, 'g:')
title('Signal [red] and sinc fuctions of sampels [green]')

% Sum all single sinc functions up to one function to reconstruct the original signal
reconstruct = y(1,:);
for i = 2:length(sampels)
  reconstruct = reconstruct .+ y(i, :);
end

figure(3)
hold on
plot(t, signal, 'r')
plot(t, reconstruct, 'g')
line([0 20*tmp], [0 0], "linestyle", "--", "color", "k")
title('Signal [red] and reconstructed signal [green]')

% Calculate error of reconstructed signal
error = 0.5.*(signal .- reconstruct).^2;
figure(4)
plot(t, error, 'k')
title('Error of reconstruction')
