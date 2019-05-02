%!TEX

\LoadClass[letterpaper]{article}

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{cv}[2019/05/01 v1]

% \RequirePackage[backend=biber]{biblatex}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{nolistsep}
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
		gpaMax/.estore in = \eduGpaMax,
		degree/.estore in = \eduDegree,
		major/.estore in = \eduMajor,
		minors/.estore in = \eduMinors,
		annotation/.estore in = \eduAnnotation,
}
\RequirePackage{mathtools}
\RequirePackage[
	letterpaper,
	left=0.8in,
	right=0.8in,
	top=0.70in,
	bottom=0.55in,
	nohead
]{geometry}

\title{Cirriculum Vitae}

\let\@authoremail\@empty
\let\@authordegree\@empty
\let\@authorwebsite\@empty

\newcommand{\authoremail}[1]{\gdef\@authoremail{#1}%
}
\newcommand{\authorphone}[1]{\gdef\@authorphone{#1}%
}
\newcommand{\authorwebsite}[1]{\gdef\@authorwebsite{#1}%
}

\pagenumbering{gobble}
\titleformat{\section}         % Customise the \section command
  {\Large\scshape\raggedright} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\renewcommand{\maketitle}
{
	\begin{center}
		{\large\itshape{\@title}} \\
		\vspace{1.5mm}
		{\Huge\scshape{\@author}} \\
		\vspace{1mm}
		% Print email address if present
		\ifstrempty{@authoremail}{}
			{\
				\href{mailto:\@authoremail}{\@authoremail}\
			}
		% Print phone number if present
		\ifstrempty{@authorphone}{}
			{\textperiodcentered\
			\href{tel:\@authorphone}{\@authorphone}}
		% Print website if present
		\ifstrempty{@authorphone}{}
			{\textperiodcentered\
			\href{\@authorwebsite}{\@authorwebsite}}
	\end{center}
}

\hypersetup
	{
		baseurl=https://github.com/CombustibleLemon/resume,
		pdftitle=\@title,
		pdfauthor=\@author
	}

\def\instring#1#2{TT\fi\begingroup
  \edef\x{\endgroup\noexpand\in@{#1}{#2}}\x\ifin@}
\makeatother

\newenvironment{sectabular}
	{\begin{tabu} to \linewidth{X[r]|X[l,5]}}
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
				\ifstrempty{#6}{}{\hfill#6}
				}
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
		\vspace{3mm}
		\\
	}

\newcommand{\secitemeducation}[1]
	{
		\pgfkeys{/education,default,#1}%
		\homosexualmanagementsystem
			{\datecalc{\eduDateEntered}{\eduDateLeft}}
			{\eduName}
			{\eduLocation}
			{}
			{\scshape\eduDegree{ }in \eduMajor}
			{{\scshape gpa}: \({{}\eduGpa}/_{\small\eduGpaMax}\)}
			{
				\ifstrempty{\eduMinors}{}
					{
						Minor\if\instring{,}{\eduMinors}{s}\else{}\fi{ in }\eduMinors
					}
			}
			{}{}
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
	}


\newcommand{\secitemexperience}[6]
	{
		\homosexualmanagementsystem
			{\datecalc{#1}{#2}}
			{#3}
			{#5}
			{}
			{#4}
			{#6}
			{}{}{}
%		\begin{sectabular}
%			\datecalc{#1}{#2}&
%			{\textbf#3}\hfill#5\\&
%			{\scshape#4}\\&
%			#6\\
%		\end{sectabular}\\*
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
			{To: #6, {\textit{#7}}.}
			{}{}
	}

\endinput
