
%% start of file 'SWJTU_Thesis.cls'.
%% Copyright 2015 
%% Original Author Limin HUANG.
%% 2015/01/30		v0.0, Begin of the projet, 		@Chengdu China
%% 2015/12/08		v1.0, Release of the projet, 	@Grenoble, France
%% 2020/06/01		v2.0, Revision by Hao WANG, 	@Chengdu, China
%% 2023/11/30		v3.0, Revision by Haozhe Hu,	@Chengdu, China

% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

% 请注意：本文件已经定义好需要使用的参数，不建议用户更改。

%-------------------------------------------------------------------------------
%                标识
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuThesis}[2015/12/07 v1.0 Southwest Jiaotong University Thesis document class]
\typeout{Document Class `swjtuThesis' updated by cshaowang (cshaowang@gmail.com) (2020/06/01)}
\typeout{Document Class `swjtuThesis' updated by Haozhe Hu (Hhz029@hotmail.com) (2023/11/30)}

%-------------------------------------------------------------------------------
%                宏包
%-------------------------------------------------------------------------------
% SWJTU_Thesis类基于ctexbook文档类制作
% 将文档类其他参数全部传递给 ctexbook 文档类。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
% CJKfntef 宏包提供了 \makecover 中用到的 \CJKunderline 命令。
% fancyhdr 宏包提供了方便使用的命令用于设置页眉、页脚。
% cs4size 表示小四字号, 也指12pt.
% V3.0更改——ctexbook中的winfonts设置无法兼容其余操作系统（如Mac），更换为nofonts并手动设置字体
\LoadClass[UTF8,nofonts,fntef,fancyhdr,a4paper,cs4size]{ctexbook}
% \LoadClass[UTF8,winfonts,fntef,fancyhdr,a4paper,cs4size]{ctexbook} %论文使用A4大小纸张，默认小四号字体

% 装载样式文件中使用的宏包
\RequirePackage[bookmarksnumbered,pdfstartview=XYZ]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{ifthen}

% V3.0更改——手动设置字体
% \setCJKmainfont[BoldFont=SimHei]{SimSun}
% \setCJKfamilyfont{zhsong}{SimSun}
% \setCJKfamilyfont{zhhei}{SimHei}
% \NewDocumentCommand \songti {}{\CJKfamily{zhsong}}
% \NewDocumentCommand \heiti {}{\CJKfamily{zhhei}}

\setCJKmainfont[Path=./font/, BoldFont=simhei.ttf]{simsun.ttf}
\setCJKfamilyfont{zhsong}[Path=./font/]{simsun.ttf}
\setCJKfamilyfont{zhhei}[Path=./font/]{simhei.ttf}
\NewDocumentCommand \songti {}{\CJKfamily{zhsong}}
\NewDocumentCommand \heiti {}{\CJKfamily{zhhei}}

% 保持url与正文字体一致
\urlstyle{same}

%-------------------------------------------------------------------------------
%                标题及版面格式（依照《西南交通大学研究生学位论文撰写规范》 附录）
%-------------------------------------------------------------------------------
% 版面上空25.4 mm，下空25.4 mm，左空 26.0 mm，右空 26.0 mm
% V3.0更改——依据《撰写规范》，版面上空25.4 mm，下空25.4 mm，左空 26.0 mm，右空 26.0 mm；版心尺寸：宽 160mm，高 250mm。然而此设置下会超过A4纸版面，因此仅需设置页边距，忽略版心设置
% 依据2024新规范，四个方向的页边距均统一为30.0 mm，并进行微调以匹配模板
\RequirePackage{geometry}
\geometry{a4paper, top=35mm, bottom=35mm, left=30mm, right=30mm}

%%段落间距
%\setlength{\parskip}{3pt plus1pt minus2pt}  % 段落之间的竖直距离

%行间距
% 依据2024新规范，行间距均统一为20pt
% \setlength{\baselineskip}{24pt} %段落内的行距
% V3.0更改——直接控制基础的行距倍数为1.4倍，配合前面的页面设置可以使得单页的行数正好为《撰写规范》内建议的34行

% 依据2024新规范，行间距均统一为1.35倍(word版本测试结果为每页最大33行)
% \renewcommand{\baselinestretch}{1.35}        % 定义行距
\linespread{1.35}  % 设置行距

%%三线表设置
% V3.0更改——参照SWJTU已发表的硕士论文以及其它高校的论文，优化了三线表格式，增大了表内行距，增加了三线表的线宽
\RequirePackage{booktabs}
\renewcommand\heavyrulewidth{1.5pt} %粗线宽
\renewcommand\lightrulewidth{1pt} %细线宽
\renewcommand\cmidrulewidth{0.7pt} %其它分割线宽

%%表内多行内容设置
% V3.0更改——引入tabularx包以支持表内换行
\RequirePackage{tabularx}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

% 各章题序及标题：3号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\centering\zihao{3}\heiti}, name = {第,章}, nameformat = {}, number = {\arabic{chapter}}, numberformat = {}, titleformat = {}, aftername = {\hspace{0.6\ccwd}}]{chapter}
\CTEXsetup[beforeskip = {0pt}, afterskip = {18pt plus 2pt minus 2pt}]{chapter}

