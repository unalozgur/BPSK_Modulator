# BPSK_Modulator

Description:
  This function takes center frequency (fc) value, bitrate (Rb) and binary data as
  input to generate BPSK modulated signal (m).

Syntax:
  m = bpsk_modulator(fc,Rb,data,fig)

Inputs:
  fc: Center Frequency in Hertz
  
  Rb: Bitrate in bps
  
  data: Binary data to be transmitted (nx1 or 1xn vector)
  
  fig: Enter "y" or "Y" to plot results.

Outputs:
  m: BPSK modulated signal
