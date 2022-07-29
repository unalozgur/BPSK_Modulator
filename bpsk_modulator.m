  %% Description:
  %% This function takes center frequency (fc) value, bitrate (Rb) and binary data as
  %% input to generate BPSK modulated signal (m).
  %%
  %% Syntax:
  %% m = bpsk_modulator(fc,Rb,data,fig)
  %%
  %% Inputs:
  %% fc: Center Frequency in Hertz
  %% Rb: Bitrate in bps
  %% data: Binary data to be transmitted (nx1 or 1xn vector)
  %% fig: Enter "y" or "Y" to plot results.
  %% 
  %%
  %% Outputs:
  %% m: BPSK modulated signal



function m = bpsk_modulator(fc, Rb, data, fig)
  
  fs = 20*fc;                             % Sampling frequency
  td = length(data)/Rb;                   % Time duration to transmit the data, which is given as input
  t = 0:1/fs:td-1/fs;                     % Time vector
  c = sin(2*pi*fc.*t);                    % Carrier signal
  
  if isrow(data)
    data = data';
  endif
  
  %% Data manipulation before modulation
  Nb = length(c)/length(data);
  data = repmat(data,1,Nb)';
  data = data(:)';
  %% End of manipulation

  data = 2*data-1;                        % Conversion to NRZ
  m = data.*c;                            % BPSK modulated signal
  
  % Frequency Spectrum generation of BPSK modulated signal
  n = 2^nextpow2(length(m));              % Number of FFT points
  P2 = abs(fft(m,n)/n);                   % FFT of the BPSK modulated signal
  P1 = flip(P2(end/2+1:end));
  f = (fs/n).*(0:n/2-1);                  % Frequency vector
  
  if fig == "y" || fig == "Y"
  % Plot the results
  subplot(3,1,1);
  plot(t,data); title('Data to be transmitted');
  ylabel("Amplitude"); xlabel("Time (s)");
  ylim([-3 3]); grid on;

  subplot(3,1,2);
  plot(t,m); title('BPSK Modulated Signal');
  ylabel("Amplitude"); xlabel("Time (s)");
  ylim([-2 2]);grid on;

  subplot(3,1,3);
  plot(f,10*log10(P1)); title('Frequency Spectrum of BPSK Modulated Signal');
  ylabel("M (dB)"); xlabel("Frequency (Hz)");
  grid on;
  endif
  
end