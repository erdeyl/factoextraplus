# Subset and summarize the output of factor analyses

Subset and summarize the results of Principal Component Analysis (PCA),
Correspondence Analysis (CA), Multiple Correspondence Analysis (MCA),
Factor Analysis of Mixed Data (FAMD), Multiple Factor Analysis (MFA) and
Hierarchical Multiple Factor Analysis (HMFA) functions from several
packages.

## Usage

``` r
facto_summarize(
  X,
  element,
  node.level = 1,
  group.names,
  result = c("coord", "cos2", "contrib"),
  axes = 1:2,
  select = NULL
)
```

## Arguments

- X:

  an object of class PCA, CA, MCA, FAMD, MFA and HMFA \[FactoMineR\];
  prcomp and princomp \[stats\]; dudi, pca, coa and acm \[ade4\]; ca
  \[ca package\]; expoOutput \[ExPosition\].

- element:

  the element to subset from the output. Possible values are "row" or
  "col" for CA; "var" or "ind" for PCA and MCA; "mca.cor" for MCA;
  'quanti.var', 'quali.var' , 'group' or 'ind' for FAMD, MFA and HMFA.

- node.level:

  a single number indicating the HMFA node level.

- group.names:

  a vector containing the name of the groups (by default, NULL and the
  group are named group.1, group.2 and so on).

- result:

  the result to be extracted for the element. Possible values are the
  combination of c("cos2", "contrib", "coord")

- axes:

  a numeric vector specifying the axes of interest. Default values are
  1:2 for axes 1 and 2.

- select:

  a selection of variables. Allowed values are NULL or a list containing
  the arguments name, cos2 or contrib. Default is list(name = NULL, cos2
  = NULL, contrib = NULL):

  - name: is a character vector containing variable names to be selected

  - cos2: if cos2 is in \[0, 1\], ex: 0.6, then variables with a cos2 \>
    0.6 are selected. if cos2 \> 1, ex: 5, then the top 5 variables with
    the highest cos2 are selected

  - contrib: if contrib \> 1, ex: 5, then the top 5 variables with the
    highest cos2 are selected.

## Value

A data frame containing the (total) coord, cos2 and the contribution for
the axes.

## Details

If length(axes) \> 1, then the columns contrib and cos2 correspond to
the total contributions and total cos2 of the axes. In this case, the
column coord is calculated as x^2 + y^2 + ...+; x, y, ... are the
coordinates of the points on the specified axes.

## References

http://www.sthda.com/english/

## Author

Alboukadel Kassambara <alboukadel.kassambara@gmail.com>

## Examples

