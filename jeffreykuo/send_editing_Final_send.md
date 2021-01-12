**An integrated curvature surface inspection and prediction system for
5-axis synchronization machining**

**Abstract**

There is an urgent demand for free form products in industry nowadays because 
of their superior appearance and the wide variety of functions they 
perform. Five-axis high-speed CNC
machining technology has developed to satisfy this demand, but further 
improvement in surface
quality metric inspection technology is the big challenge it now faces.

In this study, the effects of jerks on the performance of five-axis
synchronous high-speed CNC ball nose end mills on a freeform turbine mold
were investigated. The relationships of characteristics of the images of 14 jerk-cluster finished workpieces with
the different jerk setting values were established, allowing surface texture
features to be analyzed and surface roughness predicted. In addition, machine learning
methods were integrated with the surface feature analysis to construct a virtual machining module that
acts as a performance prediction system, merged with the virtual
machine tool functions, surface texture processor and AI roughness
prediction processor. Using the geometric information of the workpiece,
cutting parameters and machine tool parameters as inputs, product
performance metrics combining surface roughness and machining time can
be predicted as outputs of the system.

The integrated system provides users with a way to evaluate
manufacturing performance before performing actual operations and to
reduce test time for cutting parameter development. The model is
suitable for complex surface finishes as well as for the production of
small batches with high parametric variance. In addition, the partial
set of image processing and roughness prediction modules can be used
alone as an effective intelligent surface quality inspection system.

**Keywords**: surface inspection and prediction system, image
processing, machine learning, jerk, synchronization machining

**1. Introduction**

There are two main practical problems that engineers face in the
manufacturing process: to determine the values of the process
parameters that will yield the desired product quality \[1,2\] and to
maximize manufacturing system performance using the available resources
\[3,4\]. With respect to the latter, industry nowadays has entered
into a phase that focuses on customized, small batches and high
parametric variance production, pursued alongside traditional mass-production.
Therefore, the inspection of the finished product can no longer be
carried out individually on a case-by-case basis, but must be replaced by simple
generalized methods that are flexible and can be completed quickly.

From the product development flow and manufacturing process chain shown
in Fig. 1, where workpiece geometry can be parametrically deﬁned in
CAD/CAM computer code, the tool path can also be generated for given
dimensions of a tool according to the desired sequences of machining.
The engineer is responsible for selecting tools, feedrates, and speeds
to generate the tool paths according to the process planning strategy
for the kinematic machining operation \[5\]. The dynamic accuracy of
machine tools is determined by the feed-axis acceleration required to
produce precise movement between the workpiece and tool \[6,7\].

![](media/image1.png){width="5.328125546806649in"
height="1.698086176727909in"}

Fig 1. Product development flow and manufacturing process chain diagram
\[7\]

The purpose of free-form surface machining is to perform complex shapes
to and meet a given level of quality while minimizing machining time,
particularly in aerospace and automobile industry \[8,9\]. There is
literature focusing on speed optimization for machining, and in these
works, the jerk setting has a significant impact on the machining time
as well as the quality of the machining, especially for multi-axis
machining applications \[10,11\]. Barre et al. \[12\] concluded that the
jerk selection could have a significant effect on vibration amplitude
and time of movement. Zhang et al. \[13\] mentioned that frequent
acceleration and deceleration leads to reduced machining efficiency and
that acceleration and impact also oscillate, eventually leading to
severe vibration and poorer surface textures. Tulsyan and Altintas
\[14\] pointed out while the five-axis CNC machine tool followed the
sequence tool path command, the driving parts would have velocity,
acceleration and jerk discontinuities at transition points. These
discontinuities result would lead to poor surface quality. From these
studies, the jerk value assigned would have a relationship with the
surface quality. Therefore, the error caused by CNC machine motion will
be projected onto the machined surface, especially in the machining of
molds and dies \[15\].

