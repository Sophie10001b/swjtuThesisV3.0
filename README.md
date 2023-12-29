# swjtuThesis V3.0


:tram: **西南交通大学研究生学位论文LaTeX模板**（支持硕士和博士学位论文）

- swjtuThesisV3.0是在Limin HUANG所开发的swjtuThesis ([https://github.com/Studio513/swjtuThesis](https://github.com/Studio513/swjtuThesis)) 以及Hao WANG所提供的swjtuThesis V2.0([https://github.com/cshaowang/swjtuThesisV2.0](https://github.com/cshaowang/swjtuThesisV2.0)) 上作的修订，原因是由于目前的swjtuThesis模板中的版面设置、对macOS的支持以及对不同文献引用格式的支持仍存在进一步优化的空间。V3.0整体上基于《西南交通大学研究生学位论文撰写规范》(以下简称《撰写规范》)([https://gsnews.swjtu.edu.cn/info/1102/4733.htm](https://gsnews.swjtu.edu.cn/info/1102/4733.htm)) 以及之前的swjtuThesis版本完成开发
- **目前swjtuThesis V3.0仍然处在Demo阶段，在作者本人的论文通过最终审查之前，本模板的相关设置有极大概率被进一步更改与优化，直至最后形成正式的V3.0版本**
- 商业用途，请务必联系swjtuThesis开发者 (联系方式见swjtuThesis的托管网站)
- Windows 11 已测试编译环境：Tex Live 2021 + VSCode(LaTeX Workshop) + XeLaTeX :dolphin:
- macOS Sonoma 已测试编译环境：MacTeX 2023 + VSCode(LaTeX Workshop) + XeLaTeX :dolphin:

:computer: **更新日志**
- 2023.12.29(swjtuBST.bst)
  1. 修复了有关学位论文中地点与单位的引用格式设置，目前格式为"address: school"
  2. 2023.12.29 - 现在文献引用支持自动省略位于前三位作者之后的所有作者，并添加et al.(如果为中文文献，请手动为文献条目中的"language"赋值"zh"，此时et al.会变更为"...等.")
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
>> **Scarselli F, Gori M, Tsoi A C, Hagenbuchner M, Monfardini G. The graph neural network model [FreeCite]. TNNLS, 2008, 20(1): 61-80.**
3. 为自动处理部分引用中可能出现的页码信息缺失情况，模板内新增了函数`freeoutput.pages`用于处理页面信息的输出，目前该函数已经引入到了`@inproceedings`和`@book`引用类型中，包含页面以及不包含页面时的输出效果如下：
>@inproceedings{vaswani2017Transformer_nopages,
>  title={Attention is all you need},
>  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, {\L}ukasz and Polosukhin, Illia},
>  booktitle={Advances in neural information processing systems},
>  volume={30},
>  year={2017}
>}
>> **Vaswani A, Shazeer N, Parmar N, Uszkoreit J, Jones L, Gomez A N, Kaiser Ł, Polosukhin I. Attention is all you need [C]. Advances in neural information processing systems, volume 30, 2017.**

>@inproceedings{vaswani2017Transformer_pages,
>  title={Attention is all you need},
>  author={Vaswani, Ashish and Shazeer, Noam and Parmar, Niki and Uszkoreit, Jakob and Jones, Llion and Gomez, Aidan N and Kaiser, {\L}ukasz and Polosukhin, Illia},
>  booktitle={Advances in neural information processing systems},
>  volume={30},
>  pages={1--11},
>  year={2017}
>}
>> **Vaswani A, Shazeer N, Parmar N, Uszkoreit J, Jones L, Gomez A N, Kaiser Ł, Polosukhin I. Attention is all you need [C]. Advances in neural information processing systems, volume 30, 2017: 1–11.**
4. 部分BUG的修正，比如`@phdthesis`所对应的`add.D`函数中GB/T文献标号的乱码
