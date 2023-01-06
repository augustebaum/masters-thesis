
### Methods

#### Latent shift \cite{cohenGifsplanation2022}

Applying latent shift to an input point $x$ consists in:
1. Learning a latent representation of the input space;
2. Mapping $x$ to its latent representation $z$;
3. Computing the gradient of $f$ with respect to $z$;
4. Perturbing $z$ along the direction of the gradient, by
a given shift amount $\lambda$;
5. Mapping back the perturbed latent point to the input
space.

##### Details on step 3

Depending on the situation the gradient will be computed
on different functions.
In the case where the target class $y_\text{target}$ is
known, we could compute the gradient of the component of
$f$ corresponding the $y_\text{target}$:
$\frac{\partial f_{y_\text{target}}(z)}{\partial z}$.
We could also consider the direction that increases
the difference $f_{y_\text{target}} - f_{y_\text{current}}$ the most:
$\frac{\partial}{\partial z} \left( f_{y_\text{target}}(z) - f_{y_\text{current}}(z) \right)$.
In the other case, we only care about changing the current
class, so we could choose the direction steepest *descent*
of $f_{y_\text{current}}$: $- \frac{\partial f_{y_\text{target}}(z)}{\partial z}$.

#### REVISE \cite{joshiRealistic2019}

REVISE resembles \cite{wachterCounterfactual2017} in that
it solves a constrained optimization problem with gradient descent, but
the difference is that the gradient descent is performed *in latent space*.

In particular, like in \cite{wachterCounterfactual2017}, in
REVISE the authors
include a regularizaton term for the *cost* $c$ of a counterfactual,
the definition of which is situation-dependent:
$$
\begin{align}
  \arg\min_{x^\text{CF} \in \mathcal{X}}\  & c(x^\text{CF}, x)       \\
  \text{such that }        & f(x^\text{CF}) = y_\text{target}
\end {align}
$$


#### The `CakeOnSea` dataset

The appeal of latent shift is the capacity to vary the amount of shift so
as to obtain an "explanation path" leading from the explained input to its
perturbation. When the inputs are images, this path can be visualized by
stacking them together into an animated GIF file.

For tabular data one option to represent the whole path compactly is by stack
the rows in descending order, the first row being the original input and the
last being the final perturbation. Of course, extracting semantic information
from the table quickly becomes impractical as the numbers of shifts and
features increase. Another option is to represent the change in each feature in
their individual plot. Considering one goal of the method is to uncover latent
features that were obtained by combining the individual separately, visualizing
the feature changes individually could be counterproductive.

In order to avoid such complexity to reduce the problem scope, we use a dataset
where there are only two significant features, but it remains possible to add
more features by combining the first two. This way, paths can visualized as
curves in two dimensions.

#### Measuring explanation power