However, it is a big challenge to measure the surface quality of a free
form mold, even when the setting and effect of jerk is known. Surface
roughness inspection is one of the essential quality control processes
designed to ensure that parts are manufactured to a specific requirement
\[16,17\]. Since the process mechanism of surface quality is composed of
numerous uncontrollable and nonlinear factors, an accurate predictive
model is in need \[18\]. Through the texture analysis techniques,
texture parameters could be used to evaluate surface roughness using
various predictive modeling methods. With the growing demand for
industrial automation in the manufacturing sector, machine vision plays
an important role in quality inspection and process monitoring \[19\].
Many researchers used image recognition technology to classify the
surface \[20\]. Cuka et al. \[21\] develop a vision-based end-milling
metal surface roughness evaluation system that could perform surface
texture evaluation. Joshi and Patil \[22\] reviewed recent advances in
machine vision-based evaluation of surface roughness using texture
analysis techniques and predictive modeling.

Machine learning has advanced rapidly not only in terms of promising
results but also in terms of usability, as it promises to answer many
new manufacturing challenges \[23,24\]. Some scholars combine these
newly developed technologies to model and predict the surface roughness
\[25\]. Zhu and Brilakis \[26\] developed an artificial neural network
(ANN) model for analyzing and predicting the relationship between
cutting conditions and fractal parameters of the corresponding machined
surface to obtain a specific surface roughness profile geometry.
Asiltürk and Çunkaş \[27\] used multiple regression and artiﬁcial neural
network approaches to predict the surface roughness, the conclusion is
that ANN is a powerful tool in predicting the surface roughness. Patel
et al. \[28\] used the gray level co-occurrence matrix (GLCM) to extract
the graphic texture characteristics of the end milling surface. From the
experimental results, the author points out using machine learning
algorithms to extract features from the GLCM had potential industrial
applications. Morala-Argüello et al. \[29\] proposed a multi-resolution
method based on surface image processing for visual quality inspection
and surface roughness identification during turning. The error rate of
the proposed method is between 2.59% and 4.17%.Özel and Karpat \[30\]
used neural network modeling to predict the surface roughness and tool
blade wear during the entire machining time under various cutting
conditions when completing hard turning. Compared with the regression
model, it is found that the predictive neural network model can better
predict the surface roughness within its training range. Zain et al.
\[31\] proposed an Artificial Neural Network (ANN) model for predicting
surface roughness performance during processing. Research results show
that the most influential decision-making variables are cutting speed,
feed rate and cutting depth. This study also proved that by using
available experimental data, accurate result values ​​of predictive
performance metrics can be obtained through a small number of training
and testing samples. Ramesh et al. \[32\] used SVM to predict the
surface roughness of end mills on 6061 aluminum. Using feed speed,
spindle speed, and cutting depth as input to predict surface roughness,
the model has an error of 8.34%. Kayabaşi and Ertürk \[33\] carried out
an experimental design based on the four variables of cutting speed,
feed per tooth, cutting part and cutting width, using three-axis
vibration signals as input signals, and proposed a probabilistic model
developed by a real-time surface roughness prediction system, The
probability model shows an accuracy rate as high as 96.37%

After reviewing the literature, machine learning methods with image
recognition can successfully build predictive models of surface
roughness with great practical and be adapted for different
applications. However, most of the research had focused on plain
machining techniques, such as turning, milling. In free-form mold
surfaces that are milled by a high speed five-axis machine tool, it is a
critical issue to measure the roughness of all regions due to the
complex and various curvature topology characteristics. The purpose of
this study is to develop an approach system that could be used to
predict the manufacturing system performance (roughness and machining
time) for various surfaces with the cutting parameters affected by the
axis synchronization due to jerk's selection.

**2. Methodology & method**

**2.1 Analysis of the manufacturing process**

To conduct the manufacturing process analysis, the relationship between
the input/output and the activity components is shown in Fig. 2. And to
overcome the challenge of system development, the process was split into
two parts:

Part 1：Surface texture feature & roughness prediction. The strategy is
to get image texture features of the workpiece firstly, and then to
build-up the surface roughness prediction processor.

Part 2: Virtual machine tool & surface texture. For wide application,
the prediction system also developed a virtual machine tool module to
simulation machine

processing for total machine time and surface texture feature
prediction.

![](media/image2.png){width="5.741666666666666in"
height="1.7638888888888888in"}

Fig. 2(a) Manufacturing Process Flow Diagram of Part 1

![](media/image3.png){width="5.741666666666666in"
height="2.1805555555555554in"}

