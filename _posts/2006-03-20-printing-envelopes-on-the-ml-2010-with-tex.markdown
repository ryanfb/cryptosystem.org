--- 
permalink: archives/2006/03/printing-envelopes-on-the-ml-2010-with-tex
wordpress_id: 20
layout: post
title: Printing Envelopes on the ML-2010 with TeX
wordpress_url: http://www.cryptosystem.org/archives/2006/03/printing-envelopes-on-the-ml-2010-with-tex/
---
I recently needed to print some size 10 envelopes using a Samsung ML-2010 laser printer under Linux. While printing envelopes using OpenOffice is possible, after a few trial runs I wasn't really happy with the output and decided TeX/LaTeX might be better suited to the job. Adapting Michael Stutz's code from [here](http://cbbrowne.com/info/tex.html) gave me the following:

    % envelope.tex
    % Print a #10 envelope
    
    \font\cmssa = cmss12
    \font\cmssc = cmss14
    
    %setup:
    
    \parindent 0 pt\nopagenumbers\parskip 10 pt
    \hsize 9.5 in\vsize 3.25 in
    \voffset 1.25 in
    \cmssc
    
    %document:
    
    FROM-NAME
    
    FROM-STREET ADDRESS
    
    FROM-CITY, STATE, \ ZIP
    
    \vskip .4 in\parindent 3.5 in
    
    TO-NAME
    
    TO-STREET ADDRESS
    
    TO-CITY, STATE, \ ZIP
    \end

Compile with:

    tex envelope.tex; dvips -t landscape -m envelope.dvi

Then you can print with `cupsdoprint` or your favorite PostScript printing application. The envelopes should be inserted landscape-style, face up, open edge on the right side, in the center of the feed tray with all other paper removed and the guide tabs adjusted to fit the height of the envelope. The source TeX file is also available [here](http://cryptosystem.org/projects/latex/envelope.tex).
