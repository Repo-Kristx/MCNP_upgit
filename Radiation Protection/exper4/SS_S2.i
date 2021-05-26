C 实验四: 中子屏蔽设施设计
C Source: Point Source, A = 5.45e+7 n/s, E_bar = 2.35 MeV
C Shield: Paraffin + 304 Stainless Steel layer*2
C Tally: F4
C ------------------------------------------------------ C
C Author   Zihao Xu              
C Date     2021-5-27
C E-mail   zhxu8354@khu.ac.kr
C git@github.com:Repo-Kristx/MCNP_upgit.git
C ------------------------------------------------------ C
C -----#####! OPEN SOURCE, NO COMMERCIAL USE !#####----- C
C ------------------------------------------------------ C
C -----program start here----- C
C -----cells-----
 1   2     -0.930    1   -3 6 -7 10 -11 17     $source building
 2   5      -1.58    21 -22 8 -9 12 -13        $shielder_1
 3   5      -1.58    23 -24 8 -9 12 -13        
 6   1  -0.001205    14 -15 -16                $detector
31   1  -0.001205    -70 #1 #2 #3 #6           $air surface
50   0               70                        $vaccum

C -----surface-----NS-4-FR-----
C -----横向-----
1   PX    -25 $起点：源
2   PX      0
3   PX     25
21  PX     77 $屏蔽体曲面
22  PX     82
23  PX     83
24  PX     88
C ----------
6   PY    -25 $y方向曲面
7   PY     25
8   PY    -40
9   PY     40
C ----------
10  PZ    -25 $z向曲面
11  PZ     25
12  PZ    -40
13  PZ     40
C ----------
14  PZ    -10 $探测器
15  PZ     10
16  C/Z    120.25 0 5.25
C ----------
17  KX    0 0.172 1 $锥面(+1代表轴向正向的圆锥体)
C ----------
70  SO    200 $外面

C -----data-----
C
C 材料卡
M1        7014.66c      -0.78084 $ Air  0.001205 g/cm^3
          8016.66c     -0.209476
         18000.59c     -0.009684
         elib=.03e     plib=.04p
M2        1001.66c     -0.148605 $ Paraffin 0.930 g/cm^3
          6012.66c     -0.851395
         elib=.03e     plib=.04p
M3        1001.66c      -0.05473 $ NS-4-FR 1.8 g/cm^3
          5011.66c      -0.01404
          6012.66c       -0.2974
          7014.66c      -0.02152
          8016.66c       -0.3048
         13027.66c       -0.3427
         elib=.03e     plib=.04p
M4        1001.66c        -0.104 $ Krafton-HB4 1.08g/cm^3
          5011.66c        -0.020
          6012.66c        -0.745
          7014.66c       -0.0213
          8016.66c        -0.106
         14028.66c       -0.0038
         elib=.03e     plib=.04p
M5        6012.66c     -0.000400 $ 304 Stainless Stell 8.00 g/cm^3
         14028.60c      -0.00500
         15031.66c     -0.000230
         16032.66c     -0.000150
         24052.50c     -0.190000
         25055.66c     -0.010000
         26056.55c     -0.701730
         28059.50c     -0.092500
         elib=.03e     plib=.04p
C 放射源描述
SDEF PAR=1 ERG=2.35
C 模拟格式声明
MODE N
IMP:N  1 1 1 1 1 4 1 0
F4:N    6
NPS 1E4
C -----program end here----- C