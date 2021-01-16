**An integrated curvature surface inspection and prediction system for
5-axis synchronization machining**

**Abstract**

There is an urgent demand for free form products in industry at the present time because 
of their superior appearance and the wide variety of functions they 
perform. Five-axis high-speed CNC
machining technology has developed to satisfy this demand, but further 
improvement in surface
quality metric inspection technology is the big challenge it now faces.

In this study, the effects of jerk on the performance of five-axis
synchronous high-speed CNC ball nose end mills on a freeform turbine mold
were investigated. The relationships of characteristics of the images of 14 jerk-cluster finished workpieces with
different jerk setting values were established, allowing surface texture
features to be analyzed and surface roughness predicted. In addition, machine learning
methods were integrated with the surface feature analysis to construct a virtual machining module that
acts as a performance prediction system, merging the virtual
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

As part of the product development flow and manufacturing process chain, as shown
in Fig. 1, workpiece geometry can be parametrically defined in
CAD/CAM computer code, and the tool path can also be generated for given
dimensions of a tool according to the desired sequences of machining.
The engineer is responsible for selecting tools, feedrates, and speeds
to generate the tool paths according to the process planning strategy
for the kinematic machining operation \[5\]. The dynamic accuracy of
machine tools is determined by the feed-axis acceleration required to
produce precise movement between the workpiece and tool \[6,7\].

![](media/image1.png){width="5.328125546806649in"
height="1.698086176727909in"}

Fig. 1 Product development flow and manufacturing process chain diagram
\[7\]

The purpose of free-form surface machining is to perform the cutting of complex shapes
to a given level of quality and to meet that level of quality while minimizing machining time,
particularly in the aerospace and automobile industry \[8,9\]. There is
literature focusing on speed optimization for machining, and there
it is pointed out that jerk settings have a significant impact on machining time
as well as the quality of the machining, especially for multi-axis
machining applications \[10,11\]. Barre et al. \[12\] concluded that
jerk selection could have a significant effect on vibration amplitude
as well as time of movement. Zhang et al. \[13\] noted that frequent
acceleration and deceleration leads to reduced machining efficiency and
the acceleration and impact oscillation that is produced also eventually results in
severe vibration and poorer surface textures. Tulsyan and Altintas
\[14\] pointed out while the five-axis CNC machine tool follows the
sequence tool path command, the driving parts have velocity,
acceleration and jerk discontinuities at transition points, and these
discontinuities lead to poor surface quality. From these
studies, it can be seen the jerk values assigned to a job have a relationship with the
surface quality of the result. And, the errors caused by CNC machine motion will
be projected onto the machined surface, especially important in the machining of
molds and dies \[15\].

Surface roughness inspection is an essential quality control process
undertaken to ensure that parts are manufactured to a specific requirement
\[16,17\]. However, measuring the surface quality of a free
form mold poses a big challenge, even when the jerk setting and its effect is known.
Since the process mechanisms determining surface quality are composed of
numerous uncontrollable and nonlinear factors, an accurate predictive
model is needed \[18\]. Using texture analysis techniques,
texture parameters could provide the data to evaluate surface roughness by means of
various predictive modeling methods. With the growing demand for
industrial automation in the manufacturing sector, machine vision plays
an important role in quality inspection and process monitoring \[19\].
Many researchers have used image recognition technology to classify
surfaces \[20\]. Cuka et al. \[21\] developed a vision-based end-milling
metal surface roughness evaluation system that could perform surface
texture evaluation. Joshi and Patil \[22\] have reviewed recent advances in
machine vision-based evaluation of surface roughness using texture
analysis techniques and predictive modeling.

