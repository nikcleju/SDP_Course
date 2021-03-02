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

1. Use the Pade method to find out the parameters of the system with the following system function
$$H(z) = \frac{b_0 + b_1 z^{-1} + b_2 z^{-2}}{1 + a_1 z^{-1} + a_2 z^{-2}},$$
    considering the desired impulse response to be: 
$$h_d[n] = \left(\frac{1}{3}\right)^n \cos\left(\frac{n \pi}{4}\right).$$

1. Use Matlab to solve numerically the Pade system for the previous exercise:
$$
\begin{bmatrix} h_d[0] \\ h_d[1] \\ h_d[2] \\ h_d[3] \\ h_d[4] \\ \end{bmatrix}
= 
\begin{bmatrix} 
0 & 0 & 1 & 0 & 0 \\ 
-h_d[0] & 0 & 0 & 1 & 0 \\ 
-h_d[1] & -h_d[0] & 0 & 0 & 1 \\ 
-h_d[2] & -h_d[1] & 0 & 0 & 0 \\ 
-h_d[3] & -h_d[2] & 0 & 0 & 0 \\ 
\end{bmatrix}
\cdot
\begin{bmatrix} a_1 \\ a_2 \\ b_0 \\ b_1 \\ b_2 \\ \end{bmatrix}
$$ 

1. Implement in Matlab a function for creating and then solving the equation system
resulting from the Pade method:

    ```[b,a] = pade_method(order, hd)```

    The function shall have the following arguments:
	* `order`: the order of the designed filter
	* `hd`: a vector holding the first samples of the desired impulse response
	
	The function shall return the coefficients of the system function for the resulting filter:
	* `b`: the numerator coefficients
	* `a`: the denominator coefficients

2. Use the `pade_method()` function above to design a second order filter with the Pade method, for
approximating the desired impulse response given below:
$$h_d[n] = \left(\frac{1}{3}\right)^n \cdot \cos(\frac{\pi}{4}n)\cdot u[n]$$

3. Use `impz()` to find the impulse response of a filter with 
$$H(z) = \frac{1 - 1.7 z^{-1} + 0.7 z^{-2}}{1 + 1.3 z^{-1} + 0.4 z^{-2}}.$$

    Then use our `pade_method()` to approximate a filter of order 2 from the impulse response.
Do we obtain the same $H(z)$ back again?

3. Load a sample audio file in Matlab and filter it with the filter found above.
Play the filtered signal. How does it sounde like? Compare it with the original signal.

# Final questions

1. TBD
