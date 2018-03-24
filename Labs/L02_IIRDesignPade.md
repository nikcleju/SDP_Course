---
title: IIR filter design with Pade method
subtitle: Lab 2, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Using the Pade method for designing IIR filters of various types

# Theoretical notions


# Exercises

1. Implement in Matlab a function for creating and then solving the equation system
resulting from the Pade method:

    ```[b,a] = pade(order, hd)```

    The function shall have the following arguments:
	* `order`: the order of the designed filter
	* `hd`: a vector holding the first samples of the desired impulse response
	
	The function shall return the coefficients of the system function for the resulting filter:
	* `b`: the numerator coefficients
	* `a`: the denominator coefficients

2. Use the function above to design a second order filter with the Pade method, for
approximating the desired impulse response given below:
$$h_d[n] = \left(\frac{1}{3}\right)^n \cdot \cos(\frac{\pi}{4}n)\cdot u[n]$$

3. Load a sample audio file in Matlab and filter it with the filter found above.
Play the filtered signal. How does it sounde like? Compare it with the original signal.

# Final questions

1. TBD