Machine learning has advanced rapidly not only in terms of research
results but also in terms of usability, as it promises to answer many
new manufacturing challenges \[23,24\]. Some scholars combine these
newly developed technologies to model and predict surface roughness
\[25\]. Zhu and Brilakis \[26\] developed an artificial neural network
(ANN) model for analyzing and predicting the relationship between
cutting conditions and fractal parameters of the corresponding machined
surface to obtain specific surface roughness profile geometries.
Asiltürk and Çunkaş \[27\] used multiple regression and artificial neural
network approaches to predict surface roughness and concluded
that ANN is a powerful tool with high accuracy compared to multiple regression. Patel
et al. \[28\] used the gray level co-occurrence matrix (GLCM) to extract
graphic texture characteristics of the end milling surface. On the basis of their
experimental results, the authors suggested using machine learning
algorithms to extract features from the GLCM has potential industrial
applications. Morala-Argüello et al. \[29\] proposed the use of a multi-resolution
method based on surface image processing for visual quality inspection
and surface roughness identification during turning. The error rate of
the proposed method was between 2.59% and 4.17%. Özel and Karpat \[30\]
used neural network modeling to predict surface roughness and tool
blade wear during the entire machining process under various cutting
conditions when completing with hard turning. Compared with the regression
model, they found that the predictive neural network model could better
predict surface roughness within its training range. Zain et al.
\[31\] proposed an ANN model for predicting
surface roughness performance during processing. Their research results showed
that the most influential decision-making variables were cutting speed,
feed rate and cutting depth. This study also proved that using
available experimental data, accurate predictive
performance metrics can be obtained through a small number of training
and testing sessions. Ramesh et al. \[32\] used Support Vector Machine (SVM) methods to predict the
surface roughness of end mills on 6061 aluminum. Using feed speed,
spindle speed, and cutting depth as input to predict surface roughness,
the model had an error rate of 8.34%. Kayabaşi and Ertürk \[33\], adopting
an experimental design with the four variables of cutting speed,
feed per tooth, cutting part and cutting width and using three-axis
vibration signals as input, developed a probabilistic 
real-time surface roughness prediction system, with
an accuracy rate as high as 96.37%

After reviewing the literature, it can be seen machine learning methods incorporating image
recognition can successfully build predictive models of surface
roughness which are of great practical use and which are adaptable for use in different
applications. However, most of this research has focused on plain
machining techniques, such as turning or milling. In free-form mold
surfaces that are milled by a high speed five-axis machine tool, it is a
critical issue to measure the roughness of all regions due to their
complex and varied curvature topology characteristics. Thus, the purpose of
this study is to develop an approach system that could be used to
predict manufacturing system performance (roughness and machining
time) for various surfaces where cutting parameters are affected by
axis synchronization due to jerk selection.

**2. Methodology & methods**

**2.1 The manufacturing process analysis**

A diagram depicting the organization of the study's manufacturing process analysis and the relationship between
the input/output and activity components is shown in Fig. 2. To
overcome the challenge of system development, the process was split into
two parts:

Part 1: Surface texture feature & roughness prediction. The strategy was
to get image texture features of the workpiece first, and then to
build a surface roughness prediction processor.

Part 2: Virtual machine tool & surface texture. For wide application,
the prediction system also developed a virtual machine tool module to
simulate machine processing with total machine time and surface texture feature
prediction as outputs.

![](media/image2.png){width="5.741666666666666in"
height="1.7638888888888888in"}

Fig. 2(a) Manufacturing Process Flow Diagram of Part 1

![](media/image3.png){width="5.741666666666666in"
height="2.1805555555555554in"}

Fig. 2(b) Manufacturing Process Flow Diagram of Part 2

**2.2 Prediction kernel function development**

Machine learning and statistical analysis methods were introduced to
build modules with non-linear kernel functions, as seen in the manufacturing
process diagram (Fig. 2).

\(1\) Artificial Neural Network (ANN) architecture \[31,34\]

Compared with traditional complex modeling techniques, neural network
systems provide a more advanced way to analyze data through training. A
neural network architecture is often used in prediction, control, system
identification, model building, medicine, and computer vision systems.
Artificial neural networks use nonlinear functions as learning kernels,
with the weighted output of multiple neurons feeding into further layers.
The multi-layer networks are connected in sequence to increase
learning accuracy. An example of a single layer neuron architecture is
shown in Fig. 3:

![](media/image4.png){width="2.088542213473316in"
height="1.3257699037620299in"}![](media/image5.png){width="2.213542213473316in"
height="0.41095253718285213in"}

