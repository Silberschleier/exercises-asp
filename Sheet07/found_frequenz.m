function [frequenz] = found_frequenz (y)
  %FFT of the audio to get frequenz
  yft = fft(y);

  %looking for both frequencies wrt the interval of frequencies of numbers
  yabs = abs(yft(600:1500));
  [_, f1 ] = max(yabs);
  yabs(f1) = 0;
  [_, f2 ] = max(yabs);

  %return vector of both frequencies
  frequenz = sort([f1 + 600, f2 + 600]);
end
