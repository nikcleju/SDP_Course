---
title: IIR filter design with Prony method
subtitle: Lab 3, SDP
documentclass: scrartcl
fontsize: 12pt
---

\newcommand*{\underuparrow}[1]{\ensuremath{\underset{\uparrow}{#1}}} 

# Objective

Using the Prony method for designing IIR filters of various types

# Theoretical notions

The Prony method has the same purpose as the Pade method: to design a 
system function $H(z)$ of a specified order $n$:

$$H(z) = \frac{b_0 + b_1 z^{-1} + b_2 z^{-2} + ... + b_N z^{-M}}{1 + a_1 z^{-1} + a_2 z^{-2} + ... + a_N z^{-N}}$$

such that the impulse response $h[n]$ is approximately equal to
the desired impulse response $h_d[n]$:

$$h[n] \approx h_d[n]$$

The difference is from the Pade method is in **how** this is done.

The Prony method operates as follows:

1. The denominator coefficients $a_k$ are found by minimizing the **energy of the difference** signal between
$h[n]$ and $h_d[n]$:
  $$E = \sum_{n=-\infty}^{\infty} \left( h[n] - h_d[n] \right)^2$$
  Replacing $h[n]$ with the same formula used in the Pade method leads to an equation system using the autocorrelation function:
  $$to \;\;\; draw \;\;\; at \;\;\; whiteboard$$
  The **autocorrelation function** of $h_d[n]$,  $\Gamma_{hh}[k]$, is defined as:
  $$\Gamma_{hh}[k] = \sum_{n=-\infty}^{\infty} h_d[n] \cdot h_d[n+k]$$

  2. Once $a_k$ are known, the numerator coefficients $b_k$ are found just like in the
Pade method, from the same equations, in the same way.
  
  Note: Because the $b_k$ coefficients, found like in the Pade method, will make the
first $M$ coefficients of $h[n]$ equal to those of $h_d[n]$ (just like Pade),
when computing the autocorrelation function $\Gamma_{hh}[k]$ 
we can consider only the part of $h_d[n]$ which starts after the first $M$ samples.
That's because we don't need to worry about the first $M$ samples, they
will be equal anyway.

## Shank's method

An improved method would be to find the coefficients $b_k$ not from the
Pade equations (suboptimal), but from another energy optimization problem
similar to the one used for finding $a_k$.

This method, known as **Shank's method**, is implemented in Matlab as `prony()`

# Exercises

1. Design with the Prony method an IIR filter of order 2 which approximates the 
following desired impulse response:
$$h_d[n] = \{...0,\underuparrow{1},2,3,2,1,2,3, 0,...\}$$
    (the origin of time $n=0$ is at the first value of 1 in the sequence).

1. Implement in Matlab a function for creating and then solving the equation system
resulting from the **Prony method**:

    ```[b,a] = pronymet(order, hd)```

    The function shall have the following arguments:
	* `order`: the order of the designed filter
	* `hd`: a vector holding the first samples of the desired impulse response
	
	The function shall return the coefficients of the system function for the resulting filter:
	* `b`: the numerator coefficients
	* `a`: the denominator coefficients

2. Use the function above to design a second order filter with the Pade method, for
approximating the desired impulse response given below:
$$h_d[n] = \left(\frac{1}{3}\right)^n \cdot \cos(\frac{\pi}{4}n)\cdot u[n]$$

2. Use the function above to design with the Prony method a filter of order 2
which approximates the following higher-order filter (3):
$$H(z) = \frac{0.0736 + 0.0762 z^{-1} + 0.0762 z^{-1} + 0.0736 z^{-3}}
{1 - 1.3969 z^{-1} + 0.8778 z^{-1} - 0.1812 z^{-3}}$$

    a. Use the function `impz()` to generate a sufficiently long impulse response
    of the given filter;
	b. Use your function `pronymet()` to actually design the filter;
	c. Plot on the same figure the impulse response of the given filter
	and the impulse response of the designed filter, for the first 50 samples.

3. Load a sample audio file in Matlab and filter it with the filter found above.
Play the filtered signal. How does it sound like? Compare it with the original signal.

# Final questions

1. TBD
