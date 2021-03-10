# SDP Lab 03: IIR Filter Design with Prony method

## Usage

This file is is designed to be run live in a browser. This file is a Jupyter Notebook using the Octave kernel.

Usage:
  - `Shift+Enter` on a code cell = Execute and go to next cell
  - `Ctrl+Enter` on a code cell = Execute and stay at this cell

## Practical considerations

### The autocorrelation function

For a general signal $x[n]$, the autocorrelation function is defined as:
$$r_{xx}[k] = \sum_{n=-\infty}^{\infty} x[n] x[n-k]$$

In Matlab, for a vector `x` of length `L` (values go from `x[1]` to `x[L]`), the autocorrelation is computed with the function `xcorr()`. The following example computes the autocorrelation values:


```octave
pkg load signal  % Run this once only, only for Octave, to load required functions
```


```octave
x = [1,2,3,4];
rxx = xcorr(x)   % Compute the autocorrelation of x
```

There are 2*L-1 values in total (L is the length of `x`), starting from $r_{xx}[-(L-1)]$ up to $r_{xx}[L-1]$. So, the value $r_{xx}[0]$ is actually in the middle of the result vector, `rxx(L)`:


```octave
L = length(x);
rxx(L)     % This is r_xx[0] 
rxx(L+1)   % This is r_xx[1] 
rxx(L-3)   % This is r_xx[-3] 
```

### **Exercise**: plot autocorrelation

**Exercise**: Compute and plot the autocorrelation function for the constant vector $\{3, 3, 3, 3, 3, 3, 3\}$ (use `xcorr()` and `stem()` functions).
The indicate what is the value of $r_{xx}[0]$ and $r_{xx}[2]$


```octave
% TODO: write code here

```

The plot should look like a triangle.

## Restricted autocorrelation for Prony method

For the Prony method we need the values of a **restricted autocorrelation**, defined as:
$$r_{xx}[k,l] = r_{xx}[k-l] = \sum_{n=M+1}^\infty h[n-k] h[n-l] = \sum_{n=M+1-k}^\infty h[n] h[n+(k-l)]$$

The difference is that the **sum doesn't start from $n=0$**, but from a higher value, so the first elements in the sum are skipped.

The restricted autocorrelation can be computed just like the normal autocorrelation, but with the first $M + 1 - max(k,l)$ elements of the vector set to 0.

Consider the example below to compute $r_{xx}[k=1, l=2]$, for $M=2$:


```octave
M = 2;
x = [1,2,3,4];
k=1;
l=2;

x(1 : M+1-max(k,l)) = 0; % Set first elements to 0
x                        % Display the restricted x
rxx = xcorr(x)           % Compute the restricted autocorrelation vector
```

### **Exercise**: make a function for restricted autocorrelation

Create a function `r = xcorr_prony(x, k, l, M)` to compute one value the restricted autocorrelation required for the Prony method.
Make sure to return a single value, $r_{xx}[k-l]$ (remember $r_{xx}[0] = $ `rxx(L)` in Matlab).

Test your function with the following values, for `x = [1,2,3,2,1,2,3]` and `M=2`:
$$\begin{align}
r_{xx}[1,1] &= 27\\
r_{xx}[1,2] &= 22\\
r_{xx}[2,1] &= 22\\
r_{xx}[2,2] &= 31\\
r_{xx}[1] = r_{xx}[1,0] &= 16\\
r_{xx}[2] = r_{xx}[2,0] &= 14\\
\end{align}$$


For this file, you can define it below and run the cell. For running offline in Matlab/Octave, save it as a file `xcorr_prony.m`


```octave
function r = xcorr_prony(x, k, l, M)
% Computes restricted autocorrelation for the Prony method
% Inputs:
%  x = the input vector
%  k,l = the element to compute
%  M = the degree of the numerator polynomial B(z)
% Returns:
%  r = rxx[k,l] = rxx[k-l]


end

% Call it here to find the values, like this:
% xcorr_prony( ... , ... , ... , ...)
```

## Equation systems for the Prony method

