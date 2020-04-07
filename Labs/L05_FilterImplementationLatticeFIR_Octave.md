---
title: Implementing digital FIR filters in the lattice form
subtitle: Lab 5, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

The students should become familiar with *lattice*-type realization structure
used for implementing FIR filters.

# Theoretical notions


# Exercises

1. Find the FIR filter coefficients in direct form, if the reflection coefficients
of the lattice FIR structure are:
$K_1 = \frac{1}{2}$, $K_2 = 0.6$, $K_3 = -0,7$, $K_4 = \frac{1}{3}$.

2. Find the reflection coefficients of the lattice structure for a FIR filter with system function:
$$H(z) = 1 + \frac{2}{5}z^{-1} + \frac{7}{20}z^{-2} + \frac{1}{2}z^{-3}$$


3. Using the Octave software, use the `fir1()` function to design one of the following FIR filters:
    
    a. A low-pass FIR filter of order 4, with cutoff frequency of 5kHz at a sampling frequency of 44.1kHz;
    a. A high-pass FIR filter of order 4, with cutoff frequency of 2kHz at a sampling frequency of 44.1kHz;
    a. A band-pass FIR filter of order 4, with passband between 1kHz and 3kHz at a sampling frequency of 44.1kHz.
    
    Read the documentation of the `fir1()` function to find out how to use it.

4. **Not needed; function given**. Create an Octave function to `tf2latc()` to compute the coefficients of the lattice form of a FIR filter, 
starting from the coefficients of the Transfer Function. Call it like this: `K = tf2lact(coef)`

4. Create an Octave script to filter an input signal `x` with a FIR filter in lattice form, for which the reflection coefficients `K` are known:
    
    ```
    y = filter_latc(x, K)
    ```

5. Use the function above to load and low-pass the audio signal `Kalimba.mp3`.

    a) Load the file using `audioread()`
    b) Use `tf2latc()` to convert the filter to lattice form
    c) Filter the signal with `filter_latc()`


# Final questions

1. TBD
