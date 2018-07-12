% This file is used as a resource to illustrate the use of the presented tools.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{basic}[1995/10/30 Standard LaTeX minimal class]

% [geometry] This package provides a flexible and easy interface to page dimensions.
\usepackage[a4paper,
            % We set the dimensions of the left and right margins.
            left=1cm,
            right=1cm,
            % We set the dimensions of the top and bottom margins.
            top=2cm,
            bottom=2cm]{geometry}

% We (must) redefine the font size named "normalsize".
% Please note that LaTeX defines other names for font sizes (for example: tiny, small...).
% See https://www.sharelatex.com/learn/Font_sizes,_families,_and_styles#Reference_guide
% WARNING: If you load the package "fontspec" (that you will probably do if you use LuaLaTeX), then you must define the command
%          "\normalsize" __BEFORE__ (loading "fontspec"). 
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}


