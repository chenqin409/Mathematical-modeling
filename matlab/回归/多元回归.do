import excel "C:\新建文件夹 (2)\数学建模\清风课件\第7讲.多元回归分析\代码和例题数据\课堂中讲解的奶粉数据.xlsx", sheet("Sheet1") firstrow
//定量变量
sum 团购价元 评价量 商品毛重kg
//定性变量
tabulate 配方,gen(A)
tabulate  奶源产地 ,gen(B)
tabulate  国产或进口,gen(C)
tabulate  适用年龄岁,gen(D)
tabulate 包装单位,gen(E)
tabulate 分类,gen(F)
tabulate 段位,gen(G)

regress 评价量 团购价元 商品毛重kg
est store m1
reg2docx  m1 using m1.docx,replace

regress  评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4
est store m2
reg2docx  m2 using m2.docx,replace

//标准化回归系数
regress 评价量 团购价元 商品毛重kg, b 

//画残差图
regress 评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4
rvfplot  // 残差与拟合值的散点图
graph export a1.png,replace  //保存图片
rvpplot 团购价元 //残差与团购价元的散点图

//描述性统计并给出分位数对应的数值
summarize 评价量,d
//评价量的概率密度估计图
kdensity 评价量

//异方差检验（比较p值与0.05的关系，判断是否存在异方差）
estat hettest,rhs iid //BP检验
estat imtest,white //怀特检验

//使用OLS+稳健的标准误
regress 评价量 团购价元 商品毛重kg A1 A2 A3 B1 B2 B3 B4 B5 B6 B7 B8 B9 C1 C2 D1 D2 D3 D4 D5 E1 E2 E3 E4 F1 F2 G1 G2 G3 G4 ,r

//计算VIF（检验多重共线性）
estat vif

//逐步回归（需提前排除多重共线性）
stepwise reg 评价量 团购价元 商品毛重kg A1 A3 B1 B2 B3 B4 B5 B6 B7 B9 C1 D1 D2 D3 D4 E1 E2 E3 F1 G1 G2 G3,  r pe(0.05) //向前逐步回归
stepwise reg 评价量 团购价元 商品毛重kg A1 A3 B1 B2 B3 B4 B5 B6 B7 B9 C1 D1 D2 D3 D4 E1 E2 E3 F1 G1 G2 G3,  r pr(0.05) // 向后逐步回归
stepwise reg 评价量 团购价元 商品毛重kg A1 A3 B1 B2 B3 B4 B5 B6 B7 B9 C1 D1 D2 D3 D4 E1 E2 E3 F1 G1 G2 G3,  r b pr(0.05) //加上标准化




