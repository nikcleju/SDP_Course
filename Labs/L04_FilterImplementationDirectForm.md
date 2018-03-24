---
title: Implementation structures for digital filters
subtitle: Lab 4, SDP
documentclass: scrartcl
fontsize: 12pt
---

# Objective

The students should become familiar with various realization structures
for digital filters and implement them in the Simulink environment.

# Theoretical notions


# Exercises

1. For a general IIR filter of order 3, with system function
$$H(z) = \frac{b_0 + b_1 z^{-1} + b_2 z^{-2} + b_3 z^{-3}}{1 + a_1 z^{-1} + a_2 z^{-2} + a_3 z^{-3}},$$
draw the realization structure in the following forms:

    a. direct form I
    b. direct form II
    c. direct form II transposed

2. For the digital filter with system function 
$$H(z) = \frac{2 (1 -z^{-1}) (1 + \sqrt(2) z^{-1} + z^{-2})}{(1 + 0.5 z^{-1}) (1 - 0.9 z^{-1} + 0.81 z^{-2}},$$
draw the realization structure in one of the series forms.

2. For the digital filter with system function
$$H(z) = \frac{5 - 6 z^{-1} + 3.72 z^{-2} - 0.74 z^{-3}}{1 - 1.5 z^{-1} + 1.24 z^{-2} - 0.37 z^{-3}} = 2 + \frac{1}{1-0.5 z^{-1}} + \frac{2 - z^{-1}}{1 - z^{-1} + 0.74 z^{-2}},$$
draw the realization structure in the parallel form.

1. In the Matlab environment, use the `fdatool` tool to design one of the following filters:
    
    a. A low-pass IIR filter of order 4, elliptic type, with cutoff frequency of 4kHz at a sampling frequency of 44.1kHz;
    a. A high-pass IIR filter of order 4, elliptic type, with cutoff frequency of 1kHz at a sampling frequency of 44.1kHz;
    a. A band-pass IIR filter of order 4, elliptic type, with passband between 700Hz and 4kHz at a sampling frequency of 44.1kHz.

1. In the Simulink environment, implement the above filters in direct form II. Apply at the input an audio signal and play the output signal, as well as the original, for comparison.
How does the filtered signal sound like, compared to the original?


# Notes:

- Set the following parameters for the SImulink model, to enable a discrete simulation with fixed (auto) step:
    - Type: *Fixed-step*
    - Solver: *discrete (no continuous states)*
    
![Model settings for discrete models](img/Simulink_Settings_Model.png)

- You will need the blocks *Unit Delay*, *Sum* and *Gain*
- At the input put a *From Multimedia File* block, and at the output put a *To Audio Device* block
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
