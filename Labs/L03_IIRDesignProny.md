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


# Exercises

1. Design with the Prony method an IIR filter of order 2 which approximates the 
following desired impulse response:
$$h_d[n] = \{...0,\underuparrow{1},2,3,2,1,2,3\}$$
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
