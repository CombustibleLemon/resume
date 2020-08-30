%!TEX

\LoadClass[letterpaper]{article}

%\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{cv}%[2020/08/30 v2]

\usepackage{iftex}

\ifXeTeX
	\RequirePackage{fontspec}
	\RequirePackage{polyglossia}
	\setdefaultlanguage[variant=american]{english}
	\usepackage{unicode-math}
	\setmainfont{CMU Serif}
	\setsansfont{CMU Sans Serif}
	\setmonofont{CMU Typewriter Text}
	\setmathfont{Latin Modern Math}
\else
	\RequirePackage[T1]{fontenc}
	\RequirePackage{textcomp}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{lmodern}
	\RequirePackage{microtype}
	\RequirePackage{babel}
\fi

%\RequirePackage{accessibility}
\RequirePackage{hyperref}
\RequirePackage[raise]{datetime}
\RequirePackage{csquotes}
\RequirePackage{titlesec}
\RequirePackage[country=US,foreign=international]{phonenumbers}
%\RequirePackage{paralist}
\RequirePackage[inline]{enumitem}
\setlist{nolistsep}
\RequirePackage{metalogo}
\RequirePackage{censor}
\RequirePackage{longtable}
\RequirePackage{siunitx}
\RequirePackage{multicol}
\RequirePackage{tabu}
\RequirePackage{pgfkeys}
\pgfkeys
{
	/education/.is family, /education,
		dateEntered/.initial=\empty,
		dateLeft/.initial=\empty,
		name/.initial=\empty,
		location/.initial=\empty,
		gpa/.initial=\empty,
		gpaMajor/.initial=\empty,
		gpaMax/.initial=\empty,
		degree/.initial=\empty,
		major/.initial=\empty,
		minors/.initial=\empty,
		annotation/.initial=\empty,
		default/.style =
			{dateEntered=\empty,
			dateLeft=\empty,
			name=\empty,
			location=\empty,
			gpa=\empty,
			gpaMajor=\empty,
			gpaMax={4.0},
			degree=\empty,
			major=\empty,
			minors=\empty,
			annotation=\empty
			},
		dateEntered/.estore in = \eduDateEntered,
		dateLeft/.estore in = \eduDateLeft,
		name/.estore in = \eduName,
		location/.estore in = \eduLocation,
		gpa/.estore in = \eduGpa,
		gpaMajor/.estore in =\eduGpaMajor,
		gpaMax/.estore in = \eduGpaMax,
		degree/.estore in = \eduDegree,
		major/.estore in = \eduMajor,
		minors/.estore in = \eduMinors,
		annotation/.estore in = \eduAnnotation,
}
% \RequirePackage{mathtools}
\RequirePackage{censor}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage[
    style=authoryear,
    giveninits=true,
    backend=biber,
    sortcites=true,
%    isbn=false,
%    url=false,
%    doi=false,
%    eprint=false,
    hyperref=true,
    backref=true,
%    firstinits=false,
    bibencoding=utf8
]{biblatex}

\RequirePackage[
	letterpaper,
	left=0.8in,
	right=0.8in,
	top=0.6in,
	bottom=0.8in,
	nohead
]{geometry}

%\RequirePackage[tagged]{accessibility}

\pagestyle{fancy}                   % implement headers and footers
\fancyhf{}                          % remove default content
\renewcommand{\headrulewidth}{0pt}  % remove horizontal line

%\title{Cirriculum Vitae}

\let\@authoremail\@empty
\let\@authordegree\@empty
\let\@authorwebsite\@empty
\let\@authoraddress\@empty
\let\@authorcountry\@empty