Fig. 3 A single neuron layer \[35\]

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
the actual machining time can also be modeled in the same way so that a
predictive model of the time taken is obtained after training of the input
machining conditions and parameters.

\(2\) The image processing module

The purpose of the image processing module is to extract the characteristics
of the workpiece surface and establish the relationship between image
characteristics and surface roughness. To analyze the detailed
information and the texture provided by images, a Gray-Level Co-Occurrence Matrix (GLCM) was used to
quantitatively evaluate textural parameters. The definition of GLCM is
described in \[36\]. The cutting mechanism leaves tool marks
(scallops and cusps) on the workpiece surface \[37\], and these marks, of varying
heights, are perhaps the most significant source of information for
texture analysis. From basic optic principles, the bright areas
correspond to light reflected from the geometric shapes,
representing surface roughness patterns or features. In order to
allow detailed classification, we used deep learning to observe the
final results and obtain useful analysis results. A 56-layer
ResNet architecture convolutional neural network (CNN) developed
in Python v3 on Google colaboratory was used to train and
classify different images in four workspace regions with a classification accuracy
of 93.35%.

In review, a tool leaves markings on the surface after machining,
the relevant feature of which is a texture composed of scallops and cusps, which 
is experienced as surface roughness. And if a cutting parameter is inappropriately set, it can
lead to unsynchronized machining and poor surfaces. Visualizing 
results with Grad-CAM and heat-maps allows some distinctive features
to be observed:

\(1\) Because the tool used for cutting is a ball-end mill tool, the surface traces it
leaves may be characterized by symmetry. If the surface shows
more symmetric traces, it indicates this combination of parameters is suitable.
Fig. 4 reproduces some images in zone1 where this phenomenon could be observed.

+----------------------------------+----------------------------------+
| ![](media/image9.png             | ![](media/image9.png             |
|   ){width="2.6569444444444446in" |   ){width="2.5705129046369204in" |
| height="1.3331080489938758in"}   | height="1.3005752405949256in"}   |
|                                  |                                  |
| \(a\) A sample with 2.180 μm     | \(b\) A sample with 2.399μm      |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image10.png            | ![](media/image10.png            |
|    ){width="2.608974190726159in" |   ){width="2.5897430008748907in" |
| height="1.3027088801399824in"}   | height="1.2971719160104986in"}   |
|                                  |                                  |
| \(c\) A sample with 2.317 μm     | \(d\) A sample with 2.333μm      |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig. 4 Some surface images with heat-map results in zone1

\(2\) When the surface trace has obvious and uniform light and dark
distributions, it means that the tool is processing on a good match. If
the axial match is not good, the residual traces of the tool will appear
asymmetrical, or will not be able to maintain a uniform state. Fig. 5
shows some images in zone 2 where this phenomenon could be observed.

+----------------------------------+----------------------------------+
| ![](media/image11.png            | ![](media/image11.png            |
|   ){width="2.5247801837270343in" |    ){width="2.492959317585302in" |
| height="1.2678947944007in"}      | height="1.2618055555555556in"}   |
|                                  |                                  |
| \(a\) A sample with 2.137 μm     | \(b\) A sample with 2.445μm      |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image12.png            | ![](media/image12.png            |
|    ){width="2.569996719160105in" |    ){width="2.505932852143482in" |
| height="1.2840277777777778in"}   | height="1.2662926509186352in"}   |
|                                  |                                  |
| \(c\) A sample with 2.317μm      | \(d\) A sample with 2.333μm      |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig. 5 Some surface images with heat-map results in zone2

> \(3\) Another phenomenon characteristic of poor matching is the lack of
> long continuous streaks. When processing curved workpieces, the tool
> will maintain a fixed angle with the surface tangent, so the trace
> will be discontinuous in areas where the curvature changes. When
> the shaft is not well matched, the tool cannot maintain a fixed angle
> with the cutting table and will offset, which means the tool will be too deep
> to produce a continuous trace. Fig. 6 shows an example of this phenomenon. The
> red rectangle indicates where a connected line of quiescent points appears.

