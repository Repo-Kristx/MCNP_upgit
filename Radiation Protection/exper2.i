C 实验二: gamma放射源屏蔽层设计
C Source: 1e+4 Ci Co-60，E1=1.17MeV, E2=1.33 MeV, E=1.25 MeV
C Shield: MainShield=170 cm，Roof=155 cm，Ground=500 cm
C Tally: F5 
C ------------------------------------------------------ C
C Author   Zihao Xu              
C Date     2021-5-27
C E-mail   zhxu8354@khu.ac.kr
C git@github.com:Repo-Kristx/MCNP_upgit.git
C ------------------------------------------------------ C
C -----#####! OPEN SOURCE, NO COMMERCIAL USE !#####----- C
C ------------------------------------------------------ C
C -----program start here----- C
C ==================
C 栅元卡
C ------------------
C 垂直x向的屏蔽墙
30  1       -2.30       1 -2 11 -15 22 -23
31  1       -2.30       3 -4 13 -15 22 -23
32  1       -2.30       5 -6 11 -17 22 -23
C ------------------
C 垂直y向的屏蔽墙
40  1       -2.30       2 -5 11 -12 22 -23
41  1       -2.30       2 -3 14 -15 22 -23
42  1       -2.30       1 -5 16 -17 22 -23
C ------------------
C 穹顶 + 地基
50  1       -2.30       1 -6 11 -17 23 -24 $ roof
51  1       -2.30       8 -9 18 -19 21 -22 $ ground
C ------------------
C 其他区域
60  2 -0.00102047     -99 #30 #31 #32 #40 #41 #42 #50 #51 $ Aero Surface
61  0                  99                                 $ Vaccum

C ==================
C 曲面卡
C ------------------
1   PX        0
2   PX      170
3   PX      970
4   PX     1140
5   PX     1290
6   PX     1460
8   PX     -500 $ ground 500 expansion
9   PX     1960 $ ground 500 expansion
C ------------------
11  PY        0
12  PY      170
13  PY      320
14  PY      470
15  PY      640
16  PY      790
17  PY      960
18  PY     -500 $ ground 500 expansion
19  PY     1460 $ ground 500 expansion
C ------------------
21  PZ     -500 $ ground 500 expansion
22  PZ        0
23  PZ      350
24  PZ      505
C ------------------
99  S       730 480 250 2000

C ==================
C 数据卡
MODE P E
IMP:P 1 1 1 1 1 1 1 1 1 0
IMP:E 1 1 1 1 1 1 1 1 1 0
C 源定义
sdef par=2 erg=1.25 pos=420 220 150
C 材料卡
C ------------------
M1      1001      -0.022100 $ concrete, 2.30 g/cm^3
        6012      -0.002484 $ C
        8016      -0.574930 $ O
       11023      -0.015208 $ Na
       12024      -0.001266 $ Mg
       13027      -0.019953 $ Al
       14028      -0.304627 $ Si
       19039      -0.010045 $ K
       20040      -0.042951 $ Ca
       26056      -0.006435 $ Fe
M2      6012      -0.000124 $ air 材料 0.00102047g/cm^3
        7014      -0.755300 $ N
        8016      -0.231800 $ O
       18000      -0.012899 $ Ar
C 计数卡
F5:P    295 220 150 1.5
       1215 245 150 1.5
       1140 715 150 1.5
         85 715 150 1.5
C 抽样次数
NPS 1E4
C -----program end here----- C