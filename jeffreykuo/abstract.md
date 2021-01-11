Topic: A study of jerk effect for optimal 5-axis manufacturing setting
and prediction applied on free-form surface quality

This study investigates the best jerk settings in five-axis machining and the influence of jerk settings on the surface quality of machining. Improved surface quality of the workpiece and increased manufacturing speeds are the challenges facing the better manufacture of free-form surface molds.
Researchers have proposed limiting jerk values to guarantee smooth
motion trajectories, which can avoid the need to suppress vibration and damage to
the machine equipment. But this would sacrifice manufacturing speed.
Therefore, it is necessary to consider the balance between surface
quality and processing efficiency when selecting a jerk value. In
addition, there is no objective judgment method for detecting the
quality of the multi-axis machining surface of curved surfaces, and
there is a lack of pre-evaluation and prediction best practices. Jerk values can only be
adjusted and improved based on experience. In order to solve the
aforementioned problems, this research proposes the following strategies
as a response:

1\. The optimal selection strategy for five-axis jerk values: This
study takes the servo axis position loop bandwidth as the tracking
command ability limit, calculates jerk values according to the
path length of each axis, and proposes the best matching five-axis jerk
value selection strategy. The surface roughness after five-axis
machining is taken as the metric for surface quality inspection. The
experimental results prove that the five-axis jerk combination
recommended by this research does obtain the best surface quality.
Compared with the result of maximizing single-axis jerking, roughness values
can be reduced by 8.3%.

2\. Surface quality inspection of free-form surface workpieces: One can analyze
the processed surface image with image processing technology, and use the
frequency of residual traces as a representative feature. It is found that a good
processing result will have a more obvious peak value on the
spectrogram, which indicates the tool traces can be used
as a eignificant performance indicator. Poorly processed surface images have
more side-band frequencies, so that the frequencies on the frequency
spectrum do not have harmonic frequency characteristics, which
is a representative feature of poor matching between the axes while manufacturing.

3\. Integrated processing performance prediction system: Based on the
results of the first two researches, an integrated processing
performance prediction system is proposed by using machine learning
support vector machines and neural network architecture. It includes (1)
Surface roughness prediction modules, which are processed by the surface
feature of the image to predicted the surface roughness value. The
overall average error of system is 0.272%; (2) The processed surface
image feature prediction module, which predicts the feature value of the
processed surface image from the axis jerking parameter and the
processing path parameters. The six parameters of information
measurement index included correlation, energy, homogeneity, sum
entropy, sum variance and information measure of correlation. The
overall average error is 1.114%, and finally the prediction error result
of the integrated predition system combining (1) and (2) part have the
average error as 0.730%; (3) Prediction module for total finishing time.
The total processing time can also be predicted from the machine jerking
parameters and processing path parameters. The average error of the 14
groups is 0.472%.

The strategy for selecting the best jerk parameters proposed by this
research can be applied to all multi-axis machining machines and
free-form surface mold processing. This decision-making method will help
on-site operators to maximize the performance of the machine. It could
provide automatic machine setting and final quality testing of
intelligent production without added new detecting equipment. The
integrated prediction system proposed by this research can provide users
to evaluate manufacturing performance before performing actual
operations, and can reduce trial and error testing time when cutting
parameters are set. It is very suitable for curved surface workpieces
and small batches and high parameter differences in smart manufacturing
production application.