Fig. 2(b) Manufacturing Process Flow Diagram of Part 2

**2.2 Prediction kernel function development**

Machine learning and statistics analysis methods were introduced to
establish modules with non-linear kernel functions in the manufacturing
process diagram (Fig 2).

\(1\) Artificial Neural Network (ANN) architecture \[31,34\]

Compared with traditional complex modeling techniques, neural network
systems provide another way for analyzing data through training. This
neural network architecture is often used in prediction, control, system
identification, model building, medicine, and computer vision.
Artificial neural networks use nonlinear functions as learning kernels,
with the weighted output of multiple neurons feeding into more layers.
These multi-layer networks are connected in sequence to increase the
learning accuracy. An example of a single layer neuron architecture is
shown in Fig. 3:

![](media/image4.png){width="2.088542213473316in"
height="1.3257699037620299in"}![](media/image5.png){width="2.213542213473316in"
height="0.41095253718285213in"}

Fig .3 A single layer of neuron \[35\]

Each neuron received total input from the sum of the previous layers as

  -- -------
     \(1\)
  -- -------

where is the multiplication operations with R length input vector, is
the weight matrix with size SxR, while *b* and *a* are the bias vector
and output respectively with S length.

Since neural networks are nonlinear by nature and consist of multiple
inputs and multiple outputs, they are suitable to model complex
nonlinear systems. In this study, we use these principles to establish
the textural features of the surface pattern obtained from the input of
the cutting conditions and also to estimate the surface profile,
established from texture features. In addition to these model outputs,
the actual machining time can also be used in such a way that a
predictive model of the time is obtained after training of the input
machining conditions and parameters.

\(2\) The image processing module

The image processing method would be used to extract the characteristics
of the workpiece surface and establish the relationship between image
characteristics and surface roughness. To analysis the detailed
information and the texture inside of images, GLCM has been used to
quantitatively evaluate textural parameters. The definition of GLCM has
described in \[36\]. The cutting mechanism would be left tool marks
(scallops and cusps) on the surface \[37\], these marks with varying
height level could be the most significant source of information for
texture analysis. From the basic optic principle, the bright areas
correspond to the light reflected from geometric shapes, and could be
represented as the surface roughness pattern or features. In order to
obtain detailed classification, we can use deep learning to observe the
final results and obtain useful analysis results. A 56 layers with
ResNet architecture convolutional neural network (CNN) which developed
in Python v3 on Google collaboratory has been used to train and
classified different images in four regions and the classified accuracy
is 93.35%. The tool would left marks on the surface after machining,
which is the features composed by scallops and cusps textures and would
be related to surface roughness. If the parameter is unmatched, it would
lead to non-synchronization machining and have worse surface. From the
Grad-Cam and heat-map result, it could have some distinctive feature
could be observed:

\(1\) Because the tool used for cutting is a ball-end mill tool, this
tool is characterized by symmetry. If the surface traces after cutting
have more symmetric traces, this combination of parameters is suitable.
Fig.4 are some images in zone1 could observe this phenomenon.

+----------------------------------+----------------------------------+
| ![](media/image9.p               | ![](media/image9.p               |
| ng){width="2.6569444444444446in" | ng){width="2.5705129046369204in" |
| height="1.3331080489938758in"}   | height="1.3005752405949256in"}   |
|                                  |                                  |
| \(a\) A simple with 2.180 μm     | \(b\) A simple with 2.399μm      |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image10.               | ![](media/image10.p              |
| png){width="2.608974190726159in" | ng){width="2.5897430008748907in" |
| height="1.3027088801399824in"}   | height="1.2971719160104986in"}   |
|                                  |                                  |
| \(c\) A simple with 2.317 μm     | \(d\) A simple with 2.333μm      |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig .4 Some surface image with heat-map result in zone1

\(2\) When the cutting effect has obvious and uniform light and dark
distribution, it means that the tool is processing on a good match. If
the axial match is not good, the residual traces of the tool will appear
asymmetrical, or it will not be able to maintain a uniform state. Fig. 5
are some images in zone 2 could observe this phenomenon.

