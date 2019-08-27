---
title: Wiener Filter for signal denoising
subtitle: Laboratory 13, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students should design and use a Wiener filter in a denoising application.

# Theoretical notions

# Exercises

1. Consider the signal $x[n] = s[n] + w[n]$, where $s[n]$ is an autoregressive (AR)
random process of order 1, with the difference equation:
    $$s[n] = 0.6 \cdot s[n-1] + v[n].$$

    The signals $w[n]$ and $v[n]$ are white noises, uncorrelated, with variances
$\sigma^2_w = 1$ and $\sigma^2_v = 0.64$.

	a. Find the autocorrelation function of the signals $s$ and $x$, 
	$\gamma_{ss}[m]$ and $\gamma_{xx}[m]$;
	b. Find the Wiener filter of length $M=2$ for estimating $s[n]$ from $x[n]$;
	c. Find the minimum mean squared error for $M=2$.


1. In Matlab, consider the following signal:

	$$s[n] = \sin(2 \pi f_1 n) + \sin(2 \pi f_2 n),$$
	
	where $f_1 = 0.013$, $f_2 = 0.051$ and $n=0:999$.

	To the signal $s[n]$ we add a white noise with variance $\sigma_w^2 = 0.25$,
	the resulting signal being $x[n] = s[n] + w[n]$.

	a. Using the function `wienerfir()`, find the coefficients of the Wiener FIR filter
        with M=20 and filter the signal $x[n]$ with this filter;
	b. Plot on the same figure the three signals $s[n]$, $x[n]$ and the result of the filtering;
    	c. Compute the resulting mean squared error;
	d. Repeat all the above for different values of M=40, 100. What do you notice?

# Final questions

	1. TBD
