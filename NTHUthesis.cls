\NeedsTeXFormat{LaTeX2e}
% Fork from June 2021 v1.0 Typesetting theses for members of National Tsing Hua University, Hsinchu, Taiwan
\ProvidesClass{NTHUthesis}[January, 2024 v1.1 NTHU thesis typesetting edited by Yuan\-Yen Peng]

\LoadClass[a4paper, 12pt]{report}

% Essential typesetting packages
\RequirePackage[top=2.54cm, bottom=2.54cm, right=3.17cm, left=3.17cm]{geometry}
\RequirePackage{indentfirst}
\RequirePackage{microtype}
\RequirePackage{setspace}

% Other typesetting packages
\RequirePackage{tocbibind}
\RequirePackage[encoding=UTF8]{zhnumber}
\RequirePackage[ruled]{algorithm2e}
\RequirePackage{booktabs}
\RequirePackage{cite}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=blue,
    filecolor=blue,
    linkcolor=blue,
    urlcolor=blue
}

% Graphical packages
\RequirePackage{tikz}
\RequirePackage{graphicx}

% Physics essential packages
\RequirePackage{amsmath}
\RequirePackage{physics}
\RequirePackage[compat=1.1.0]{tikz-feynman} % draw Feynmann diagrams
\tikzfeynmanset{/tikzfeynman/warn luatex=false}

% Font settings
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{unicode-math} 
%\setmainfont{Times New Roman}
%\setmonofont{Courier New}
%\setmathfont{XITS Math}
%\setCJKmainfont{TW-Kai}
\setCJKmainfont[AutoFakeBold=1.8, AutoFakeSlant=0.2]{KaiTi}
%\setCJKmonofont{TW-Sung}

% Default spacing
\setstretch{1.8}

% Options
\DeclareOption{master}{\gdef\@degreeZH{碩}}
\DeclareOption{doctor}{\gdef\@degreeZH{博}}
\DeclareOption{nowatermark}{\gdef\nowatermark{1}}
\ProcessOptions\relax

% Watermark of NTHU
\ifdefined \nowatermark \else
    \AtBeginShipout{%
        \AtBeginShipoutAddToBox{%
            \begin{tikzpicture}[overlay,remember picture]
                \node[opacity=0.1] at (current page.center){%
                    \includegraphics[width=18cm]{nthu-logo.pdf}%
                };%
            \end{tikzpicture}%
        }%
    }  
\fi

% Declared variables
\newcommand{\titleZH}[1]{\gdef\@titleZH{#1}}
\newcommand{\titleEN}[1]{\gdef\@titleEN{#1}}
\newcommand{\instituteZH}[1]{\gdef\@instituteZH{#1}}
\newcommand{\studentID}[1]{\gdef\@studentID{#1}}
\newcommand{\studentZH}[1]{\gdef\@studentZH{#1}}
\newcommand{\studentEN}[1]{\gdef\@studentEN{#1}}
\newcommand{\advisorZH}[1]{\gdef\@advisorZH{#1}}
\newcommand{\advisorEN}[1]{\gdef\@advisorEN{#1}}
\newcommand{\yearZH}[1]{\gdef\@yearZH{#1}}
\newcommand{\monthZH}[1]{\gdef\@monthZH{#1}}
\newcommand{\yearEN}[1]{\gdef\@yearEN{#1}}
\newcommand{\monthEN}[1]{\gdef\@monthEN{#1}}

% Customized commands
\newcommand{\makecover}{%
    \begin{titlepage} 
        \begin{center}
            \begin{spacing}{1.5}
                \huge 國~立~清~華~大~學~物~理~學~系\\
                \@degreeZH~士~學~位~論~文
            \end{spacing}
            \begin{spacing}{1.5}
                \LARGE \textbf{\@titleZH\\
                \@titleEN}
                \vfill
                \Large \begin{tabular}{l}
                    系\hspace{34.4pt}別：\@instituteZH\\
                    學\hspace{34.4pt}號：\@studentID\\
                    研\hspace{8.6pt}究\hspace{8.6pt}生：\@studentZH~(\@studentEN)\\
                    指導教授：\@advisorZH~(\@advisorEN)
                \end{tabular}\\
                \vspace{1.5\baselineskip}
                中~~華~~民~~國~~\zhdigits{\@yearZH}~~年~~\zhdigits{\@monthZH}~~月
            \end{spacing}
            \begin{tikzpicture}[overlay,remember picture]
                \node[opacity=0.5] at (current page.center){%
                    \includegraphics[width=18cm]{nthu-logo.pdf}%
                };%
            \end{tikzpicture}%
        \end{center}
    \end{titlepage}%
    \begin{titlepage}
        \begin{center}
            \begin{spacing}{1.5}
                \LARGE\textbf{\@titleEN}\\
                \vspace{1\baselineskip}
                \Large A Thesis Presented to\\
                Department of Physics at\\
                National Tsing Hua University\\
                In Partial Fulfillment of the Requirement for\\
                the Master of Science Degree Program\\
                \vfill
                \begin{tabular}{c}
                    By\\
                    \@studentEN~~\textit{\@studentID}\\
                    Advisor:\\
                    \@advisorEN
                \end{tabular}\\
                \vspace{2\baselineskip}
                \@monthEN~~\@yearEN
            \end{spacing}
            \begin{tikzpicture}[overlay,remember picture]
                \node[opacity=0.5] at (current page.center){%
                    \includegraphics[width=18cm]{nthu-logo.pdf}%
                };%
            \end{tikzpicture}%
        \end{center}
    \end{titlepage}%
    \begin{titlepage}
        \centering
        \begin{tikzpicture}[overlay,remember picture]
            \node[opacity=0.5] at (current page.center){%
                \includegraphics[width=18cm]{nthu-logo.pdf}%
            };%
        \end{tikzpicture}%
        \mbox{}
        \vfill
        \copyright~By~\@studentEN~(\@studentZH)~\@yearEN\\
        All~Right~Reserved
    \end{titlepage}%
}

\newcommand{\maketoc}{%
    \tableofcontents
    \clearpage
    \listoffigures
    \listoftables
    \clearpage%
}

\newcommand{\makeenv}[3]{%
    \newenvironment{#1}{%
        \phantomsection
        \section*{\centerline{#2}}
        \addcontentsline{toc}{chapter}{#3}
        }{
        \clearpage%
    }%
}

\newcommand{\makeenvZH}[3]{%
    \newenvironment{#1}{%
        \phantomsection
        \section*{\centerline{#2}}
        \addcontentsline{toc}{chapter}{#3}
        }{
        \clearpage%
    }%
}

% Customized environments
\makeenvZH{abstractZH}{摘要}{Abstract (Chinese)}
\makeenvZH{acknowledgementsZH}{致謝}{Acknowledgements (Chinese)}
\makeenv{abstractEN}{Abstract}{Abstract}
\makeenv{acknowledgementsEN}{Acknowledgements}{Acknowledgements}