+----------------------------------+----------------------------------+
| ![](media/image11.p              | ![](media/image11.               |
| ng){width="2.5247801837270343in" | png){width="2.492959317585302in" |
| height="1.2678947944007in"}      | height="1.2618055555555556in"}   |
|                                  |                                  |
| \(a\) A simple with 2.137 μm     | \(b\) A simple with 2.445μm      |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image12.               | ![](media/image12.               |
| png){width="2.569996719160105in" | png){width="2.505932852143482in" |
| height="1.2840277777777778in"}   | height="1.2662926509186352in"}   |
|                                  |                                  |
| \(c\) A simple with 2.317μm      | \(d\) A simple with 2.333μm      |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig .5 Some surface image with heat-map result in zone2

> \(3\) Another phenomenon of poor matching is the appearance of
> continuous long streaks. When processing curved workpieces, the tool
> will maintain a fixed angle with the surface tangent, so the trace
> will be discontinuous in the area where the curvature changes. When
> the shaft is not well matched, the tool cannot maintain a fixed angle
> with the cutting table and will offset, which makes the tool too deep
> to produce continuous marks. Fig. 6 could observe this phenomenon. The
> red rectangle are shows where the connected line of quiescent points

+----------------------------------+----------------------------------+
| ![](media/image13.p              | ![](media/image13.p              |
| ng){width="2.6217957130358704in" | ng){width="2.5705129046369204in" |
| height="1.2963593613298339in"}   | height="1.2662871828521436in"}   |
|                                  |                                  |
| \(a\) A simple with 2.193 μm     | \(b\) A simple with 2.393 μm     |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image14.p              | ![](media/image14.               |
| ng){width="2.7048392388451443in" | png){width="2.672222222222222in" |
| height="1.336111111111111in"}    | height="1.336097987751531in"}    |
|                                  |                                  |
| \(c\) A simple with 2.313 μm     | \(d\) A simple with 2.360 μm     |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig .6 Some surface image with heat-map result in zone3 and zone 4

For more clearly to classify these image, the gray level would an
important factor to distinguish the features. Therefore, the color model
used is the HSV model since it provides the value of brightness as input
as opposed to grayscale, with a combination of six textural features to
be selected for inspecting.

To get the texture information, let be the th entry in the GLCM have
*N~x~* columns and *N~y~* rows. *Ng* stand for the levels of pixel. The
mean and standard deviations for the row and columns of the matrix are
shown below on Eq. (2) and (3):

  ----- -------
  ~,~   \(2\)
  ~,~   \(3\)
  ----- -------

Following are six features as defined in Eq.(4) to (9). These surface
texture features contain the unique machining characteristics and used
as the input to the roughness prediction processor.

\(a\) Correlation \[36,38\]:

  -- -------
     \(4\)
  -- -------

\(b\) Energy

  ------------------------------- -------
  ~where\ is\ the\ average\ of~   \(5\)
  ------------------------------- -------

\(c\) Homogeneity \[38\]

  -- -------
     \(6\)
  -- -------

\(d\) Sum entropy \[36\]

  -- -------
     \(7\)
  -- -------

\(e\) Sum variance \[36\]

  -- -------
     \(8\)
  -- -------

\(f\) Information measure of correlation \[36\]

  ------------ -------
  ~where\ ,~   \(9\)
  ------------ -------

**3. Experiment & discussion**

**3.1 Experiment equipment and device**

The purpose of this experiment is to evaluate the concept described in
section 2.2, that is, to develop a prediction model. A single turbine
vane mold shown in Fig. 7(a) is used for demonstration, which was
machining, testing, and verified in a 5-axis synchronous ball-end
milling. To compare the effect of jerk setting for each axis on the
roughness of the machined surface, four areas, marked as zone No. 1 to
4, were selected for the study. The 5-axis tool machine shown in Fig.
7(b) is a UX300 with Heidenhain controller (iTNC 530) made by Quasar. An
area scan camera has been selected for capturing the surface image. The
equipment used for this experimental test is listed in Table 1. The feed
rate and spindle speed are set to a constant of 7,000 mm/min and 11,500
rpm respectively. The shape of the cutting tool is assumed to be
constant during experimentation. The virtual model, image processing and
machine learning development environment is under the Matlab 2018b.

