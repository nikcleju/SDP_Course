---
title: Effects of finite word length representation
 of the filter coefficients
subtitle: Lab 8, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students should observe the effects of having fixed point
coefficients in a digital filter, and be able to mitigate the effects.

# Theoretical notions

# Exercises

1. Convert the following binary number to the decimal value:

    $11011.0101$
    
1. Convert in binary fixed point format (signed, 6 integer bits, 
6 fractionary bits - 1S6I6F the following number:

    $273.21875$

1. Convert in binary fixed point format (signed, 6 integer bits, 
6 fractionary bits - 1S6I6F the following negative numbers.
Negative numbers shall be represented in sign-value, 1's complement (C1)
and 2's complement (C2) formats.
    a. -22
    b. -22.21875
    
1. Quantize the samples $x_1 = 0.42625$ and $x_2 = -0.4333$ 
the fixed point format 1S0I4F via:
    a. Truncation
    b. Rounding
    c. Truncation in absolute value
    
    The negative values shall be represented in C2 format.
    
1. Using the Octave software, use the `cheby1()` function to design one of the following Chebyshev type I filters:

    a. A low-pass IIR filter of order 7, with cutoff frequency of 1kHz at a sampling frequency of 8kHz;
    a. A high-pass IIR filter of order 7, with cutoff frequency of 2.5kHz at a sampling frequency of 8kHz;
    a. A band-pass IIR filter of order 7, with passband between 0.5kHz and 3.5kHz at a sampling frequency of 8kHz;
    a. A stop-band IIR filter of order 7, with stop band between 1kHz and 3kHz, at a sampling frequency of 8kHz. 
    
2. Use the quantization function `cuant()` provided in the lab data files to quantize the coefficients of the filter,
and display the transfer function with `freqz()` in three scenarios:
    - coefficients not quantized (maximum precision)
    - coefficients quantized with 15 fractionary bits
    - coefficients quantized with 6 fractionary bits.
  
    Use rounding as the quantization method.
  
    Display all transfer functions on the same figure, to better evaluate the changes.
  
3. Display the poles and zeros of in each of the three cases above, using `zplane()`
  
3. Evaluate the effect of quantization considering the **parallel implementation** and the **series implementation** of the filter:
    - Use the provided function `qfr()` to compute the frequency response with quantized coefficients, in parallel / series implementation.
      Read inside the function `qfr()` to see how the input and output arguments.
    - Plot the transfer functions in three cases:
        - coefficients not quantized (maximum precision)
        - coefficients quantized with 15 fractionary bits
        - coefficients quantized with 6 fractionary bits.
      
    - Also display the pole-zero plot in each case, using `zplane()`
      
5. Which is the implementation which is most robust to quantization?




# Final questions

1. TBD
