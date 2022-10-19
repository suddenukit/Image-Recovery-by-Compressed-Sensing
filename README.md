# Welcome to Image Recovery

This project applied compressed sensing to recover full
images from a small number of sampled pixels. It used 2-D
DCT (Discrete Cosine Transform) algorithm to generate
frequency distributions of the images. OMP (Orthogonal
Matching Pursuit) algorithm were used to get sparse solution of
frequency coefficients. We used random subsets to do cross
validation to get the best regularization coefficient. Then we did
inverse DCT transformation to recover the image. In this
project, we recovered 2 images by using different numbers of
samples and compared the result under different conditions.