+-------------------------------------------+-------------------------+
| ![](media/image31.png){width="3.0in"      | ![](media/image32.jpeg) |
| height="1.6666666666666667in"}            |                         |
|                                           | \(b\) UX-300            |
| \(a\) Blade mold, color shows different   |                         |
| curvatures                                |                         |
+-------------------------------------------+-------------------------+

Fig. 7 The experiment mold and equipment

Table 1 The equipment information of the experiment

  ------------------------------- ---------------------------------------- ---------------------- -----------------------
  Machine                         UX300 (Quasar) with 5 axis( X,Y,Z,A,C)   Controller             iTNC 530 (Heidenhain)
  Rapid Traverse X/Y/Z (mm/min)   36,000/36,000/32,000                     Max. Speed A/C (rpm)   9,000/9,000
  Spindle Speed (rpm)             12,000                                   Tool type              Ball-end mill
  Mold type                       single turbine vane                      Mold material          6061 aluminum alloy
  Machining strategy              Layer-by-layer                           Mold dimension         96 x 17 x 25 mm
  Camera                          acA2500-14gm GigE (Basler)                                      
  ------------------------------- ---------------------------------------- ---------------------- -----------------------

**3.2 Data prepared**

Since the maximum jerk values set of each axis do not correspond to the
best surface quality, it needs to be balanced with other axis
performance. For comparison, 14 clusters with different jerk settings,
shown in Table 2, have been applied for the machining of the mold. The
molds information, from CAM, is represented as the distance between
every two set-points, which is the tool path segment. The average path
length of each axis is listed in Table 3.

> Table 2 The jerk values setting cluster

+---------+-----------+-----------+-----------+------------+------------+
| Cluster | X-axis    | Y-axis    | Z-axis    | A-axis     | C-axis     |
|         |           |           |           |            |            |
| No.     | (mm/s^3^) | (mm/s^3^) | (mm/s^3^) | (deg/s^3^) | (deg/s^3^) |
+---------+-----------+-----------+-----------+------------+------------+
| 1       | 10,000    | 8,000     | 10,000    | 15,000     | 15,000     |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+
|         |           |           |           |            |            |
+---------+-----------+-----------+-----------+------------+------------+

Table 3 Mold information -- axis average path length

  -------------- -------- -------- -------- --------
  Item           Zone 1   Zone 2   Zone 3   Zone 4
  X-axis (mm)                               
  Y-axis (mm)                               
  Z-axis (mm)                               
  A-axis (deg)                              
  C-axis (deg)                              
  -------------- -------- -------- -------- --------

**3.3 Virtual model development**

Virtual model development, with a combination of machine learning and
image processing, consists of three parts:

\(a\) Image texture prediction model,

\(b\) Roughness prediction model, and

\(c\) Machining time estimation model.

Firstly, the subtle surface textures generated by unsynchronized motion
at different jerk values is verified to be recognizable by machine
learning and image processing techniques. Since these curvature zones
would have different features, a pre-classified filter would increase
the prediction accuracy. A total of 2520 surface images obtained from 4
different zones were used as input for classification, along with the
six textural features selected in the previous chapter 2.2. A confusion
matrix of the classified results is shown in Fig. . A total accuracy
99.5% gained from Support Vector Machine (SVM) \[39\] validation.

![](media/image33.png){width="2.503838582677165in"
height="2.4444444444444446in"}

Fig. 8 The SVM classified result

Convolutional Neural Networks (CNN) \[40\] are very useful in the
classification and recognition of images. As a result of CNN\'s
classification, Table 4 shows that there are indeed unique features in
the images that can be used as a basis for classification.