\newcommand{\authoremail}[1]{\gdef\@authoremail{#1}%
}
\newcommand{\authorphone}[1]{\gdef\@authorphone{#1}%
}
\newcommand{\authorwebsite}[1]{\gdef\@authorwebsite{#1}%
}
\newcommand{\authoraddress}[1]{\gdef\@authoraddress{#1}%
}
\newcommand{\authorcountry}[1]{\gdef\@authorcountry{#1}%
}

\newcommand{\hrefemail}[1]
    {%\texttt
        {\href{mailto:#1}{#1}}
    }

\newtoggle{censorContact}
\newcommand{\censorContact}[1]
    {
        \iftoggle{censorContact}
        {\censor{#1}}
        {#1}
    }
    
\titleformat{\section}
    {\Large\itshape}
    {}{0em}
    {}
    []
\titlespacing*{\section}{0cm}{0mm}{*0}

\titleformat{\subsection}         % Customise the \section command
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\subsection}{0cm}{*-0.75}{*1.8}

\titleformat{\subsubsection}       % Customise the \subsection command
  {\large\bfseries\raggedright} % Make the \subsection headers moderately large (\large),
                                % bold (\bfseries) and left aligned (\raggedright)
  {}{0em}                       % Can be used to give a prefix to all sections, like 'Section ...'
  {}                            % Can be used to insert code before the heading
  []
\titlespacing*{\subsubsection}{0cm}{*-1.5}{*0.25}

\titleformat{\paragraph}    % Customise the \subsubsection command
  {\large\itshape\raggedright}  % Make the \subsubsection headers moderately large (\Large),
                                % italic (\itshape) and left aligned (\raggedright)
  {}{0em}                       % Can be used to give a prefix to all sections, like 'Section ...'
  {}                            % Can be used to insert code before the heading
  []
\titlespacing*{\paragraph}{0cm}{*-1.5}{*0.25}

\makeatletter
  
\hypersetup
	{
		baseurl={https://github.com/CombustibleLemon/resume},
		pdflang={en-US},
		pdfdisplaydoctitle=true,
		unicode=true
	}

\AtBeginDocument{
    % Add hyperref info that depends on author input
    \hypersetup
    	{
    		pdftitle=\@author’s \@title,
    		pdfauthor=\@author
    	}
    
    
}

\renewcommand{\maketitle}
{
    %\vspace*{-4\baselineskip}
    \begin{center}
        \begin{tabu} to \linewidth{X[7l]X[4l]X[4r]}
            {
                \vspace{.1mm}
        		{\Huge{\scshape{\@author}}}
        		%\newline
        		%{\large\itshape{\@title}}
        		{\section{\@title}}
    		}
    		&
    		{
                \vspace{.1mm}
                %{\scshape{Mailing:}}\newline
    		    \@authoraddress
    		}
    		&
    		{
    		    {\large{
                \vspace{.1mm}
        		% Print email address if present
        		\ifstrempty{@authoremail}{}
        			{
        				\hrefemail{\@authoremail}
        			}
        		% Print phone number if present
        		\ifstrempty{@authorphone}{}
        			{
        			\phonenumber{8477077458}}
        			%\href{tel:\@authorphone}{\@authorphone}}
        		% Print website if present
        		\ifstrempty{@authorphone}{}
        			{
        			\href{\@authorwebsite}{\@authorwebsite}}}}
    		}
    	\end{tabu}
	\end{center}
}

%\rfoot{\footnotesize{Updated \today.}}

\def\instring#1#2{TT\fi\begingroup
  \edef\x{\endgroup\noexpand\in@{#1}{#2}}\x\ifin@}
%\makeatother

\newenvironment{sectabular}
	{\begin{tabu} to \linewidth{X[r]|X[l,4.4]}}
	{\end{tabu}}
%{line width is \the\textwidth}{}

\newcommand{\datecalc}[2]
	{
		\ifthenelse{\equal{#2}{\empty}}{#1 -- \textit{Present}}
			{
				\ifthenelse{\equal{#1}{#2}}
					{#1}
					{#1 -- #2}
			}
	}

\newcommand{\homosexualmanagementsystem}[9]
	{
		\twotab{#1}
			{
				{\textbf {#2}}
				\ifstrempty{#3}{}{\hfill#3}
				\ifstrempty{#4}{\\}{\\#4}
				\ifstrempty{#5}{}{&{\scshape#5}
				\ifstrempty{#6}{}{\hfill#6}}
				\ifstrempty{#7}{}{\\&#7}
				\ifstrempty{#8}{}{\\&#8}
				\ifstrempty{#9}{}{\\&#9}
			}
	}

\newcommand{\twotab}[2]
	{
		\begin{sectabular}
			#1&#2
		\end{sectabular}
		\vspace{1.5mm}
		\\
	}

\newcommand{\secitemeducation}[2]
	{
		\pgfkeys{/education,default,#1}%
%       \phantomsection
%       \addcontentsline{toc}{subsubsection}{\eduName}
		\homosexualmanagementsystem
			{\datecalc{\eduDateEntered}{\eduDateLeft}}
			{\eduName}
			{\eduLocation}
			{}
			{\scshape\eduDegree{ }in \eduMajor}
			{{\scshape gpa}: \({{}\eduGpa}/_{\small\eduGpaMax}\)}
			{\ifstrempty{\eduMinors}{}{Minor\if\instring{,}{\eduMinors}{s}\else{}\fi{ in }\eduMinors}}
			{#2}
			{}
	}
%		\begin{sectabular}
%			\pgfkeys{/education,default,#1}%
%			\datecalc{\eduDateEntered}{\eduDateLeft}&
%
%			\pgfkeys{/education,default,#1}%
%			{\textbf\eduName}\hfill\eduLocation\\&
%
%			\pgfkeys{/education,default,#1}%
%			{\scshape\eduDegree{ }in \eduMajor}\hfill {\scshape gpa}: \({{}\eduGpa}/_{\small\eduGpaMax}\)\\
%		\end{sectabular}\\*


\newcommand{\secitemexperience}[6]
	{
%       \phantomsection
%       \addcontentsline{toc}{subsubsection}{#4}
		\homosexualmanagementsystem
			{\datecalc{#1}{#2}}
			{#3}
			{#5}
			{}
			{#4}
			{}
			{#6}
			{}
			{}
	}
	
\newcommand{\contact}[5]
    {
        {\censorContact{\textbf{#1}}} \newline
        \censorContact{#2} \newline
        {\censorContact{\scshape #3}} \newline
        {\censorContact{\hrefemail{#4}}} \newline
        {\censorContact{\phonenumber{#5}}}
    }

\newcommand{\secitemgrant}[7]
	{
		\homosexualmanagementsystem
			{#1}
			{#3}
			{#5}
			{\$#2}
			{#4}
			{}
			{\ifstrempty{#6}{}{To: #6\ifstrempty{#7}{}{, \textit{#7}.}{}}}
			{}{}
	}

\newcommand{\address}[7]
    {
        \noindent
        \ifstrempty{#1}{}{#1\\}
        \ifstrempty{#2}{}{#2\\}
        \ifstrempty{#3}{}{#3\\}
        \ifstrempty{#4}{}{#4,}
        \ifstrempty{#5}{}{#5}
        \ifstrempty{#6}{}{#6}\\
        %\ifstrempty{#7}{}{\ifstrequal{#7}{\@authorcountry}{}{#7\\}}
        %\vspace{1em}
    }

\newcommand{\signature}
    {
        \vspace{2em}
        \phantomsection
        \addcontentsline{toc}{subsection}{Salutation}
        \noindent
        Thank you for your consideration,\\
        {\@author}\\
        {\today}
    }

\newcommand{\toaddress}[7]
    {
        \phantomsection
        \addcontentsline{toc}{subsection}{Recipient}
%        \begin{flushright}
            \address{#1}{#2}{#3}{#4}{#5}{#6}{#7}
%        \end{flushright}
        \phantomsection
        \addcontentsline{toc}{subsection}{Letter}
    }

\endinput