--- 
permalink: archives/2009/09/using-matlab-for-numerical-solutions-to-the-discrete-poisson-equation
wordpress_id: 45
layout: default
title: Using MATLAB for numerical solutions to the discrete Poisson equation
wordpress_url: http://www.cryptosystem.org/?p=45
---
Let's say you've got a 2D image (or matrix) of the Laplacian of some function, and you want to solve for the function. This is actually relatively easy to do with MATLAB, but searching for a step-by-step example I came up with nothing, so I thought I'd show how to do it here.

[Poisson's equation](http://en.wikipedia.org/wiki/Poisson_equation) relates the [Laplacian](http://en.wikipedia.org/wiki/Laplace_operator) (![\Delta f = \nabla^2 f = \nabla \cdot \nabla f](/images/latex/latex=laplace.png)) of some function with its result:

![\left(\nabla^2 u \right)\_{ij}=g\_{ij}](/images/latex/latex=laplaceresult.png)

So in the [discrete Poisson equation](http://en.wikipedia.org/wiki/Discrete_Poisson_equation) we have ![g\_{ij}](/images/latex/latex=g_ij.png) defined as the non-boundary subset of a 2-D rectangular matrix  of dimensions ![m \times n](/images/latex/latex=mtimesn.png). Here ![2 \le i \le m-1, 2 \le j \le n-1](/images/latex/latex=2leilem-1,2lejlen-1.png) to allow for boundary conditions.

Transforming ![u\_{ij}, g\_{ij}](/images/latex/latex=uij,gij.png) into natural ordered vectors ![\left[U\right], \left[b\right]](/images/latex/latex=leftUright,leftbright.png) allows us to rewrite as the ![\left(m-2\right)\left(n-2\right) \times \left(m-2\right)\left(n-2\right)](/images/latex/latex=leftm-2rightleftn-2righttimesleftm-2rightleftn-2right.png) linear system:

![\left[A\right]\left[U\right] = \left[b\right]](/images/latex/latex=leftArightleftUright=leftbright.png)

So, on to the juicy bit, how to express and solve this in MATLAB given you have a ![m \times n](/images/latex/latex=mtimesn.png) 2-D matrix defining ![g\_{ij}](/images/latex/latex=g_ij.png) (for consistency, we'll use variable names equivalent to what's in these equations).

First, we need to reshape ![g](/images/latex/latex=g.png) into a ![\left(m-2\right)\left(n-2\right)\times 1](/images/latex/latex=leftm-2rightleftn-2righttimes1.png) vector ![b](/images/latex/latex=b.png) that skips the boundaries:

    b = -reshape(g(2:(m-1),2:(n-1)),(m-2)*(n-2),1);

If we have uniform Dirichlet boundary conditions ![u=0](/images/latex/latex=u=0.png), ![b](/images/latex/latex=b.png) should now be correct. If you want other boundary conditions for ![u](/images/latex/latex=u.png), you'll need to add them to the appropriate positions in ![b](/images/latex/latex=b.png), which I won't cover here.

Thankfully, MATLAB has a nice built-in gallery of matrices which includes the sparse tridiagonal matrix we need for ![A](/images/latex/latex=A.png):

    A = gallery('poisson',m-2);

We can now solve using the backslash operator:

    U = A\b;

This gives us the result in vector form which we can reshape back to what we want:

    u = reshape(U,m-2,n-2);

You can pad back your ![u = 0](/images/latex/latex=u = 0.png) boundary conditions with:

    u = padarray(u,[1 1]);

And verify the results with:

    laplacian = del2(u)*4;

Which should correspond to ![g](/images/latex/latex=g.png) (with, of course, border discrepancies). There is, perhaps, some entirely built-in way of doing all this, hidden somewhere in the terse documentation.