Table 4 The CNN result

  ---------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                   Cluster_5 in zone 1                                                                                                                                                                Cluster_14 in zone 1                                                                                                                                                               Cluster_5 in zone 2
  Original Image   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-111-20.jpg](media/image34.jpg){width="1.0444444444444445in" height="1.0444444444444445in"}   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-121-33.jpg](media/image35.jpg){width="1.0416666666666667in" height="1.0416666666666667in"}   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-121-33.jpg](media/image35.jpg){width="1.0416666666666667in" height="1.0416666666666667in"}
  Feature1         ![](media/image36.png){width="1.1146248906386702in" height="1.1020297462817148in"}                                                                                                 ![](media/image37.png){width="1.0826771653543308in" height="1.0826771653543308in"}                                                                                                 ![](media/image38.png){width="1.062992125984252in" height="1.0826771653543308in"}
  Feature2         ![](media/image39.png){width="1.078740157480315in" height="1.0826771653543308in"}                                                                                                  ![](media/image40.png){width="1.0826771653543308in" height="1.0826771653543308in"}                                                                                                 ![](media/image41.png){width="1.0748031496062993in" height="1.0826771653543308in"}
  ---------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Compared with the results of CNN and SVM, which means the machining
characteristics will leave typical marks on the surface, these texture
features could be identified as a surface result after each jerk cluster
operated. Using the six textural features in this study is sufficient to
demonstrate the classified ability.

**(a) Image texture prediction model**

In this study, based on industry operation, a commercial controller was
used, and one parameter group setting for the 5-axis at once during the
machining. 14 geometrically identical blade molds were used with 14 jerk
setting clusters (Table 2) and manufactured for further inspection. From
research \[7\], the path length is known to affect the machining
performance. Without loss general, the mold has been separated into four
zones (Fig. 4(a)) with varying curvature contour and path lengths (Table
3) were be considered as all input parameters. Therefore the input
parameters for the workpiece manufacture include jerk values of each
axis, the average path length of each zone average, cutting tool feed
rate, spindle rotation speed of tool, and output of the six image
textures from image processing. An example of these surface images is
shown in Fig. 9.

