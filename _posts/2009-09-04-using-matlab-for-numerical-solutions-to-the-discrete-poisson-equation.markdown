--- 
permalink: archives/2009/09/using-matlab-for-numerical-solutions-to-the-discrete-poisson-equation
wordpress_id: 45
layout: post
title: Using MATLAB for numerical solutions to the discrete Poisson equation
wordpress_url: http://www.cryptosystem.org/?p=45
---
Let's say you've got a 2D image (or matrix) of the Laplacian of some function, and you want to solve for the function. This is actually relatively easy to do with MATLAB, but searching for a step-by-step example I came up with nothing, so I thought I'd show how to do it here.

[Poisson's equation](http://en.wikipedia.org/wiki/Poisson_equation) relates the [Laplacian](http://en.wikipedia.org/wiki/Laplace_operator) (<span class="latex">$\Delta f = \nabla^2 f = \nabla \cdot \nabla f$</span>) of some function with its result:

<span class="latex">$\left(\nabla^2 u \right)\_{ij}=g\_{ij}$</span>

So in the [discrete Poisson equation](http://en.wikipedia.org/wiki/Discrete_Poisson_equation) we have <span class="latex">$g\_{ij}$</span> defined as the non-boundary subset of a 2-D rectangular matrix  of dimensions <span class="latex">$m \times n$</span>. Here <span class="latex">$2 \le i \le m-1, 2 \le j \le n-1$</span> to allow for boundary conditions.

Transforming <span class="latex">$u\_{ij}, g\_{ij}$</span> into natural ordered vectors <span class="latex">$\left[U\right], \left[b\right]$</span> allows us to rewrite as the <span class="latex">$\left(m-2\right)\left(n-2\right) \times \left(m-2\right)\left(n-2\right)$</span> linear system:

<span class="latex">$\left[A\right]\left[U\right] = \left[b\right]$</span>

So, on to the juicy bit, how to express and solve this in MATLAB given you have a <span class="latex">$m \times n$</span> 2-D matrix defining <span class="latex">$g\_{ij}$</span> (for consistency, we'll use variable names equivalent to what's in these equations).

First, we need to reshape <span class="latex">$g$</span> into a <span class="latex">$\left(m-2\right)\left(n-2\right)\times 1$</span> vector <span class="latex">$b$</span> that skips the boundaries:

    b = -reshape(g(2:(m-1),2:(n-1)),(m-2)*(n-2),1);

If we have uniform Dirichlet boundary conditions <span class="latex">$u=0$</span>, <span class="latex">$b$</span> should now be correct. If you want other boundary conditions for <span class="latex">$u$</span>, you'll need to add them to the appropriate positions in <span class="latex">$b$</span>, which I won't cover here.

Thankfully, MATLAB has a nice built-in gallery of matrices which includes the sparse tridiagonal matrix we need for <span class="latex">$A$</span>:

    A = gallery('poisson',m-2);

We can now solve using the backslash operator:

    U = A\b;

This gives us the result in vector form which we can reshape back to what we want:

    u = reshape(U,m-2,n-2);

You can pad back your <span class="latex">$u = 0$</span> boundary conditions with:

    u = padarray(u,[1 1]);

And verify the results with:

    laplacian = del2(u)*4;

Which should correspond to <span class="latex">$g$</span> (with, of course, border discrepancies). There is, perhaps, some entirely built-in way of doing all this, hidden somewhere in the terse documentation.
