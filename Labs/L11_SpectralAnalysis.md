---
title: Spectral estimation methods
subtitle: Lab 11, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students should use some well-known spectral estimation methods 
and one of its applications.

# Theoretical notions

# Exercises

1. Find the average value and the autocorrelation function of the 
signal $x[n]$ obtained as the output of an ARMA(1,1) random process with
the following difference equation:
    
	$$x[n] = \frac{1}{2}x[n-1] + w[n] + w[n-1],$$
	
	where $w[n]$ is white noise with variance $\sigma_w^2$ and average value $0$.
	
2. The autocorrelation function of an AR random process $x[n]$ is:

    $\gamma_{xx}[m] = \frac{1}{4}^{|m|}.$
	
	Find the difference equation of the random process $x[n]$. Is this unique? 
	If not, find more than one possible solution.

3. In Matlab, create a script file which implements a live spectrum analyzer.
    
	a. Load the signal `music.wav` with the function `audioread()`.
	b. Use the function `buffer()` to split the signal into windows 
	of length 30ms.
	c. Use the functions `psd()` and `spectrum.periodogram()` to estimate
	and plot, successively,the spectrum of each window signal.
	d. Localize and plot the dominant frequency from the spectrum of each window.
	Convert the frequency to the corresponding musical note and output it.
	e. Repeat the previous requirements, but replace the periodogram method 
	with the Yule-Walker method (`spectrum.yulear()`).

# Final questions

1. TBD
