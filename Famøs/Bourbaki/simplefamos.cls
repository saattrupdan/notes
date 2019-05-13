\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplefamos}
[2006/11/01 LaTeX document class for Famos articles]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[danish,a5paper,twoside,openany,11pt]{memoir}
\RequirePackage{fixltx2e}
\RequirePackage[T1]{fontenc}
\RequirePackage[danish]{babel}
\RequirePackage{enumitem}
\RequirePackage{url}
\RequirePackage{ifthen}
\RequirePackage{textcomp}
\RequirePackage{multicol}
\RequirePackage{amsmath,amssymb,amsfonts,amsthm,latexsym}
\RequirePackage{graphicx,color}

% Spread layout
\settrims{0pt}{0pt}
\settypeblocksize{420pt}{310pt}{*}
\setlrmargins{*}{*}{1.9}
\setulmargins{*}{*}{*}
\setheaderspaces{*}{50pt}{*}
\setlength{\footskip}{50pt}
\checkandfixthelayout

% Generalities
\newcommand{\headingfont}{\normalfont\sffamily\bfseries}
\newcommand{\famos}{\textsc{Fam\o s}}
\frenchspacing
\raggedbottomsectiontrue
\setlength{\parindent}{1em}

% Theorem styles
\newtheoremstyle{famosthm}{}{}{\itshape}{}{\headingfont{}}{}{.5em}{}
\newtheoremstyle{famosdef}{}{}{}{}{\headingfont{}}{}{.5em}{}

% Common theorem environments
\theoremstyle{famosthm}
\newtheorem{saetning}{S\ae tning}
\newtheorem{theorem}[saetning]{Theorem}
\newtheorem{lemma}[saetning]{Lemma}
\newtheorem{proposition}[saetning]{Proposition}
\newtheorem{korollar}[saetning]{Korollar}
\newtheorem{corollary}[saetning]{Corollary}
\theoremstyle{famosdef}
\newtheorem{definition}[saetning]{Definition}
\newtheorem{formodning}[saetning]{Formodning}
\newtheorem{conjecture}[saetning]{Conjecture}
\newtheorem{eksempel}[saetning]{Eksempel}
\newtheorem{example}[saetning]{Example}
\newtheorem{bemaerkning}[saetning]{Bem\ae rkning}
\newtheorem{remark}[saetning]{Remark}
\newtheorem{note}[saetning]{Note}

% Precis in Table of Contents
\newcommand{\famosprecistoc}[1]{}

% Counters
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% Page style
\newcommand*{\authormark}[1]{}
\setlength{\headwidth}{\textwidth}
  \addtolength{\headwidth}{50pt}