``` r
# Principal component analysis
# +++++++++++++++++++++++++++++
data(decathlon2)
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active,  scale = TRUE)

# Summarize variables on axes 1:2
facto_summarize(res.pca, "var", axes = 1:2)[,-1]
#>                     Dim.1       Dim.2     coord      cos2   contrib
#> X100m        -0.850625692 -0.17939806 0.7557477 0.7557477 12.674495
#> Long.jump     0.794180641  0.28085695 0.7096035 0.7096035 11.900620
#> Shot.put      0.733912733  0.08540412 0.5459218 0.5459218  9.155546
#> High.jump     0.610083985 -0.46521415 0.5886267 0.5886267  9.871741
#> X400m        -0.701603377  0.29017826 0.5764507 0.5764507  9.667541
#> X110m.hurdle -0.764125197 -0.02474081 0.5844994 0.5844994  9.802524
#> Discus        0.743209016  0.04966086 0.5548258 0.5548258  9.304874
#> Pole.vault   -0.217268042  0.80745110 0.6991827 0.6991827 11.725854
#> Javeline      0.428226639  0.38610928 0.3324584 0.3324584  5.575594
#> X1500m        0.004278487  0.78448019 0.6154275 0.6154275 10.321212
# Select the top 5 contributing variables
facto_summarize(res.pca, "var", axes = 1:2,
           select = list(contrib = 5))[,-1]
#>                   Dim.1      Dim.2     coord      cos2   contrib
#> X100m      -0.850625692 -0.1793981 0.7557477 0.7557477 12.674495
#> Long.jump   0.794180641  0.2808570 0.7096035 0.7096035 11.900620
#> Pole.vault -0.217268042  0.8074511 0.6991827 0.6991827 11.725854
#> X1500m      0.004278487  0.7844802 0.6154275 0.6154275 10.321212
#> High.jump   0.610083985 -0.4652142 0.5886267 0.5886267  9.871741
# Select variables with cos2 >= 0.6
facto_summarize(res.pca, "var", axes = 1:2,
           select = list(cos2 = 0.6))[,-1]
#>                   Dim.1      Dim.2     coord      cos2  contrib
#> X100m      -0.850625692 -0.1793981 0.7557477 0.7557477 12.67450
#> Long.jump   0.794180641  0.2808570 0.7096035 0.7096035 11.90062
#> Pole.vault -0.217268042  0.8074511 0.6991827 0.6991827 11.72585
#> X1500m      0.004278487  0.7844802 0.6154275 0.6154275 10.32121
# Select by names
facto_summarize(res.pca, "var", axes = 1:2,
     select = list(name = c("X100m", "Discus", "Javeline")))[,-1]
#>               Dim.1       Dim.2     coord      cos2   contrib
#> X100m    -0.8506257 -0.17939806 0.7557477 0.7557477 12.674495
#> Discus    0.7432090  0.04966086 0.5548258 0.5548258  9.304874
#> Javeline  0.4282266  0.38610928 0.3324584 0.3324584  5.575594
           
# Summarize individuals on axes 1:2
facto_summarize(res.pca, "ind", axes = 1:2)[,-1]
#>                  Dim.1      Dim.2      coord      cos2    contrib
#> SEBRLE       0.1912074  1.5541282  2.4518746 0.5050034  1.7878218
#> CLAY         0.7901217  2.4204156  6.4827039 0.5057178  4.7269626
#> BERNARD     -1.3292592  1.6118687  4.3650507 0.4871654  3.1828434
#> YURKOV      -0.8694134 -0.4328779  0.9432630 0.1199355  0.6877946
#> ZSIVOCZKY   -0.1057450 -2.0233632  4.1051806 0.5779938  2.9933552
#> McMULLEN     0.1185550 -0.9916237  0.9973729 0.1543704  0.7272497
#> MARTINEAU   -2.3923532 -1.2849234  7.3743818 0.5205607  5.3771432
#> HERNU       -1.8910497  1.1784614  4.9648401 0.5543447  3.6201890
#> BARRAS      -1.7744575 -0.4125321  3.3188820 0.6495490  2.4200135
#> NOOL        -2.7770058 -1.5726757 10.1850700 0.6469840  7.4265994
#> BOURGUIGNON -4.4137335  1.2635770 21.0776704 0.9301572 15.3691054
#> Sebrle       3.4514485  1.2169193 13.3933893 0.7593400  9.7659944
#> Clay         3.3162243  1.6232908 13.6324164 0.8523470  9.9402847
#> Karpov       4.0703560 -0.7983510 17.2051623 0.8138146 12.5454070
#> Macey        1.8484623 -2.0638828  7.6764252 0.8165181  5.5973828
#> Warners      1.3873514  0.2819083  2.0042163 0.2662078  1.4614049
#> Zsivoczky    0.4715533 -0.9267436  1.0812163 0.2190667  0.7883854
#> Hernu        0.2763118 -1.1657260  1.4352654 0.4666709  1.0465457
#> Bernard      1.3672590 -1.4780354  4.0539857 0.6274807  2.9560256
#> Schwarzl    -0.7102777  0.6584251  0.9380181 0.2170229  0.6839702
#> Pogorelov   -0.2143524  0.8610557  0.7873639 0.1337231  0.5741185
#> Schoenbeck  -0.4953166  1.3000530  1.9354762 0.5291161  1.4112821
#> Barras      -0.3158867 -0.8193681  0.7711485 0.1466237  0.5622947

# Correspondence Analysis
# ++++++++++++++++++++++++++
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")
library("FactoMineR")
data("housetasks")
res.ca <- CA(housetasks, graph = FALSE)
# Summarize row variables on axes 1:2
facto_summarize(res.ca, "row", axes = 1:2)[,-1]
#>                 Dim.1      Dim.2     coord      cos2    contrib
#> Laundry    -0.9918368  0.4953220 1.2290841 0.9245395 12.5556235
#> Main_meal  -0.8755855  0.4901092 1.0068569 0.9739621  8.9413526
#> Dinner     -0.6925740  0.3081043 0.5745869 0.9303433  3.6018327
#> Breakfeast -0.5086002  0.4528038 0.4637054 0.9051733  3.7680288
#> Tidying    -0.3938084 -0.4343444 0.3437401 0.9748275  2.4340753
#> Dishes     -0.1889641 -0.4419662 0.2310416 0.7642703  1.5153488
#> Shopping   -0.1176813 -0.4033171 0.1765136 0.8113088  1.2294289
#> Official    0.2266324  0.2536132 0.1156819 0.1194711  0.6445857
#> Driving     0.7417696  0.6534143 0.9771724 0.7672477  7.8836989
#> Finances    0.2707669 -0.6178684 0.4550760 0.9973464  2.9847396
#> Insurance   0.6470759 -0.4737832 0.6431778 0.8848140  5.1890738
#> Repairs     1.5287787  0.8642647 3.0841176 0.9326072 29.5364916
#> Holidays    0.2524863 -1.4350066 2.1229933 0.9921522 19.7157199
# Summarize column variables on axes 1:2
facto_summarize(res.ca, "col", axes = 1:2)[,-1]
#>                   Dim.1      Dim.2      coord      cos2   contrib
#> Wife        -0.83762154  0.3652207 0.83499601 0.9543242 29.079014
#> Alternating -0.06218462  0.2915938 0.08889388 0.1098815  1.310538
#> Husband      1.16091847  0.6019199 1.71003929 0.9795683 37.815957
#> Jointly      0.14942609 -1.0265791 1.07619274 0.9979998 31.794491

# Multiple Correspondence Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mca <- MCA(poison, quanti.sup = 1:2, 
              quali.sup = 3:4, graph=FALSE)
# Summarize variables on axes 1:2
res <- facto_summarize(res.mca, "var", axes = 1:2)
head(res)
#>              name      Dim.1       Dim.2      coord      cos2   contrib
#> Nausea_n Nausea_n  0.2673909  0.12139029 0.08623348 0.3090033  1.319847
#> Nausea_y Nausea_y -0.9581506 -0.43498187 1.10726185 0.3090033  4.729453
#> Vomit_n   Vomit_n  0.4790279 -0.40919465 0.39690803 0.5953620  4.662117
#> Vomit_y   Vomit_y -0.7185419  0.61379197 0.89304306 0.5953620  6.993176
#> Abdo_n     Abdo_n  1.3180221 -0.03574501 1.73845988 0.8457372 11.138239
#> Abdo_y     Abdo_y -0.6411999  0.01738946 0.41143974 0.8457372  5.418603
# Summarize individuals on axes 1:2
res <- facto_summarize(res.mca, "ind", axes = 1:2)
head(res)
#>   name      Dim.1       Dim.2     coord       cos2   contrib
#> 1    1 -0.4525811 -0.26415072 0.2746052 0.46457063 1.0751792
#> 2    2  0.8361700 -0.03193457 0.7002000 0.55670644 2.7415373
#> 3    3 -0.4481892  0.13538726 0.2192032 0.59815656 0.8582602
#> 4    4  0.8803694 -0.08536230 0.7823370 0.75476958 3.0631335
#> 5    5 -0.4481892  0.13538726 0.2192032 0.59815656 0.8582602
#> 6    6 -0.3594324 -0.43604390 0.3193260 0.06143111 1.2502771

# Multiple factor Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
               name.group=c("desc","desc2","symptom","eat"),
               num.group.sup=1:2, graph=FALSE)
# Summarize categorcial variables on axes 1:2
res <- facto_summarize(res.mfa, "quali.var", axes = 1:2)
head(res)
#>              name      Dim.1        Dim.2     coord      cos2   contrib
#> Nausea_n Nausea_n  0.2995559 -0.008263233 0.0898020 0.5679634 0.6601587
#> Nausea_y Nausea_y -1.0734086  0.029609918 1.1530827 0.5679634 2.3655688
#> Vomit_n   Vomit_n  0.4923055 -0.335833158 0.3551486 0.7818420 2.4633487
#> Vomit_y   Vomit_y -0.7384582  0.503749737 0.7990843 0.7818420 3.6950230
#> Abdo_n     Abdo_n  1.4594717 -0.253368918 2.1942534 0.9439283 6.8916745
#> Abdo_y     Abdo_y -0.7100132  0.123260555 0.5193120 0.9439283 3.3527065
# Summarize individuals on axes 1:2
res <- facto_summarize(res.mfa, "ind", axes = 1:2)
head(res)
#>   name      Dim.1       Dim.2     coord       cos2   contrib
#> 1    1 -0.8980293 -0.19968268 0.8463298 0.37413632 0.6692610
#> 2    2  1.6550439 -0.41095346 2.9080530 0.42074506 2.2996311
#> 3    3 -0.8673037  0.09906989 0.7620305 0.51312594 0.6025988
#> 4    4  1.7839172 -0.56856945 3.5056316 0.66185891 2.7721845
#> 5    5 -0.8673037  0.09906989 0.7620305 0.51312594 0.6025988
#> 6    6 -1.1229099 -1.07440938 2.4152822 0.06519297 1.9099576
```