+----------------------------------+----------------------------------+
| ![](media/image13.png            | ![](media/image13.png            |
|   ){width="2.6217957130358704in" |   ){width="2.5705129046369204in" |
| height="1.2963593613298339in"}   | height="1.2662871828521436in"}   |
|                                  |                                  |
| \(a\) A sample with 2.193 μm     | \(b\) A sample with 2.393 μm     |
| roughness                        | roughness                        |
+==================================+==================================+
| ![](media/image14.png            | ![](media/image14.png            |
|   ){width="2.7048392388451443in" |    ){width="2.672222222222222in" |
| height="1.336111111111111in"}    | height="1.336097987751531in"}    |
|                                  |                                  |
| \(c\) A sample with 2.313 μm     | \(d\) A sample with 2.360 μm     |
| roughness                        | roughness                        |
+----------------------------------+----------------------------------+

Fig. 6 Some surface images with heat-map results in zone3 and zone 4

To more clearly classify these images, the gray level would be an important factor
in a module distinguishing the above features. Therefore, the color model
adopted is the HSV model, not grayscale, since it provides a value for brightness, which is used as input to the module,
for the combination of six textural features
selected for study.

To get texture information, let be the th entry in a GLCM having
*N~x~* columns and *N~y~* rows. *Ng* stands for the number of levels of pixel. The
mean and standard deviations for the row and columns of the matrix are
shown below as Eq. (2) and (3):

  ----- -------
  ~,~   \(2\)
  ~,~   \(3\)
  ----- -------

Following are the six features, defined in Eq.(4) to (9). These surface
texture features contain unique machining characteristics and are used
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

The purpose of this experiment was to evaluate the concept described in
section 2.2, that is, the development of a prediction model. A single turbine
vane mold shown in Fig. 7(a) was used for demonstration purposes. It was
machined, tested, and verified by means of 5-axis synchronous ball-end
milling. To compare the effect of jerk setting for each axis on the
roughness of the machined surface, four areas, marked as zone No. 1 to
4, were selected for study. The 5-axis tool machine shown in Fig.
7(b) was a UX300 with Heidenhain controller (iTNC 530) made by Quasar. An
area scan camera was selected for capturing the surface image. The
equipment used for this experimental test is listed in Table 1. The feed
rate and spindle speed were set to a constant of 7,000 mm/min and 11,500
rpm respectively. The shape of the cutting tool was assumed to be
constant during experimentation. Work on the virtual model, image processing and
machine learning development environment took place under Matlab 2018b.

+-------------------------------------------+-------------------------+
| ![](media/image31.png){width="3.0in"      | ![](media/image32.jpeg) |
| height="1.6666666666666667in"}            |                         |
|                                           | \(b\) UX-300            |
| \(a\) Blade mold, color shows different   |                         |
| curvatures                                |                         |
+-------------------------------------------+-------------------------+

Fig. 7 The experiment mold and 5-axis tool machine

Table 1 The equipment of the experiment

  ------------------------------- ---------------------------------------- ---------------------- -----------------------
  Machine                         UX300 (Quasar) with 5 axes (X,Y,Z,A,C)   Controller             iTNC 530 (Heidenhain)
  Rapid Traverse X/Y/Z (mm/min)   36,000/36,000/32,000                     Max. Speed A/C (rpm)   9,000/9,000
  Spindle Speed (rpm)             12,000                                   Tool type              Ball-end mill
  Mold type                       single turbine vane                      Mold material          6061 aluminum alloy
  Machining strategy              Layer-by-layer                           Mold dimension         96 x 17 x 25 mm
  Camera                          acA2500-14gm GigE (Basler)                                      
  ------------------------------- ---------------------------------------- ---------------------- -----------------------

**3.2 Data prepared**

Since setting the jerk value on each of the five axes to the maximum jerk value for that axis does not yield the
best surface quality, settings on each axis need to be balanced with those on other axes for best
performance. For comparison purposes, 14 clusters each with different jerk settings,
shown in Table 2, were applied to the machining of the mold. Information about the
mold dimensions, from CAM, is represented as the distance between
every two set-points, which is the tool path segment. The average path
length on each axis is listed in Table 3.

> Table 2 The jerk value setting clusters

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