The Prony method find first the coefficients $\{a_k\}$ based on a system using the restricted autocorrelation values:

$$
\begin{bmatrix}
r_{dd}[1,1] & r_{dd}[1,2] & \dots & r_{dd}[1,N] \\
r_{dd}[2,1] & r_{dd}[2,2] & \dots & r_{dd}[2,N] \\
\vdots & \dots & \dots & \vdots \\ 
r_{dd}[N,1] & r_{dd}[N,2] & \dots & r_{dd}[N,N] \\
\end{bmatrix}
\begin{bmatrix} 
a_1 \\ 
a_2 \\ 
\vdots \\ 
a_N \\ 
\end{bmatrix}
= 
\begin{bmatrix} 
- r_{dd}[1,0] \\ 
- r_{dd}[2,0] \\ 
\vdots \\ 
- r_{dd}[N,0] \\ 
\end{bmatrix}$$


### **Exercise**: solve the $\{a_k\}$ system for $M=2$

Solve the system for $h_d[n] = \{1,2,3,2,1,2,3\}$, with $M=2$ and $N=2$. Use `linsolve()`.


```octave
A = ...   % 2x2 matrix
B = ...   % 2x1 column vector

a = linsolve(A,B)   % solve
```

The numerator coefficients are found by the same equations as in the Pade method, using the values $\{a_k\}$ found above.
The equations can be written as:
$$b_n = h_d[n] + \sum_{k=1}^N a_k h_d[n-k]$$

A quick way to implement this in Matlab is:


```octave
% Sample input data
hd = [1,2,3,2,1,2,3];
a  = [0.4, 0.5];   % from a_1 onwards
M = 2;             % degree of numerator
N = 2;             % degree of denominator

% Compute bn
n = 1;  % specify which element to compute
bn = hd(n+1) + sum(a(1:n) .* hd(n:-1:1))
```

### **Exercise**: Compute all $b_n$

Copy the exercise above and extend it, in order to find all coefficients $b_n$ and place them in a vector `b`. Use a `for` loop to compute the coefficients.


```octave
% Sample input data
hd = [1,2,3,2,1,2,3];
a  = [0.4, 0.5];   % from a_1 onwards
M = 2;             % degree of numerator
N = 2;             % degree od denominator

% TODO: write here

```

## Final Exercises


1. Implement in Matlab a function for creating and then solving the equation system
resulting from the **Prony method**:

    ```[b,a] = pronymet(order, hd)```

   The function shall have the following arguments:
      - `order`: the order of the designed filter
      
      - `hd`: a vector holding the first samples of the desired impulse response

   The function shall return the coefficients of the system function for the resulting filter:
      - `b`: the numerator coefficients
      
      - `a`: the denominator coefficients

2. Use the function above to design a second order filter with the Prony method, for
approximating the desired impulse response given below:
$$h_d[n] = \left(\frac{1}{3}\right)^n \cdot \cos(\frac{\pi}{4}n)\cdot u[n]$$

    You can reuse the code from the last laboratory to generate the signal $h_d$.

2. Use the function above to design with the Prony method a filter of order 2
which approximates the following higher-order filter (3):
$$H(z) = \frac{0.0736 + 0.0762 z^{-1} + 0.0762 z^{-1} + 0.0736 z^{-3}}
{1 - 1.3969 z^{-1} + 0.8778 z^{-1} - 0.1812 z^{-3}}$$

    - a. Use the function `impz()` to generate the impulse response
      of the given filter, for at least 100 time moments;
      
      **Note**: `impz()` is used to generate the impulse response of a system, as follows:
      ```h = impz(b,a,N); ```
      where `b` and `a` are the coefficients of the system, and `N` is the desired length
    
    - b. Use your function `pronymet()` to actually design the filter;
    
    - c. Plot the impulse response of the given filter, and the impulse response of the designed filter, for the first 50 samples.
    Are any samples identical?

3. Load a sample audio file in Matlab and filter it with the filter found above, just like we did in Lab 01.
Play the filtered signal. How does it sound like? Compare it with the original signal.

