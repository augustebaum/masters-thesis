
2022-12-19

## Experiment hypothesis and general approach

The experiment goal is to determine if REVISE \cite{joshiRealistic2019} and
Latent Shift \cite{cohenGifsplanation2022} perform differently in terms of
- validity
- distance to explained input
- realism
- semanticity?

The process will be the following:
- Generate the data
- Train the "explained" classifier using the training and validation data
- Train the "autoencoder" using the training and validation data
- Run the CFX method on the classifier using the autoencoder, on some
points of the test data. The result is some explanation "paths", one
per explained input.
- Compute metrics on each path; aggregate and plot.

### Metrics

\emph{Validity} is measured as the proportion of paths which end inside
the target class, as predicted by the classifier. This "validity rate" should
be as close to 1 as possible, and 0 would indicate the method does not
succeed in reaching the target class.

\emph{Distance to explained input} is measured as the average $L_1$ distance
from the perturbed input to the explained input, at every step of the path.
The $L_1$ is often used as a measure of sparsity of explanations \cite{}, which also
relates to realisticness of the counterfactuals \cite{}.
However, $L_p$ distances become less useful in higher-dimensional spaces, as
a consequence of the curse of dimensionality \cite{}.

\emph{Realisticness} is measured as ???
There are vast amounts of research on characterizing what makes a point
_out-of-distribution_ \cite{}, and on the distinction between outliers, anomalies,
and out-of-distribution points. Hence, metrics for this concept are limited and
trade-offs are inevitable.

\emph{Semanticity} is measured as ???

## Dataset

The dataset is a toy dataset called `CakeOnSea`. There are $D$ features,
all numerical. The first two features (called $x_0$ and $x_1$) are
sampled uniformly at random from the interval $[0, 50]$, and the
remaining $D-2$ are noisy linear
combinations of $x_0$ and $x_1$: $x_k = \alpha_k x_0 + \beta_k x_1 + \epsilon$.
The response $y$ is computed from $x_0$ and $x_1$ according to the
following decision rule:
- $x_0 < 25 \Rightarrow y = 0$;
- $35 < x_0 < 45 \text{and} 35 < x_1 < 45 \Rightarrow y = 2$;
- Otherwise $y = 1$.
The decision rule is shown graphically in \autoref{fig:cake_on_sea}.

## Classifier

The classifier of interest is a basic MLP with layers consisting of
a certain number of nodes, then a drop-out layer, then a `ReLU`, then
a `BatchNorm` layer. The drop-out probability can be customized and the
BatchNorm layer can be removed. There are two such layers in our MLP.
Our MLP architecture is summarized in \autoref{fig:classifier_architecture}.
The loss function used is cross-entropy.

## Autoencoder

The representation learning model, hereafter referred to generically as
"autoencoder", is an NVP following the NICE construction method \cite{dinhNICE2015}.
The nonlinear $g$ function is the same architecture as for the classifier,
but with 4 layers of 50 nodes each. 
Our NICE architecture is summarized in \autoref{fig:nice_architecture}.

## Model training

The training of both models is as follows:
- The dataset is divided into a training set containing 60\% of the data,
a validation set containing 20\% and a test set containing 20\%.
- The optimization method is Adam \cite{}.
- The number of training epochs is decided using early stopping, which
looks at the validation error after each epoch.

Importantly, there is no correction for class imbalance.
