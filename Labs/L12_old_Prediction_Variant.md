---
title: Linear prediction
subtitle: Lab 12, PSS
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students shall use linear prediction in 
an inpainting application (replace wrong samples in a signal
with predicted values)

# Theoretical notions

# Exercises

1. Consider the system described by the following difference equation:
	$$y[n] = 0.8 y[n-1] + x[n] + x[n-1],$$
	where $x[n]$ is a stationary random process with mean $0$ and
	autocorrelation function $\gamma_{xx}[m] = \left( \frac{1}{2} \right)^{|m|}$
	
	a. Find the power spectral density of the output $y[n]$;
	b. Find the autocorrelation function of the output, $\gamma_{yy}[m]$;
	c. Find the variance $\sigma_{y}^2$ of the output signal.

2. In Matlab, load the audio signal `badsignal.wav`, plot it and play it. 
How does the audio quality sound like? What is the reason for it?

3. Detect and replace the wrong samples using linear prediction.

	a. Use the function `buffer()` to split the signal in windows
	with length of approximately 25ms.
	c. Fit an AR(10) random process for every window, using the 
	function `TBD()`. 
	d. We decide that a sample has error if it differs a lot from
	its prediction according to the AR(10) model, i.e. if $|x(i) - x_{AR10}(i)| > T$. 
	We choose a threshold $T$ such that the number of samples detected as erroneous 
	does not exceed $1\%$ of the total number of samples.
	d. Replace all samples $x(i)$ detected (for which $|x(i) - x_{AR10}(i)| > T$)
	with the predicted value according to the AR(10) model, $x_{AR10}(i)$. 
	e. Reconstruct the full audio signal, plot it and play it.
	How does its audio quality seem now?

4. Using the AR(10) model of the last window from the signal, generate
another 100ms of audio signal (compute how many samples this means).
Append the new samples after the original signal, then plot and play
the result. 


# Final questions

1. TBD