Table 3 Mold information -- average axis path length

  -------------- -------- -------- -------- --------
  Item           Zone 1   Zone 2   Zone 3   Zone 4
  X-axis (mm)                               
  Y-axis (mm)                               
  Z-axis (mm)                               
  A-axis (deg)                              
  C-axis (deg)                              
  -------------- -------- -------- -------- --------

**3.3 Virtual model development**

The virtual machining model development, combining machine learning and
image processing, consisted of three parts:

\(a\) Image texture prediction model,

\(b\) Roughness prediction model, and

\(c\) Machining time estimation model.

Firstly, the subtle surface texture differences generated by unsynchronized motion
at different jerk values were verified to be recognizable by machine
learning and image processing techniques. Since the curvature zones
were expected to have different features, a pre-classified filter was developed to increase
prediction accuracy. A total of 2520 surface images obtained from the 4
different zones were used as input for classification, along with the
six textural features noted in the previous section 2.2. A confusion
matrix of the classified results is shown in Fig. 8. A total accuracy
of 99.5% was gained from the Support Vector Machine (SVM) \[39\] validation.

![](media/image33.png){width="2.503838582677165in"
height="2.4444444444444446in"}

Fig. 8 The SVM classified results

Convolutional Neural Networks (CNN) \[40\] are very useful in the
classification and recognition of images. The results of the CNN
classification of the present study, as seen in Table 4, show that there are indeed unique features in
the images that can be used as a basis for classification.

Table 4 The CNN results

  ---------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                   Cluster_5 in zone 1                                                                                                                                                                Cluster_14 in zone 1                                                                                                                                                               Cluster_5 in zone 2
  Original Image   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-111-20.jpg](media/image34.jpg){width="1.0444444444444445in" height="1.0444444444444445in"}   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-121-33.jpg](media/image35.jpg){width="1.0416666666666667in" height="1.0416666666666667in"}   ![C:\\Users\\msi-1\\AppData\\Local\\Microsoft\\Windows\\INetCache\\Content.Word\\b-16-121-33.jpg](media/image35.jpg){width="1.0416666666666667in" height="1.0416666666666667in"}
  Feature1         ![](media/image36.png){width="1.1146248906386702in" height="1.1020297462817148in"}                                                                                                 ![](media/image37.png){width="1.0826771653543308in" height="1.0826771653543308in"}                                                                                                 ![](media/image38.png){width="1.062992125984252in" height="1.0826771653543308in"}
  Feature2         ![](media/image39.png){width="1.078740157480315in" height="1.0826771653543308in"}                                                                                                  ![](media/image40.png){width="1.0826771653543308in" height="1.0826771653543308in"}                                                                                                 ![](media/image41.png){width="1.0748031496062993in" height="1.0826771653543308in"}
  ---------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Combining the results of CNN and SVM, which show machining
characteristics will leave typifying marks on surfaces, texture
features could be identified through surface results after machining with each jerk cluster.
Using the six textural features in this study was sufficient to
demonstrate classification ability.

**(a) Image texture prediction model**

In this study, based on typical industrial practices, a commercial controller was
used, and one parameter group setting for the five axes together during the
machining of each mold was adopted. 14 geometrically identical blade molds were manufactured with 14 jerk
setting clusters (Table 2) and subjected to inspection. From
research \[7\], it is known that the path length affects machining
performance. Without loss of generality, the mold was separated into four
zones (Fig. 4(a)) with varying curvature contours, and path lengths (Table
3) were be considered as input parameters. Therefore the input
parameters for the workpiece manufacture included jerk values of each
axis, the average path length of each zone, cutting tool feed
rate, and spindle rotation speed of tool. The output parameters were the six image
textures from image processing. Some examples of surface images are
shown in Fig. 9.

