% This file is used as a resource to illustrate the use of the presented tools.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{basic}[1995/10/30 Standard LaTeX minimal class]

% [geometry] This package provides a flexible and easy interface to page dimensions.
\usepackage[a4paper,
            % We set the dimension of the text area.
            width=10cm,
            height=15cm,
            % We set the dimensions of the left and right margins.
            left=1cm,
            right=1cm,
            % We set the dimensions of the top and bottom margins.
            top=2cm,
            bottom=2cm,                          
            % headheight=2cm,
            % footskip=1cm
            ]{geometry} 

% [fontenc] The package allows the user to select font en­codings, and for each encoding provides an inte­face to font-encoding-specific com­ands for each font.
% The T1 font encoding is an 8-bit encoding and uses fonts that have 256 glyphs. 
\usepackage[T1]{fontenc} 

% The package adds an optional argument to the enumerate environment which determines the style in which the counter is printed.
\usepackage{enumerate}

% We redefine the font size named ''normalize''. Please note that LaTeX defines other names for font sizes (for example: tiny, small...).
% See https://www.sharelatex.com/learn/Font_sizes,_families,_and_styles#Reference_guide
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}


