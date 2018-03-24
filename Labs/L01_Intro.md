---
title: Introduction
subtitle: Lab 1, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Reminding students the basic notions of digital signal processing and Matlab basics.

# Theoretical aspects

The following aspects shall be explained.

1. Digital signal processing basics:
  - system, system function
  - impulse response: what it is
  - FIR / IIR systems: what they are, how they differ
  - order of a filter
  - transfer function: complex numbers, modulus and phase, interpretation of modulus and phase
  - poles, zeros: what they are, interpretation
  - basic filter types: lowpass, highpass, bandpass
  - non-ideal filters: transition band, passband ripple, stopband ripple 
   
2. Matlab basics
  - vectors & matrices


# Exercises

1. Load an audiofile using the Matlab function `audioread()`

2. Keep only the first 5 seconds of the signal, discard the rest.

3. Plot the first 50 samples of the audio signal (one channel only).

4. Filter the signal using `filter()` with a filter $H(z) = \frac{1+z^{-1}+z^{-2}}{1}$.

5. Output the result using `audioplayer` and `play()`.


# Final questions

1. TBD
