\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{test20250425}

% Load the base article class
\LoadClass{article}

% Set default font and page layout
\RequirePackage{geometry}
\geometry{a4paper, margin=1in}

% \RequirePackage{fontspec}
% \setmainfont{Times New Roman}

% Custom commands
\newcommand{\testcommand}[1]{\textbf{#1}}

% Custom section formatting
\RequirePackage{titlesec}
\titleformat{\section}{\Large\bfseries}{\thesection}{1em}{}

% Custom footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}

\endinput