+----------------------+------------------------+------------------------+
| ![](media/image42.png| > ![](media/image43.png| > ![](media/image44.png|
|           ){width="1 |           ){width="1   |           ){width="1   |
| .2846041119860017in" | .2183486439195101in"   | .2140518372703413in"   |
| height="1.           | > height="1.           | > height="1.           |
| 3235312773403325in"} | 2183486439195101in"}   | 2075590551181103in"}   |
|                      |                        |                        |
| (a) Original surface | (b) Training data      | (c) Training data      |
|     > image          |     > image-1          |     > images-2         |
+----------------------+------------------------+------------------------+

Fig. 9 Some examples of machining surface images

The parameters and architecture of the model are shown in Fig. 10. A total of 2016
surface image samples from 14 molds were used as training data and
504 samples used as a validation test. Each jerk setting cluster had 45
samples. The results of the validation test are shown in Table 5.

![](media/image45.png){width="4.4533409886264215in"
height="2.1302088801399823in"}

Fig. 10 The image texture prediction model structure

Table 5 The image texture prediction model results

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

To get the final roughness values, the six features from the GLCM were used
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
length instead of the separate path length in each zone. The total
path length data could be calculated from CAM. Additionally, the output was
the single metric of machining time. The parameters and neural net
architecture are shown in Fig. 12. The actual and estimated machining
times are shown in Table 7 and there was an average error of -0.472%.

![](media/image47.png){width="4.213542213473316in"
height="2.061136264216973in"}

Fig. 12 The machining time estimation model structure

> Table 7 Machining time estimate model results

  ------------- -------------------- ------------------- -----------
  Cluster No.   Predicted time (s)   Measured time (s)   Error (%)
  1             1656.8               1663                -0.37
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
                                                         
  ------------- -------------------- ------------------- -----------

**3.4 Summary and discussion**

The results of this experiment show:

1\. The cutting mechanism leaves tool marks (scallops and cusps), and the
resulting surface texture of the workpiece is a faithful representation of the parameter
changes of the machining process, typically the effect of changes to jerk
setting values. The SVM and CNN results show the six selected
texture features are significant characteristics of the image.

2\. The training data included four different curvature zones, 
simulating a typical workpiece that includes various contour
surfaces. The system was able to predict the surface roughness for
14 groups of jerk settings in all zones. The image texture
characteristics of the workpiece surface could be predicted from the input
that included the information about the workpiece, dynamic parameters of the
machine, and cutting conditions. Surface roughness could be estimated from
the texture characteristics of the workpiece surface. Also, the
processing time required could be estimated from the input processing
conditions. The final average estimated performances produced only 0.272% and
-0.472% error rates for roughness and machining time, respectively.

3\. To summarize the achievements of this study, an integrated system for
manufacturing performance prediction is available, as shown in Fig
10. A real high-speed 5-axis machining system (in Fig 2) can be
replaced with a virtual machine tool module. We have successfully
demonstrated the integrated prediction system with the input: workpiece
information, cutting parameters and machine tool parameters, as an
experiment. And the output: predicted roughness, compared with the
measured data shows only minimal error (in Table 8). The predicted machining time and
the actual values were only minimally different (see Table 7). A separate branch of the
system, the roughness prediction module combined with surface texture
processor, can be used as an independent module for surface quality
inspection when surface images of a workpiece are available.

4\. Additionally, it can be observed from the CNN feature map analysis
that different jerk value settings can produce different higher-level
patterns deeper in the network. As seen in the pictures in Table 4, the
same area of concern will exhibit different features with different jerk settings, showing
that jerk does indeed give rise to different textural features.
Equivalent jerk settings will produce similar feature images, proving again
that jerk is an important parameter that affects surface texture during
synchronous machining. The results of this study and comparisons with
other research on surface roughness prediction systems are listed
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
| Xie\[41\],  | Turning     | SVM+PSO     | Spindle     | 4.86%       |
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

Surface images of scallops and cusps observed on 14 
workpieces caused by different jerk settings in 5-axis synchronization
machining have been captured and studied. Image processing technology and machine
learning are used to evaluate manufacturing performance (roughness
and machining time).

An integrated system, constituting a virtual machine tool module, image
processing module and roughness prediction module, has been developed.
This system has demonstrated good pre-assessment and quality
inspection ability. It gives users the ability to choose the best 
parameter settings, and to estimate processing time and the
quality of the surface before real machining. It also can help users
balance the requirement for fast processing times and the
need for surface quality in industrial applications.

# 
