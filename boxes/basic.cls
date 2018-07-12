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
            bottom=2cm,                          
            % headheight=2cm,
            % footskip=1cm
            ]{geometry} 

% The package adds an optional argument to the enumerate environment which determines the style in which the counter is printed.
\usepackage{enumerate}

% We (must) redefine the font size named "normalsize".
% Please note that LaTeX defines other names for font sizes (for example: tiny, small...).
% See https://www.sharelatex.com/learn/Font_sizes,_families,_and_styles#Reference_guide
% WARNING: If you load the package "fontspec" (that you will probably do if you use LuaLaTeX), then you must define the command
%          "\normalsize" __BEFORE__ (loading "fontspec"). 
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}


% ----------------------------------------------------------------------
% Useful commands
% ----------------------------------------------------------------------


% This package allows simple TF THEN ELSE constructions.
\usepackage{ifthen}

% Set the value to "yes" if you want to see the borders of the boxes you use.
\newcommand{\enframe}{yes}

% Create a box that contains only one line.
% Depending on the value of \enframe, the box is framed or not.
% Param 1: width of the box.
% Param 2: justification (l|c|r}
% Param 3: the content of the box.
\newcommand{\linebox}[3]{%
    \ifthenelse{\equal{\enframe}{yes}}{%
        \framebox[#1][#2]{#3}%
    }{%
        \makebox[#1][#2]{#3}%
    }%
}%

% Create a box that contains one or more lines.
% Depending on the value of \enframe, the box is framed or not.
% Param 1: width of the box.
% Param 2: the content of the box.
\newcommand{\parabox}[2]{%
    \ifthenelse{\equal{\enframe}{yes}}{%
        \framebox[#1][c]{%
            \parbox{#1}{#2}%
        }%
    }{%
        \parbox{#1}{#2}%
    }%
}%




