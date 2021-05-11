---
title: Effects of filters applied to noise signals
subtitle: Lab 11, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students should observe the effects of filtering a noise signal, like
the quantization noise generated in finite word length implementrations.

# Theoretical notions

# Exercises

1. In Matlab, generate the following signals, for a value of $\Delta = 0.001$. 
   The signal length should be 10000.

   a. A random signal with uniform distribution $U \; [-\Delta/2, \Delta/2]$
   a. A random signal with uniform distribution $U \; [0, \Delta/2]$
   a. A random signal with uniform distribution $U \; [-\Delta, \Delta]$
  
   Requirements:
   
     - For each signal, compute the mean, variance, and average power 
       (use `mean()`, `var()`). Which signal has the smalles power?
  
     - Display the signals on three separate subfigures on the same figure

2. In Matlab, filter each signal above with the filter:
	$$y[n] = a y[n-1] + x[n]$$
	
	Compute the mean, variance, and average power for each of the output signals.
	
	Try different values of $a$: 0.1, 0.5, 0.9.

3. Do the same filtering in Simulink, as follows:
   
   - Create a model to implement the system
   - Use a `From Workspace` block to read the signals from the Workspace
   - Use a `To Workspace` block to output the results back in the Workspace
   
   Use a `Dashboard Scope` for a nice visualization of the input and output signals.
	
3. Compute the impulse response of this filter (using `impz()`) and verify numerically the relation:
	$$\sigma^2_o = \sigma^2_e \sum_n{h[n]^2} = \sigma^2_e \frac{1}{1 - a^2}$$
	
4. Compute the ratio $Q = \frac{\sigma^2_o}{\sigma^2_e}$ for 100 values of $a$ between $a \in [0.01, 0.99]$
   and plot the value of $Q$ as a function of $a$. Which function is represented here?
	

# Final questions

1. TBD
