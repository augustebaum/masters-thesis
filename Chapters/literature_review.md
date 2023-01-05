
Investigations into CF explanation methods have
been developing over the past decade.

Some reviews already exist (verma, stepin)

- wachterCounterfactual
- Don't confuse CF with contrastive explanation,
although they are related (stepin)
- REVISE (@joshiRealistic2019, gradient in latent space)
  - gifsplanation, more basic and applied to images (@cohenGifsplanation2022)
- Prototypes (CFPrototype, @vanlooverenInterpretable2021)
- There are repositories containing implementations
and benchmarks
  - @pawelczykCARLA2021
  - @deoliveiraFramework2021
- CLUE (to reinforce model certainty)
- CRUDS
- Causality-related
  - More sensible if recourse is a desired goal.
  - @mahajanPreserving2020
  - @karimiAlgorithmic2020
- CARE
  - uses genetic algo
- DiCE
  - Determinantal point processes
- CERTIFAI
- GRACE

Using a latent space is very frequent nowadays.

Constraints applied to CFs:
- @rasouliCARE2022
  - Validity
  - Consistency
  - Simplicity / Sparsity
  - Distance
  - Soundness (proximity, connectedness)
  - Actionability
  - Diversity (jaccard)
  - Speed

Compressing a bit:

Properties:
- Causal-aware

Method:
- Using latent representation

- Sample based

Visualising the explanations is also a must in papers
presenting new methods, sometimes to the detriment of
more elaborate testing; a practice that is widespread
in XAI and the subject of various criticisms (@leavittFalsifiable2020).

Thus, a flurry of metrics have been developed to rate
solutions based on these constraints.
- Validity rate: fraction of CFs that actually have a
different predicted class from the explained input, or
have the predicted class that was targeted.
- Sparsity: number of features changed in a CF.
- Distance: distance from CF to explained input.
- Combination of sparsity and distance:
  - MADD ($L-1$ distance divided by Median Absolute Deviation)
  (@deoliveiraFramework2021)
  - Mahalanobis Distance (MD) (@deoliveiraFramework2021)
- Computational complexity: duration of CF generation.
- Stability: determinism (@deoliveiraFramework2021)
- Realism/Plausibility:
  - Causal realism: fraction of causal constraints violated
  - Likeness to training set: similarity to a training set
    - Reconstruction-based (@vanlooverenInterpretable2021)
    - Density-based
      - NF likelihood estimate
      - MMD
    - Discriminator-based (@zhangInterpretable2022)
  - Likeness to CF class (@vanlooverenInterpretable2021)
- Feasibility/Actionability in algorithmic recourse context

However, it can be non-trivial to extend these metrics to CF
path methods: the metrics can be used on the path end-point,
but the added value of the paths is the
additional insight on __how__ this CF was obtained.

- Continuity: unclear whether this is always beneficial.
- Validity: if end point is in target class.
- Realism: Average similarity over the whole path.
- Distance: ?
- Sparsity: ?
- Computational complexity: relative to number of points in path
- Stability: how to compare two paths?

An additional problem is that of _semanticity_.
Neural networks uncover patterns in data, so additionally
to good accuracy we hope that a trained model has captured
good _latent features_ that are highly predictive of the
response.
CF paths can help capture this semantic information but
our metrics don't always account for this: for example, even
if input feature sparsity is high, we could have very low
latent feature sparsity (think of the Diffusion latent space
paper: to make a person smile, many pixels have to be changed,
but in latent space the input is only perturbed in one dimension).

This is especially apparent when comparing a CF explanation
to an adversarial perturbation: the latter can be valid,
sparse and realistic-looking (as it is typically very similar
to the original input) but it is not a _semantic_ perturbation.

