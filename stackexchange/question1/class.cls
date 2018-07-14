% This file contains LaTeX configuration for all CV.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{class}[1995/10/30 Standard LaTeX minimal class]

% This class "article" defines many important things.
% See https://tex.stackexchange.com/questions/440462/hline-does-not-produce-anything/440468#440468
\LoadClass{article}

% [geometry] This package provides a flexible and easy interface to page dimensions.
\usepackage[a4paper,
            % We set the dimensions of the left and right margins.
            left=1cm,
            right=1cm,
            % We set the dimensions of the top and bottom margins.
            top=12cm,
            bottom=12cm]{geometry}

% We (must) redefine the font size named "normalsize" (this is mandatory).
% Please note that LaTeX defines other names for font sizes (for example: tiny, small...).
% See https://www.sharelatex.com/learn/Font_sizes,_families,_and_styles#Reference_guide
% WARNING: Make sure to redefine the command "\normalsize" before loading the package "fontspec".
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}

% This package allows the use of formatting features that are required to draw tables.
\usepackage{array}

% This package provides flexibility for fine-tuning the enumerated lists.
% See https://texfaq.org/FAQ-complist
\usepackage{enumitem}

% This package is really awasome.
\usepackage{tcolorbox}

% This will print a frame around the text area.
\usepackage{showframe}

