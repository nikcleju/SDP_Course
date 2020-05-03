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

    $\gamma_{xx}[m] = \frac{1}{4}^m.$
	
	Find the difference equation of the random process $x[n]$. Is this unique? 
	If not, find more than one possible solution.

3. In Octave, estimate the spectrum of an audio file.
	a. Load the signal `1st_String_E.ogg` with the function `audioread()`.
    b. Play and plot the sound file
	c. Use the functions `periodogram()` to estimate the power spectral density (PSD) of the signal
    d. Plot the PSD; the actual frequencies should be displayed on the X axis.
	e. Identify the dominant frequency from the spectrum and display its value in Hz.
    f. Repeat for all the other string files provided.

4. In Octave, create a script file which implements a live spectrum analyzer operating on the previous file.
    a. Load the signal `1st_String_E.ogg` with the function `audioread()`.
   	a. Use the function `buffer()` to split the signal into windows of length $L=100ms$.
	c. Use the functions `pwelch()` and `periodogram()` to estimate	and plot, successively, the PSD of each window.
    d. Find the dominant frequency of each window and display it as the title of the image (title should be e.g. "Max freq = 200 Hz").
    e. Think of a wey of detecting silence in the sound, and make the image title "Silence" when this is detected

5. Run the spectrum analyzer on the file "music.wav".

6. Repeat exercise 4, but use instead the Yule-Walker method (`pyulear()` function).

# Final questions

1. How can we create an app to detect if a guitar is in tune or not?
