--- 
wordpress_id: 45
layout: post
title: Using MATLAB for numerical solutions to the discrete Poisson equation
wordpress_url: http://www.cryptosystem.org/?p=45
---
Let's say you've got a 2D image (or matrix) of the Laplacian of some function, and you want to solve for the function. This is actually relatively easy to do with MATLAB, but searching for a step-by-step example I came up with nothing, so I thought I'd show how to do it here.

[Poisson's equation](http://en.wikipedia.org/wiki/Poisson_equation) relates the [Laplacian](http://en.wikipedia.org/wiki/Laplace_operator) ([latex]\Delta f = \nabla^2 f = \nabla \cdot \nabla f[/latex]) of some function with its result:

[latex]\left(\nabla^2 u \right)\_{ij}=g\_{ij}[/latex]

So in the [discrete Poisson equation](http://en.wikipedia.org/wiki/Discrete_Poisson_equation) we have [latex]g\_{ij}[/latex] defined as the non-boundary subset of a 2-D rectangular matrix  of dimensions [latex]m \times n[/latex]. Here [latex]2 \le i \le m-1, 2 \le j \le n-1[/latex] to allow for boundary conditions.

Transforming [latex]u\_{ij}, g\_{ij}[/latex] into natural ordered vectors [latex]\left[U\right], \left[b\right][/latex] allows us to rewrite as the [latex]\left(m-2\right)\left(n-2\right) \times \left(m-2\right)\left(n-2\right)[/latex] linear system:

[latex]\left[A\right]\left[U\right] = \left[b\right][/latex]

So, on to the juicy bit, how to express and solve this in MATLAB given you have a [latex]m \times n[/latex] 2-D matrix defining [latex]g\_{ij}[/latex] (for consistency, we'll use variable names equivalent to what's in these equations).

First, we need to reshape [latex]g[/latex] into a [latex]\left(m-2\right)\left(n-2\right)\times 1[/latex] vector [latex]b[/latex] that skips the boundaries:

    b = -reshape(g(2:(m-1),2:(n-1)),(m-2)*(n-2),1);

If we have uniform Dirichlet boundary conditions [latex]u=0[/latex], [latex]b[/latex] should now be correct. If you want other boundary conditions for [latex]u[/latex], you'll need to add them to the appropriate positions in [latex]b[/latex], which I won't cover here.

Thankfully, MATLAB has a nice built-in gallery of matrices which includes the sparse tridiagonal matrix we need for [latex]A[/latex]:

    A = gallery('poisson',m-2);

We can now solve using the backslash operator:

    U = A\b;

This gives us the result in vector form which we can reshape back to what we want:

    u = reshape(U,m-2,n-2);

You can pad back your [latex]u = 0[/latex] boundary conditions with:

    u = padarray(u,[1 1]);

And verify the results with:

    laplacian = del2(u)*4;

Which should correspond to [latex]g[/latex] (with, of course, border discrepancies). There is, perhaps, some entirely built-in way of doing all this, hidden somewhere in the terse documentation.
