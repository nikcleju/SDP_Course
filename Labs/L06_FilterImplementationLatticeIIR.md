---
title: Implementing digital IIR filters in the lattice form
subtitle: Lab 6, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

The students should become familiar with *lattice*-type realization structure
used for implementing IIR filters.

# Theoretical notions

The *lattice-ladder* implementation form of an IIR filter of order 3 is below:

![Lattice-ladder form, IIR order 3](img/LatticeIIR_handdraw.png)

Equations:

$$\begin{aligned}
H(z) &= \frac{C(z)}{A(z)}
\end{aligned}$$

The reflection coefficients $K_i$ are found just like for FIR systems (previous lab.):
$$\begin{aligned}
A_0(z) &= B_0(z) = 1 \\
A_m(z) &= A_{m-1}(z) + K_m \cdot z^{-1} \cdot B_{m-1}(z) \\
A_{m-1}(z) &= \frac{A_m(z) - K_m  \cdot B_m(z)}{1 - K_m^2} \\
B_m(z) &= z^{-m} B_m(z^{-1}) = \textrm{ like }A_m(z)\textrm{, with coefficients reversed}
\end{aligned}$$

Additionally, for the $\nu_i$ coefficients we use a similar equation:
$$\begin{aligned}
C_{m-1}(z) &= C_m(z) - \nu_m  \cdot B_m(z)
\end{aligned}$$


# Exercises

1. Consider the causal IIR system with poles and zeros, with the system function:
$$H(z) = \frac{ 1 + 2z^{-1} + 3z^{-2} + 2z^{-3} }{ 1 + \frac{2}{5}z^{-1} + \frac{7}{20}z^{-2} + \frac{1}{2}z^{-3} } $$

	Find and draw the equivalent *lattice* structure for the IIR filter.

2. Consider the causal IIR system, with no zeros, with the following system function:
$$H(z) = \frac{1}{ 1 + \frac{2}{5}z^{-1} + \frac{7}{20}z^{-2} + \frac{1}{2}z^{-3} } $$
	
	Find and draw the equivalent *lattice* structure for the IIR filter.

	
1. In the Matlab environment, use the `fdatool` tool to design one of the following filters:
    
    a. A low-pass IIR filter of order 4, elliptic type, with cutoff frequency of 6kHz at a sampling frequency of 44.1kHz;
    a. A high-pass IIR filter of order 4, elliptic type, with cutoff frequency of 2.5kHz at a sampling frequency of 44.1kHz;
    a. A band-pass IIR filter of order 4, elliptic type, with passband between 0.5kHz and 5.5kHz at a sampling frequency of 44.1kHz.

4. Export the coefficients to Matlab and convert them to the *lattice* form using `tf2latc()`


1. In Simulink, implement the above filters in *lattice* form. 
Apply at the input an audio signal and show and listen to the output signal, as well as the to original.
How does the filtered signal sound like, compared to the original?    

5. In Simulink, apply a video file to the input (select a video file in the `From Multimedia File` block). 
Replace the audio output blocks with a `Video Viewer` block.
How does the filtered signal look like?


# Notes:

- Set the following parameters for the SImulink model, to enable a discrete simulation with fixed (auto) step:
    - Type: *Fixed-step*
    - Solver: *discrete (no continuous states)*
    
![Model settings for discrete models](img/Simulink_Settings_Model.png)

- You will need the blocks *Unit Delay*, *Sum* and *Gain*
- At the input put a *From Multimedia File* block, and at the output put a  *Buffer* followed by *Audio Device Writer* block
- At the output, before the *To Audio Device* block, put a *Manual Switch* block in order to be able to switch easily
between the original signal and the filtered one
- For the *From Multimedia File* block, select an audio file (de ex. Kalimba.mp3 from My Documents)
and update the following settingsȘ
    - choose *Sample-based*
    - *Samples per audio channel* = 1 
    - "DataTypes/Audio output data type" = *double*

![Settings for the *From Multimedia Device* block - part 1](img/Simulink_Settings_FromMMDevice_1.png){width=50%}
![Settings for the *From Multimedia Device* block - part 2](img/Simulink_Settings_FromMMDevice_2.png){width=50%}


# Final questions

1. TBD

