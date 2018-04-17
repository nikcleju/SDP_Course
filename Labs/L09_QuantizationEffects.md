---
title: Effects of quantization in digital filtering
subtitle: Lab 9, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

Students should observe the effects of internal quantization errors on the
output signal of a digital filter.

# Theoretical notions


# Exercises

1. Consider the system with the following difference equation:

	$$y[n] = \frac{1}{2}y[n-1] + x[n]$$

	Compute the first 6 samples of the response to the input signal 
	$x[n] = \left(\frac{1}{4}\right)^n$, in three different ways:
	
	a. Computations with infinite precision
	b. Computations with fixed-point 1S0I4F format, quantize by truncation
	c. Computations with fixed-point 1S0I4F format, quantize by rounding
    
1. In Matlab, write a script file to study the quantization of 
the `mtlb` signal on $N=8$ bits.
    a. Load the predefined `mtlb` signal (use `load mtlb`);
    a. Figure out if a sign bit is needed or not;
	b. Find the maximum absolute value of the signal, and figure out 
	the number of bits required for the integer part. 
	The remaining bits with be allocated to the fractionary part;
	c. Use the function `fixdt()` to create the corresponding fixed-point data type;
	d. Use the function `num2fixpt` to convert the signal `mtlb` to the
	fixed-point data type, using all the three quantization methods;
	e. For all the three quantization methods, visualize the quantized signal,
	the quantization error, and compute the total energy of the quantization errors. 
	Which quantization error produces minimum errors?
	f. Play the quantized signal. Can you hear the difference from the
	original signal?
	
2. In Matlab, create a function to implement the system from
exercise 1. The values shall be quantized after each multiplication 
and addition. Apply at the system input the quantized signal from
exercise 2, and display the output.

# Final questions

1. TBD