% 各节的一级题序及标题：4号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\raggedright\zihao{4}\heiti}, aftername = {\hspace{0.6\ccwd}}, numberformat = {\bfseries}]{section}
\CTEXsetup[beforeskip = {18pt plus 2pt minus 2pt}, afterskip = {6pt plus 2pt minus 2pt}]{section}

% 各节的二级题序及标题：4号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\raggedright\zihao{4}\heiti}, aftername = {\hspace{0.6\ccwd}}, numberformat = {\bfseries}]{subsection}
\CTEXsetup[beforeskip = {12pt plus 2pt minus 2pt}, afterskip = {6pt plus 2pt minus 2pt}]{subsection}

% 各节的三级（及以下）题序、款、项：小4号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\raggedright\zihao{-4}\heiti}, aftername = {\hspace{0.6\ccwd}}, numberformat = {\bfseries}]{subsubsection}
\CTEXsetup[beforeskip = {12pt plus 2pt minus 2pt}, afterskip = {6pt plus 2pt minus 2pt}]{subsubsection}

% V3.0更改——\tiny重定义为五号字体
\RequirePackage{type1cm}
\renewcommand\tiny{\@setfontsize\tiny{10.5\p@}{12\p@}}

% 目录格式：字体和缩进定义
\def\@dotsep{0.7}
\renewcommand*\l@chapter{\heiti\@dottedtocline{0}{0em}{3em}}
\renewcommand*\l@section{\songti\@dottedtocline{1}{1.75em}{2.05em}}
\renewcommand*\l@subsection{\songti\@dottedtocline{2}{4.0em}{2.5em}}

% 修改图和表的题注格式为 章-图表号
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 修改公式的编号格式为 章-公式号
\renewcommand{\theequation}{\thechapter--\arabic{equation}}

% 图表题注格式宏包（实现《规范》要求的题注格式）
\RequirePackage{caption}
\captionsetup[figure]{aboveskip=12pt, belowskip=6pt, labelformat=simple, labelsep=quad, font={tiny}}
\captionsetup[table]{aboveskip=6pt, belowskip=12pt, labelformat=simple, labelsep=quad, font={tiny}}

%-------------------------------------------------------------------------------
%                论文信息（题目、作者、导师、专业、图书信息等）
%-------------------------------------------------------------------------------

