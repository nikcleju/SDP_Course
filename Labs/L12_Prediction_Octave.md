---
title: Linear prediction
subtitle: Lab 12, PSS
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students shall use linear prediction in a simple application on time-series prediction.

# Theoretical notions

# Exercises

1. Consider the system described by the following difference equation:
	$$y[n] = 0.8 y[n-1] + x[n] + x[n-1],$$
	where $x[n]$ is a stationary random process with mean $0$ and
	autocorrelation function $\gamma_{xx}[m] = \left( \frac{1}{2} \right)^{|m|}$
	
	a. Find the power spectral density of the output $y[n]$;
	b. Find the autocorrelation function of the output, $\gamma_{yy}[m]$;
	c. Find the variance $\sigma_{y}^2$ of the output signal.

2. In Octave, load the data from file `COVID_World.csv` using the function `csvread()`. 
It contains the daily number of new cases worldwide, starting from 17 January and going to 11 May.
    a. Plot the data;
    b. Plot the cumulative sum of the data (total number of cases up to each day).

3. Also load and display the data from file `COVID_Ro.csv`, which contains only the cases in Romania. 
starting from 11 May and going back to 17 January. 
Flip the data (so it is arranged cronologically, starting with 1st January and ending with today's value).

4. Use the provided function `lpc()` to estimate the Linear Prediction Coefficients from the data.
Try different prediction orders (e.g. 5, 10, 30).
    a. First, install the Octave packages `nan` and `tsa`, then load them:

        ```
        pkg install -forge nan
        pkg install -forge tsa

        pkg load nan
        pkg load tsa    
        ```
        
    b. Which of the past samples is the most significant predictor of a sample?
    c. Plot the prediction alongside the original data in order to estimate the prediction quality;
    d. Plot the prediction error signal;
    e. Predict the future number of cases for the next 3 days.

4. Repeat the estimation on the cumulative sum of the data.

5. Generate a sinusoidal signal with frequency $f=0.03$, of length 3000 samples, with random noise of amplitude 0.1 added on top of it.
Estimate the Linear Prediction Coefficients and plot the prediction and the signal on the same figure. Which one has lower amounts of noise?



# Final questions

1. TBD