\makepagestyle{famos}
\makerunningwidth{famos}{\headwidth}
\makeheadrule{famos}{\headwidth}{\normalrulethickness}
\makeheadposition{famos}{flushright}{flushleft}{flushright}{flushleft}
\makepsmarks{famos}{%
  \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{##1}{##1}}    % left mark & right marks
  \def\sectionmark##1{}
  \def\authormark##1{\markright{##1}}
  \def\tocmark{\markboth{\contentsname}{\contentsname}}
  \def\lofmark{\markboth{\listfigurename}{\listfigurename}}
  \def\lotmark{\markboth{\listtablename}{\listtablename}}
  \def\bibmark{\markboth{\bibname}{\bibname}}
  \def\indexmark{\markboth{\indexname}{\indexname}}
}
\makeevenhead{famos}{\headingfont\thepage}{}{\headingfont\leftmark}
\makeoddhead{famos}{\headingfont\rightmark}{}{\headingfont\thepage}
\makeevenfoot{famos}{}{}{\famos\space\d@date}
\makeoddfoot{famos}{\d@volume.\ \aa rgang, nr.\ \d@number}{}{}
\pagestyle{famos}

% Chapter page style
\copypagestyle{famoschapter}{famos}
\makeheadrule{famoschapter}{\headwidth}{0pt}
\makeevenhead{famoschapter}{\headingfont\thepage}{}{\headingfont\d@chaptertype}
\makeoddhead{famoschapter}{\headingfont\d@chaptertype}{}{\headingfont\thepage}
\aliaspagestyle{chapter}{famoschapter}

% Move headers into spine margin
\newlength{\marginoverlap}
\setlength{\marginoverlap}{\parindent}
\def\famosevenhpr{\kern-\marginoverlap}
\def\famosoddhpl{\kern-\marginoverlap}
\def\famosevenfpr{\kern-\marginoverlap}
\def\famosoddfpl{\kern-\marginoverlap}
\def\famoschapterevenhpr{\kern-\marginoverlap}
\def\famoschapteroddhpl{\kern-\marginoverlap}
\def\famoschapterevenfpr{\kern-\marginoverlap}
\def\famoschapteroddfpl{\kern-\marginoverlap}

% Chapter style
\newlength{\chapterrulelength}
\setlength{\chapterrulelength}{\textwidth}
\addtolength{\chapterrulelength}{\marginoverlap}
\makechapterstyle{famos}{
  \setlength{\beforechapskip}{-50pt}
  \setlength{\afterchapskip}{20pt}
  \renewcommand{\chaptitlefont}{\headingfont\huge}
  \renewcommand{\printchaptertitle}[1]{%
    \setlength{\parskip}{0pt}%
    \moveleft\marginoverlap\hbox{\vbox{%
      \ifthenelse{\equal{\d@chaptersubtitle}{}}{%
        \chaptitlefont ##1%
      }{%
        \chaptitlefont ##1\par%
        \vrule height\z@ depth\z@ width\marginoverlap%
        \large --\space\d@chaptersubtitle%
      }}%
    \hbox{\vrule height35pt depth10pt width\z@}}}
  \renewcommand{\afterchaptertitle}{%
    \vskip-8pt\moveleft\marginoverlap\vbox{\hrule width \chapterrulelength}%
    \vskip-3pt%
    \ifthenelse{\equal{\d@chapterauthor}{}}{\vskip\baselineskip}{%
      \leavevmode\hfill\normalfont\itshape \d@chapterauthor\/\par}%
    \ifthenelse{\equal{\d@chapterabstract}{}}{}{%
      % Check whether we also have a subtitle
      \ifthenelse{\equal{\d@chaptersubtitle}{}}{%
        \vskip\baselineskip%
        \hbox to \textwidth{\hfil\parbox{190pt}{\normalfont \d@chapterabstract}\hfil\hfil}%
      }{%
        \ClassError{famos}{You cannot have both a subtitle and an abstract for an article}%
      }}%
    \vskip\afterchapskip%
    % Reset chapter data and counters
    \setcounter{saetning}{0}%
    \setcounter{equation}{0}%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \setlength{\parskip}{0pt plus 1pt}}
}
\chapterstyle{famos}

\newcommand{\famosarticle}[5]{%
  % Arguments: 1. type, 2. title, 3. subtitle, 4. author, 5. abstract
  % It is not allowed to supply both a subtitle and an abstract
  %
  % Make chapter title and subtitle
  \clearforchapter%
  \def\d@chaptertype{#1}%
  \def\d@chaptersubtitle{#3}%
  \def\d@chapterauthor{#4}%
  \def\d@chapterabstract{#5}%
  \chapter{#2}%
  % Back to defaults
  \def\d@chaptersubtitle{}%
  \def\d@chapterauthor{}%
  \def\d@chapterabstract{}%
  % Set author mark
  \authormark{#4}%
}

% Table of contents
\setsecnumdepth{part}

% Sections
\setsubsecheadstyle{\headingfont\large\raggedright}
\setsubsecindent{-\marginoverlap}
\let\section\subsection
\let\subsubsection\subsection
\let\paragraph\subsection
\let\subparagraph\subsection

% Captions
\captiondelim{\space}
\captionnamefont{\headingfont}

% Lists
\setlist{leftmargin=*}
\setlist[1]{labelindent=\parindent}
\setdescription{font=\headingfont}
\renewcommand*\descriptionlabel[1]{\hspace\labelsep\headingfont #1}
\tightlists

% Bibliographies
\renewcommand{\bibsection}{%
  \section{\bibname}\prebibhook}

% User data
\def\issue#1#2#3{\def\d@volume{#1} \def\d@number{#2} \def\d@date{#3}}
\def\deadline#1{\def\d@deadline{#1}}

% Defaults
\issue XX{skabelon}
\deadline{skabelon}