% 论文中英题目
\newcommand{\cTitle}[1]{\def\@cTitle{#1}}
\newcommand{\eTitle}[1]{\def\@eTitle{#1}}

% 论文作者信息
\newcommand{\cAuthor}[1]{\def\@cAuthor{#1}}
\newcommand{\eAuthor}[1]{\def\@eAuthor{#1}}
\newcommand{\cDiscipline}[1]{\def\@cDiscipline{#1}}
\newcommand{\eDisciplineFirst}[1]{\def\@eDisciplineFirst{#1}}
\newcommand{\eDisciplineSecond}[1]{\def\@eDisciplineSecond{#1}}
\newcommand{\studentID}[1]{\def\@studentID{#1}}
\newcommand{\cSchool}[1]{\def\@cSchool{#1}}
\newcommand{\eSchoolFirst}[1]{\def\@eSchoolFirst{#1}}
\newcommand{\eSchoolSecond}[1]{\def\@eSchoolSecond{#1}}

% 论文导师信息
\newcommand{\cTutor}[1]{\def\@cTutor{#1}}
\newcommand{\eTutor}[1]{\def\@eTutor{#1}}

% 论文分类及时间
\newcommand{\CI}[1]{\def\@CI{#1}}
\newcommand{\UDC}[1]{\def\@UDC{#1}}
\newcommand{\secLevel}[1]{\def\@secLevel{#1}}
\newcommand{\UCODE}[1]{\def\@UCODE{#1}}
\newcommand{\cDate}[3]{\def\@cDate{\dateprint{#1}{#2}{#3}}}
\newcommand{\eDate}[3]{\def\@eDate{\dateprintE{#1}{#2}{#3}}}

%-------------------------------------------------------------------------------
%                页眉及页脚
%-------------------------------------------------------------------------------
% V3.0更改——为了更接近《撰写规范》中的效果，将文武线的细线宽从0.5pt缩小至0.4pt，将粗细线间距从0.6pt扩大至0.8pt
% 依据2024新规范，页眉修改为单横线0.75磅，要求内写明页眉使用5号字体，但实际使用的似乎是小五
\renewcommand{\headrule}{
	\hrule width \hsize height 0.75pt
}

% 自定义页眉
\newcommand{\thesispagestyle}[2]{
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[OC,EC]{\zihao{-5}\songti #1}
	\fancyfoot[C]{\zihao{-5} #2}
	\fancypagestyle{plain}{\pagestyle{fancy}}
}

\setlength{\headsep}{4mm}
\setlength{\footskip}{10mm}

%-------------------------------------------------------------------------------
%                单双页空页设置
%-------------------------------------------------------------------------------
\RequirePackage{emptypage}
\newif\if@mainmatter % 标记是否进入正文部分
\@mainmatterfalse    % 默认前言状态

% 定义两种空白页策略
\def\emptypage@trueempty{%
  \hbox{}%
  \thispagestyle{empty}% % 完全空白页
  \newpage%
  \if@twocolumn%
    \hbox{}%
    \newpage%
  \fi%
}
\def\emptypage@headerempty{%
  \hbox{}%
  \thispagestyle{plain}% % 带页眉页脚的空白页
  \newpage%
  \if@twocolumn%
    \hbox{}%
    \newpage%
  \fi%
}

\DeclareOption{odd}{%
  \def\cleardoublepage{%
    \clearpage%
    \if@twoside%
      \ifodd\c@page%
	    % do nothing
	  \else%
        \if@mainmatter%
			\emptypage@headerempty% % 正文部分：带页眉页脚的空白页
		\else%
			\emptypage@trueempty%   % 前言部分：完全空白页
		\fi%
      \fi%
    \fi%
  }%
}
\DeclareOption{even}{%
  \def\cleardoublepage{%
    \clearpage%
    \if@twoside%
      \ifodd\c@page%
        \if@mainmatter%
			\emptypage@headerempty% % 正文部分：带页眉页脚的空白页
		\else%
			\emptypage@trueempty%   % 前言部分：完全空白页
		\fi%
      \fi%
    \fi%
  }%
}

%-------------------------------------------------------------------------------
%                封面设计
%-------------------------------------------------------------------------------
%为了使封面适应双面打印, 可使用\clearpagebyprint命令(同时类参数需指定为twoside)		
\newcommand{\clearpagebyprint}{\if@twoside\cleardoublepage\else\clearpage\fi} 
\newcommand{\CJKunderlinecolor}{\color{black}} % 颜色默认blue, 改为black
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
\newcommand{\makecover}{
	\clearpagebyprint
	\pagestyle{empty}
	\begin{titlepage}
		
		% 中文封面
		\linespread{1}
		\begin{flushleft}
		{
			\setstretch{1.4}
			\zihao{-4}
			{\songti\cover@CI}\fillinblank{8em}{\centering\@CI}\hfill{\songti\cover@secLevel}\fillinblank{8em}{\centering\@secLevel}
			\\
			{\songti\cover@UDC}\fillinblank{8em}{\centering\@UDC}\hfill{\songti\cover@UCODE}\fillinblank{6em}{\centering\@UCODE}
			\\
		}	
		\end{flushleft}
		\linespread{1.5}
		\vspace{60pt}
		\begin{center}
			{
				{\textbf{\zihao{1}\heiti\cover@cUniversity}}\\
				\vspace{6mm}
				{
					\ifdegreedoctor
					{\textbf{\zihao{2}\songti\cover@cThesisD}}
					\else
					{\textbf{\zihao{2}\songti\cover@cThesisM}}
					\fi
				}
				\vspace{10pt}
			}
			\vfill
			{
				\zihao{-2}
				\linespread{1.3}\selectfont
				\makebox[0pt]{
					\begin{minipage}{18em}
						\centering\heiti\CJKunderline{\@cTitle}
					\end{minipage}
				}
			}
			
			\vfill
			{
				\zihao{3}
                \linespread{1.75}\selectfont
				\begin{tabular}{l@{\extracolsep{0.2em}}c}
						{\songti\cover@cDiscipline}    	& \fillinblank{10em}{\@cDiscipline}
							\\
						{\songti\cover@cStudentID}    	& \fillinblank{10em}{\@studentID}
							\\
						{\songti\cover@cAuthor}   	& \fillinblank{10em}{\@cAuthor}
							\\
						{\songti\cover@cTutor}   	& \fillinblank{10em}{\@cTutor}
							\\
						{\songti\cover@cSchool}   	& \fillinblank{10em}{\@cSchool}
				\end{tabular}
				\vspace{10pt}
			}
			\vfill
			{
				\zihao{3}
				{\songti\@cDate}
			}
		\end{center}
		
		% 英文封面
		\clearpagebyprint
		\linespread{1.5}
		\begin{center}
			\begin{minipage}[c]{26em}
				\zihao{4}
				\linespread{1.2}\selectfont
				\centering
				\vspace{20pt}
				\ifdegreedoctor
				{\textbf{\cover@eDiscriptionD}}
				\else
				{\textbf{\cover@eDiscriptionM}}
				\fi
			\end{minipage}
		\end{center}
		\vspace{100pt}
		\begin{center}
			{
				\zihao{2}
				\linespread{1.3}\selectfont
				\makebox[0pt][c]{
					\begin{minipage}[c]{23em}
						\centering\textbf{\@eTitle}
					\end{minipage}
				}
				\vspace{20pt}
			}
			\vfill
			{
				\zihao{3}
				\linespread{1.75}\selectfont
				\begin{tabular}{r@{\extracolsep{0.2em}}l}
					{\cover@eDiscipline}    	& \fillinblank{12em}{\@eDisciplineFirst}
						\\
					\ifx\@eDisciplineSecond\empty\else {}& \fillinblank{12em}{\@eDisciplineSecond}\\ \fi
					{\cover@eStudentID}    	& \fillinblank{12em}{\@studentID}
						\\
					{\cover@eAuthor}   	& \fillinblank{12em}{\@eAuthor}
						\\
					{\cover@eTutor}   	& \fillinblank{12em}{\@eTutor}
						\\
					{\cover@eSchool}   	& \fillinblank{12em}{\@eSchoolFirst}
					\\
					\ifx\@eSchoolSecond\empty\else {}& \fillinblank{12em}{\@eSchoolSecond} \fi
				\end{tabular}
			}
			\vfill
			{
				\zihao{3}
				{\@eDate}
			}
			\end{center}

			% 加载学位论文主要工作（贡献）声明
			{
				\include{preface/statement}
			}
			
			% 加载学位论文版权使用授权书
			{
				\include{preface/copyright}
			}
	\end{titlepage}
}


%-------------------------------------------------------------------------------
%                中、英文摘要格式定义
%-------------------------------------------------------------------------------
\newcommand{\baseabstract}[5]{
    \chapter*{#1}
	\markboth{#2}{#2}
    #4
	\par
	\vspace{0.5cm}
    {\noindent \zihao{-4}{#3}#5}
}

% 中文摘要
\newcommand{\cabstract}[2]{
    \baseabstract{摘\quad 要}{摘\quad 要}{\textbf{关键词：}}{#1}{#2}
}

% 英文摘要
\newcommand{\eabstract}[2]{
    \baseabstract{\bf Abstract}{ABSTRACT}{\bf Keywords: }{#1}{#2}
}

%-------------------------------------------------------------------------------
%                文章、专利、项目列设计（参考哈工大模板）
%-------------------------------------------------------------------------------
% 定义新计数器
\newcounter{pubctr} 						
% 定义新环境
\newenvironment{publist}{
	\zihao{5}
	\setlength{\baselineskip}{16pt plus 2pt minus 2pt}
	\begin{list}{[\arabic{pubctr}]} 		%%标签格式
		{
			\usecounter{pubctr}
			\setlength{\leftmargin}{1.7em}	% 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
			\setlength{\itemindent}{4\ccwd}    % 标号缩进量
			\setlength{\labelsep}{0.5em}    % 标号和列表项之间的距离,默认0.5em
			\setlength{\rightmargin}{0em}   % 右边界
			% \setlength{\topsep}{0ex}        % 列表到上下文的垂直距离
			% \setlength{\parsep}{0ex}        % 段落间距
			\setlength{\itemsep}{0.5ex}       % 标签间距
			\setlength{\listparindent}{0ex} % 段落缩进量
		}}
		{\end{list}}

%-------------------------------------------------------------------------------
%                加载字符串配置文件
%-------------------------------------------------------------------------------
\AtEndOfClass{\input{swjtuThesis.cfg}}
\ExecuteOptions{odd}
\ProcessOptions
\endinput

%% end of file `SWJTU_Thesis.cls'.
