C 辐射防护与保健物理实验1 gamma射线辐射屏蔽防护 算例案例
C 原作者：杨磊；
C 注释/修改：Zihao Xu
C 计算不同介质对 Cs-137 准直源的屏蔽能力;
C 放射源： Cs-137 点源， 2μCi, 2003 年 5 月 26 日出厂 0.662MeV;
C Pb准直器：分三段：一个空心圆柱体，一个粗的空心圆柱体和一个细空心圆柱体组成。
C 屏蔽体： 5.6cm 厚度不锈钢层；
C 探头： NaI 圆柱，直径=6.1cm, 厚度=6.1cm;
C 探测器卡： F4,F6,F8 （分别测量粒子的通量、比释动能和吸收剂量)
C
C =========================================
C 栅元定义
C 射线源
1   1           -11.3             1 -2 -33      $第一列为栅元编号，第二列为材料编号，第三列为材料密度，后面列指曲面左右（1/2）与上下（33/33）包裹的区域
2   1           -11.3          2 -3 31 -33 #4   $指曲面左右（2/3）与上下（31/33）包裹的区域（同上，此材料为Pb)
3   1           -11.3          3 -4 31 -32 #4   $指曲面左右（3/4）与上下（31/32）包裹的区域
4   2     -0.00102047             2 -4 -31      $同上，见实验1讲义示意图（材料为Air）
5   2     -0.00102047          3 -4 32 -33      $同上
C --------------------
C 屏蔽体
11  4           -7.92          4 -5 -11 12 -13 14 $铬合金不锈钢屏蔽体，厚度为5.6cm
C --------------------
C 探测器
21  8           -3.67             5 -6 -34      $NaI探测器探头，左右厚6.1cm，直径6.1cm
C --------------------
C 周围环境
31  2     -0.00102047   -70 #1 #2 #3 #4 #5 #11 #21 $探测器周围环境，从中心到曲面70（即-70），删去12345四个曲面包围的区域（为何无6？）
41  0                                   70      $超出周围范围的部分，按照真空处理，从曲面70开始往外（即70）

C =========================================
C 曲面定义
1 PX     0.0 $即"Plane_vertical_to_X"垂直于x轴的平面，记为1，方程为x=0（起算面） 
2 PX     1.3 $方程为x=1.3 （源后的Pb屏蔽，即“瓶底”）
3 PX     3.7 $x=3.7 （Pb准直器的前半部分--33曲面对应部分）
4 PX     4.3 $x=4.3 （Pb准直器后半部分--22曲面对应部分）
5 PX     9.9 $x=9.9 （原值为9.9，对应5.6cm厚的Cr不锈钢屏蔽体）
6 PX    16.0 $x=16.0 （NaI探头，厚度为6.1cm，从9.9cm到16cm）
C --------------------
11 PY    6.0 $无意义曲面定义
12 PY   -6.0 $无意义曲面定义
13 PZ    4.0 $Plane_vertical_to_Z，不锈钢板的径向拓展长度，长度8cm，单侧4cm
14 PZ   -4.0 $同上，下半侧的拓展长度
C --------------------
31 CX    0.1 $Cylinder_X_axis "y^2 + z^2 = 0.1^2"，准直器的准直口半径为0.1cm
32 CX    1.5 $"y^2 + z^2 = 1.50^2"，准直器外窄口的外半径为1.5cm
33 CX   2.15 $"y^2 + z^2 = 2.15^2"，准直器内宽口的外半径为2.15cm
34 CX   3.05 $"y^2 + z^2 = 3.05^2"，NaI探头的半径为3.05cm
C --------------------
70 S 30 0 0 70.0 $球面，以1号曲面+准直心为中心起算，向右侧偏移36cm作为球心中心，球半径为76cm，足够实验需要
C ==========================

MODE P E $光子电子联合输运模式
IMP:P 1 1 1 1 1 1 1 1 0 $9个栅元的权重，对于光子均同权
IMP:e 1 1 1 1 1 1 1 1 0 $9个栅元的权重，对于电子均同权
C 源定义
sdef par=2 erg=0.662 pos=2.8 0 0
C ==========================
C 材料
M1     82000              1 $Pb 11.3g/cm^3
M2      6012      -0.000124 $air 材料 0.00102047g/cm^3
        7014        -0.7553
        8016        -0.2318
       18000     -0.0128989
M3      1001              2 $H2O 1.0g/cm^3
        8016              1
M4     24000         -0.190 $ Cr 不锈钢 7.92g/cm^3
       25000         -0.020 $ Mn
       26000         -0.695 $ Fe
       28000         -0.095 $ Ni
M5     13000              1 $Al 2.702g/cm^3
M6      1001         -0.102 $ 肌肉组织 1.0599g/cm^3
        6000         -0.143
        7014         -0.034
        8016         -0.710
       11023         -0.001
       15031         -0.002
       16032         -0.003
       17000         -0.001
       19000         -0.004
M7      6012              5 $有机玻璃 PMMA(亚克力) 1.18g/cm^3
        8016              2
        1001              8
M8     11023          -0.15 $NaI 材料 3.67g/cm^3
       53127         -0.849
       81205         -0.001
M9     74000              1 $PbWO4,8.28g/cm^3
       82000              1
        8016              4
C ============================================
C 记数卡
F8:P 21         $Energy distribution of pulsed created in a detector 探测器脉冲能谱分布
F6:P 21         $Track length estimate of energy deposition 光子的沉积能量
F4:P 21         $Track length estimate of cel1f1ux 栅元注量
C E8 0.04 0.662   $原注为配合Na探头的能量探测范围，仍需查明En的意义
E4 0.04 0.662   $0.04意义不明，6.662为出射光子的能量
NPS 5E6         $抽样次数5*10~6次，最后一张数据卡
C ----------（以下空白）----------