# swjtuThesis V3.0


:tram: **西南交通大学研究生学位论文LaTeX模板**（支持硕士和博士学位论文）

- swjtuThesisV3.0是在Limin HUANG所开发的swjtuThesis ([https://github.com/Studio513/swjtuThesis](https://github.com/Studio513/swjtuThesis)) 以及Hao WANG所提供的swjtuThesis V2.0([https://github.com/cshaowang/swjtuThesisV2.0](https://github.com/cshaowang/swjtuThesisV2.0)) 上作的修订，原因是由于目前的swjtuThesis模板中的版面设置、对macOS的支持以及对不同文献引用格式的支持仍存在进一步优化的空间。V3.0整体上基于《西南交通大学研究生学位论文撰写规范》(以下简称《撰写规范》)([https://gsnews.swjtu.edu.cn/info/1102/4733.htm](https://gsnews.swjtu.edu.cn/info/1102/4733.htm)) 以及之前的swjtuThesis版本完成开发
- **目前作者本人学位论文已通过审核，swjtuThesis V3.0已基本完善，后续需求可以通过Issues提交，或直接构建/发布新模板。希望能有更多的同学加入到LaTeX模板的使用、维护与更新之中！**
- 商业用途，请务必联系swjtuThesis开发者 (联系方式见swjtuThesis的托管网站)
- Windows 11 已测试编译环境：Tex Live 2021 + VSCode(LaTeX Workshop) + XeLaTeX :dolphin:
- macOS Sonoma 已测试编译环境：MacTeX 2023 + VSCode(LaTeX Workshop) + XeLaTeX :dolphin:
- Tips: 若每页段落间距不一致，可以尝试在页面中添加\raggedbottom命令来将间距集中在页面底部，并基于此策略调整内容排版

:computer: **更新日志**
- 2024.11.16(swjtuThesis.cls, cabstract.tex eabstract.tex)
  1. 现在\baseabstract命令内于摘要正文与关键字之间包含了换行命令\par，修复了由于摘要正文输入中最后未手动换行导致正文与关键字未分行的问题

- 2024.09.11(swjtuThesis.cls, swjtuThesis.cfg, cabstract.tex, eabstract.tex)
  1. 微调了中文摘要与英文摘要页面，关键词分隔符与新规范保持一致

- 2024.08.14(swjtuThesis.cls, main.tex)
  1. 继续微调了正文中页眉页脚距离、页边距以及基础行距，目前单页最大行数与官方word文档一致(经测试为33行)，同时调整了图表等浮动体与上下文的间距

- 2024.07.27
  1. **依据2024年发布的新规范([https://gsnews.swjtu.edu.cn/info/1063/8744.htm](https://gsnews.swjtu.edu.cn/info/1063/8744.htm))对原模板进行了初步调整**。目前相关间距设定仍有进一步调整与对齐的空间，后续可能会不定时根据issues中的问题进行进一步调整

- 2024.05.22(swjtuThesis.cfg, swjtuThesis.cls, info.tex, package.tex)
  1. 依据论文存档要求，封面时间格式更改为年+月
  2. 基于引用格式要求，修改natbib的连续引用设置，使其能够将[1,2]表述为[1-2]

- 2024.04.08(swjtuThesis.cfg, swjtuThesis.cls)
  1. 调整了封面标题的间距，使整体效果与《撰写规范》保持一致
  2. 参考《撰写规范》，修改了封面各项信息所使用的字号

- 2024.03.31(package.tex, main.tex, swjtuThesis.cls)
  1. 重定义了\tiny字体，现在\tiny字体的大小为五号字体(10.5pt)，用于图表相关设置(因为caption包暂不支持ctex的字体设置)，如需要使用\tiny字体，可将此定义移除，并重定义其它字体为五号字体
  2. 参考已有论文，修改了图表题目的默认设置以及表格字体的默认设置，其中默认字体大小替换为五号(《撰写规范》中并未提及具体的图表字体设置，此设置仅为与已有论文保证一致)
  3. 微调了section, subsection, subsubsection的下文间距，现在下文间距为弹性设置，理论上可以缓解因标题跨页导致的页面空白

- 2024.02.24(conclusion.tex)
  1. 修复了结论章节在不显示章节号情况下后续小节编号会沿用前一章节编号的问题，若需要结论章节同样显式编号，直接使用\chapter{}替代\chapter*{}命令后将本节中计数器相关命令(\counter)删除即可
     
- 2024.01.11(swjtuBST.bst, main.tex)
  1. 由于标号均为"[D]"，现在硕士博士学位论文统一基于@thesis进行引用
  2. 修复了目录中参考文献章节页码的交叉引用问题，之前版本指向参考文献章节的最后一页，最新版本已修正为参考文献章节的首页

- 2024.01.01(swjtuBST.bst, swjtuThesis.cls)
  1. 现在howpublished中的内容会自动被识别为url，无需手动添加\url{}标识，从而可以基于hyperref包进行文献引用中url的自动换行。同时url字体已经被设置为与正文字体保持一致
  2. 补充了三线表中\cmidrule线条的粗细设置选项，现在默认设置为`0.05em`
  
- 2023.12.29(swjtuBST.bst)
  1. 修复了有关学位论文中地点与单位的引用格式设置，目前格式为"address: school"
  2. 现在文献引用支持自动省略位于前三位作者之后的所有作者，并添加et al.(如果为中文文献，请手动为文献条目中的"language"赋值"zh"，此时et al.会变更为"...等.")
  3. 现在Times New Roman中能够正确使用AMS的黑板体，同时在main.tex中新增了调整跨页宽容度的相关设置
  
- 2023.12.01(package.tex)
  1. 参考其它已发表学位论文，列表的缩进效果已经更改为首行缩进2字符，同时去除了列表与上下正文间的额外间隔

:computer: **swjtuThesis V3.0主要版面设置更改(主要集中于swjtuThesis.cls文件与package.tex文件)**
1. ctextbook中的设置`winfonts`被更改为`nofonts`，并通过CJK手动设置主要字体。该项更改主要解决了之前模板无法在Windows外系统完成编译的问题，现在新的模板已经在Windows和macOS中通过编译测试。注意在macOS中使用模板时可能出现字体缺失问题，作者本人在使用时额外安装了以下字体：
```
SimSun
SimHei
Latin Modern Math
Linux Libertine O
```
2. 版面设置的微调。新模板中使用`geometry`控制版面，同时为了更贴近《撰写规范》中的效果，下页边距从`25.4mm`更改为`32.0mm`。注意A4纸的大小为`210mm * 297mm`，因此《撰写规范》中对页边距和版心大小的要求`版面上空25.4mm，下空25.4mm，左空 26.0mm，右空 26.0mm；版心尺寸：宽 160mm，高 250mm`无法同时满足，目前仅依据页边距来调整版面大小
3. 行间距的调整。由基于`\baselineskip`调整更改为基于`\baselinestretch`调整，目前的行距倍数被设置为`1.4`，结合之前对页面大小的调整，V3.0模板目前可以保证单页内容的行数正好为*34*行，即与《撰写规范》中的建议相同
4. 文武线的微调。略微减小了细线宽，略微增大了粗细线间距，现在的文武线效果更加接近《撰写规范》中的示例
5. 三线表的设置。参考校内已发表的硕士论文以及其它高校的论文，新的三线表设置中将表间行距设置为`1.3`，粗线宽设置为`0.12em`，细线宽设置为`0.08em`
6. 图表题格式微调。参考其它高校的论文，多行图表题的行距倍数增大为`1.2`

:computer: **swjtuThesis V3.0主要文献引用设置更改(主要集中于swjtuBST.bst文件)**
1. 为满足对ArXiv和网页文件的引用要求[EB/OL]，模板内新增了函数`add.EBOL`，同时新增了基于`@misc`修改而来的新引用类型`@website`，使用方式与输出效果如下：
>@website{clevert2015ELU,
>  title={Fast and accurate deep network learning by exponential linear units (elus)},
>  author={Clevert, Djork-Arn{\'e} and Unterthiner, Thomas and Hochreiter, Sepp},
>  year={2015},
>  howpublished={https://arxiv.org/abs/1511.07289}
>}
>> **Clevert D A, Unterthiner T, Hochreiter S. Fast and accurate deep network learning by exponential linear units (elus) [EB/OL]. https://arxiv.org/abs/1511.07289, 2015.**
2. 为满足对任意自定义引用格式的兼容，比如其它的GB/T文献标号，以及不同的文献信息，模板内新增了两类文献信息`symbol`和`freeinfo`，新增了函数`add.GBTSYMBOL`以及新的引用类型`@freecite`。该引用类型作为备选手段，主要处理已有引用类型无法满足需求且不想更改.bst文件设置的情况，此时使用`@freecite`引用类型并通过`symbol`手动输入GB/T文献类型符号以及`freeinfo`手动录入文献额外引用信息即可输出任意格式的文献引用，其使用方式与输出效果如下：
>@freecite{scarselli2008GNN_freecite,
>  title={The graph neural network model},
>  author={Scarselli, Franco and Gori, Marco and Tsoi, Ah Chung and Hagenbuchner, Markus and Monfardini, Gabriele},
>  symbol={FreeCite},
>  freeinfo={TNNLS, 2008, 20(1): 61-80}
>}
>> **Scarselli F,Gori M,Tsoi A C, et al. The graph neural network model [FreeCite]. TNNLS, 2008, 20(1): 61-80.**
3. 为自动处理部分引用中可能出现的页码信息缺失情况，模板内新增了函数`freeoutput.pages`用于处理页面信息的输出，目前该函数已经引入到了`@inproceedings`和`@book`引用类型中，包含页面以及不包含页面时的输出效果如下：
>@inproceedings{vaswani2017Transformer_nopages,
>  title={Attention is all you need},
>  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, {\L}ukasz and Polosukhin, Illia},
>  booktitle={Advances in neural information processing systems},
>  volume={30},
>  year={2017}
>}
>> **Vaswani A, Shazeer N, Parmar N, et al. Attention is all you need [C]. Advances in neural information processing systems, volume 30, 2017.**

>@inproceedings{vaswani2017Transformer_pages,
>  title={Attention is all you need},
>  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, {\L}ukasz and Polosukhin, Illia},
>  booktitle={Advances in neural information processing systems},
>  volume={30},
>  pages={1--11},
>  year={2017}
>}
>> **Vaswani A, Shazeer N, Parmar N, et al. Attention is all you need [C]. Advances in neural information processing systems, volume 30, 2017: 1–11.**
4. 部分BUG的修正，比如`@phdthesis`所对应的`add.D`函数中GB/T文献标号的乱码