+----------------------+----------------------+----------------------+
| ![](media/i          | > ![](media/i        | > ![](media/i        |
| mage42.png){width="1 | mage43.png){width="1 | mage44.png){width="1 |
| .2846041119860017in" | .2183486439195101in" | .2140518372703413in" |
| height="1.           | > height="1.         | > height="1.         |
| 3235312773403325in"} | 2183486439195101in"} | 2075590551181103in"} |
|                      |                      |                      |
| (a) Original surface | (b) Training data    | (c) Training data    |
|     > image          |     > image-1        |     > images-2       |
+----------------------+----------------------+----------------------+

Fig. 9 Some example of machining surface image

The parameters and architecture were shown in Fig. 10. A total of 2016
surface image samples from 14 molds have been used as training data and
504 samples used as a validation test, each jerk setting cluster has 45
samples. The result of the validation test is shown in Table 5.

![](media/image45.png){width="4.4533409886264215in"
height="2.1302088801399823in"}

Fig.10 The image texture prediction model structure

Table 5 The image texture prediction model result

  ------------------------------------ -------------------
  Output result                        Predict error (%)
  Correlation                          0.317
  Energy                               0.839
  Homogeneity                          0.367
  Sum entropy                          2.698
  Sum variance                         2.063
  Information measure of correlation   0.400
  ------------------------------------ -------------------

**(b) Roughness prediction model**

To get the final roughness value, the six features from GLCM were used
as inputs. 2016 samples were used as training data and 504 samples were
used in validation. The parameters and neural net architecture are shown
in Fig. 11, while Table 6 summarizes the measured and predicted values
of Zone 1. The average prediction error is only 0.272%.

![](media/image46.png){width="5.084866579177603in"
height="2.432292213473316in"}

Fig. 11 The roughness prediction model structure

> **Table 6 The roughness measured/predicted values**

+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| Item  | Zone  | Zone  | Zone  | Zone  |       |       |       |       |
|       | 1     | 2     | 3     | 4     |       |       |       |       |
| Group |       |       |       |       |       |       |       |       |
+=======+=======+=======+=======+=======+=======+=======+=======+=======+
|       | Pred  | Mea   | Pred  | Mea   | Pred  | Mea   | Pred  | Mea   |
|       | icted | sured | icted | sured | icted | sured | icted | sured |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
| 1     | 2.230 | 2.230 | 2.749 | 2.750 | 2.367 | 2.370 | 2.141 | 2.130 |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+
|       |       |       |       |       |       |       |       |       |
+-------+-------+-------+-------+-------+-------+-------+-------+-------+

**(c) Machining time estimation model**

For the machining time estimate, the model used the total tool path
length instead of separating the path length in each zone. The total
path length data can be calculated from CAM. Additionally, the output is
a single metric for machining time. The parameters and neural net
architecture are shown in Fig. 12. The actual and estimated machining
times are shown in Table 7 with an average error of -0.472%.

![](media/image47.png){width="4.213542213473316in"
height="2.061136264216973in"}

Fig. 12 The machining time estimation model structure

> Table 7 Machining time estimated model result

  ------------- -------------------- ------------------- -----------
  Cluster No.   Predicted time (s)   Measured time (s)   Error (%)
  1             1656.8               1663                -0.37
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
  ------------- -------------------- ------------------- -----------

**3.4 Summary and discussions**

The results of this experiment show:

1\. The cutting mechanism leaves tool marks (scallops and cusps). The
surface texture of the workpiece can truly represent the parameter
changes of the machining process, typically the effect of the jerk
setting value. According to SVM and CNN results, the six selected
texture features would be significant characteristics of the image.

2\. The training data included four different curvature zones, which
could be simulated as a practical case that included various contour
surfaces. This approach system could predict the surface roughness with
14 groups of jerk settings in all zones. The image texture
characteristics of the workpiece surface can be predicted from the input
including the information about the workpiece, dynamic parameters of the
machine, and cutting conditions. Surface roughness can be estimated from
the texture characteristics of the workpiece surface. Also, the
processing time required can be estimated from the input processing
conditions. The final average estimated performances are only 0.272% and
-0.472% error rate for the roughness and machining time especially.

3\. To summarize the function of this study, an integrated system for
manufacturing performance prediction would be proposed as shown in Fig
10. The real high-speed 5-axis machining system (in Fig 2) can be
replaced with a virtual machine tool module. We have successfully
demonstrated the integrated prediction system with the input: workpiece
information, cutting parameters and machine tool parameter, as this
experiment. And the output: predicted roughness, compared with the
measured data were shown in Table 8. The predicted machining time and
actual values were the same as in Table 7. An additional branch of the
system is the roughness prediction module combined with surface texture
processor can be used as an independent module for surface quality
inspection system while surface images of a workpiece are available.

4\. Additionally, it can be observed from CNN\'s feature map analysis
that different jerk value settings can produce different higher-level
patterns deeper in the network. As shown in the pictures in Table 4, the
same area of concern will have different features, with variations that
represent the jerk indeed giving rise to different textural features.
Equivalent jerk settings will have similar feature images, proving again
that jerk is an important parameter that affects surface texture during
synchronous machining. The results of this study and the comparison with
other literatures on the surface roughness prediction system were listed
in Table 9.

![](media/image48.png){width="5.741666666666666in"
height="2.3472222222222223in"}

Fig. 10 Integrated Performance Prediction System Diagram

Table 8 Roughness value predicted/measured results

  ------------ ---------------- --------------- -----------
  Cluster No   Predicted (μm)   Measured (μm)   Error (%)
  1            2.339            2.370           -1.317
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
  ------------ ---------------- --------------- -----------

Table 9 Comparison with the results of other surface roughness
prediction systems

+-------------+-------------+-------------+-------------+-------------+
| Item        | Ma          | Predictive  | Input       | Prediction  |
|             | nufacturing | model       | parameters  | error       |
| Researcher  |             | a           |             |             |
|             | (Material)  | rchitecture |             |             |
+=============+=============+=============+=============+=============+
| Xie\[41\],  | Turning     | SVM+PSO     | Spindle     | 4.86％      |
| 2018        |             |             | speed,      |             |
|             |             |             | Cutting     |             |
|             |             |             | depth,      |             |
|             |             |             | Feedrate,   |             |
|             |             |             | Cutting     |             |
|             |             |             | energy      |             |
+-------------+-------------+-------------+-------------+-------------+
| Sek         | Plane       | Grey Wolf   | Spindle     | 10.42%      |
| ulic\[42\], | milling     | Optimizer   | speed, Feed |             |
| 2018        | (hardened   | (GWO) model | per tooth,  |             |
|             | steel       |             | Axial       |             |
|             | X210CR12)   |             | depth,      |             |
|             |             |             | Depth of    |             |
|             |             |             | cut         |             |
+-------------+-------------+-------------+-------------+-------------+
| Kaya        | Plane       | Pr          | 3-axis      | 3.63%       |
| başi\[33\], | milling,    | obabilistic | (XYZ)       |             |
| 2019        |             | model       | vibration   |             |
|             | (Aluminum   |             | signal      |             |
|             | alloy)      |             |             |             |
+-------------+-------------+-------------+-------------+-------------+
| Ngern       | Face        | Fuzzy       | Chip        | 6.55%       |
| tong\[43\], | milling     | control     | continuity, |             |
| 2020        |             |             | Chip        |             |
|             | (Aluminum   |             | d           |             |
|             | 7075-T6)    |             | eformation, |             |
|             |             |             | Chip        |             |
|             |             |             | thickness   |             |
+-------------+-------------+-------------+-------------+-------------+
| Ma          | Plane       | Adaptive    | Feed speed, | 7.01%       |
| rani\[44\], | milling     | ne          | Cutting     |             |
| 2020        |             | twork-based | speed,      |             |
|             | (Al-20      | fuzzy       | Particle    |             |
|             | Mg2Si metal | inference   | size        |             |
|             | matrix      | systems     |             |             |
|             | composite)  | (ANFISs)    |             |             |
+-------------+-------------+-------------+-------------+-------------+
| Beem        | Turning     | ANFIS       | Skewness,   | 9.71%       |
| araj\[45\], |             |             | kurtosis,   |             |
| 2020        | (Aluminum   |             | Mean,       |             |
|             | 6063)       |             | Variance,   |             |
|             |             |             | Contrast,   |             |
|             |             |             | Energy      |             |
+-------------+-------------+-------------+-------------+-------------+
| P           | Turning     | Linear      | Dis         | 0.358%      |
| atel\[46\], |             | regression  | similarity, |             |
| 2020        | (low        | analysis    | Energy      |             |
|             | carbons     |             | Entropy,    |             |
|             | steel)      |             | H           |             |
|             |             |             | omogeneity, |             |
|             |             |             | Maximum     |             |
|             |             |             | p           |             |
|             |             |             | robability, |             |
|             |             |             | Sum         |             |
|             |             |             | entropy,    |             |
|             |             |             | Difference  |             |
|             |             |             | varianc,    |             |
|             |             |             | Difference  |             |
|             |             |             | entropy,    |             |
|             |             |             | Inverse     |             |
|             |             |             | difference  |             |
|             |             |             | normalized  |             |
+-------------+-------------+-------------+-------------+-------------+
| This        | Free-form   | SVM+ANN     | C           | 0.272%      |
| research-   | milling     |             | orrelation, |             |
|             |             |             | Energy,     |             |
| Image       | (Aluminum   |             | H           |             |
| prediction  | 6061)       |             | omogeneity, |             |
| module      |             |             | Sum         |             |
|             |             |             | entropy,    |             |
|             |             |             | Sum         |             |
|             |             |             | variance,   |             |
|             |             |             | Information |             |
|             |             |             | measure of  |             |
|             |             |             | correlation |             |
+-------------+-------------+-------------+-------------+-------------+
| This        | Free-form   | ANN         | Axis jerk,  | 0.730%      |
| research-   | milling     |             | axes path   |             |
|             |             |             | length,     |             |
| Integrated  | (Aluminum   |             | feed speed, |             |
| forecasting | 6061)       |             | spindle     |             |
| module      |             |             | speed       |             |
+-------------+-------------+-------------+-------------+-------------+

**4. Conclusion**

Surface images of scallops and cusps captured from the 14 clusters
workpieces caused by the different jerk affect in 5-axis synchronization
machining have been studied. Image processing technology and machine
learning are used to evaluate the manufacturing performance (roughness
and machining time).

An integrated system constituted with virtual machine tool module, image
processing module and roughness prediction module has been developed.
This system has been demonstrated good pre-assessment and quality
inspection ability. It can provide users with the best choice of
parameter adjustment, processing time estimation and to estimate the
quality of the surface before real machining. It also can provide users
to consider the balance requirements between the processing time and the
need for surface quality in the industry application.

# 
