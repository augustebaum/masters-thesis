
Usual structure for research papers and theses:

Abstract
  Context, contributions
1. Background
  Context
    XAI
    Local XAI
    CFX
  Definitions
    MLP
    CF path
    VAE
    NICE
    LOF and other measures of realism
2. Previous work
  Related works
  Particularly timely or relevant works
3. Methods
  Experimental setup
    Dataset
    Hypothesis being challenged
    Trade-off considerations
    Details on experimental conditions like machine running the experiment
4. Results
  Plots, tables
    Think accessibility
      Big enough fonts
      No colors if possible
      One bit of information per plot
      Figure caption describes what is shown
    Highlight interesting poitns (e.g. bolden best line)
    Show if up is good or bad
  Explanations on the content of the plots and tables
5. Discussion
  Tentative Interpretation of results: 
    does the result challenge the corresponding hypothesis?
  Possible reasons for experiment results, and what that
    suggests for further research
  Limitations of the experiments
6. Conclusion
  Summary in context of current research
  Future work




Context
  ...
  CFX
    Issues with CFX at a glance
  Technical stuff
    Metrics
    VAE
    NF
    ... the ones that are important to understand the previous work and the methods.
Previous work
  Idea introduced or developed
Methods
  Metrics

Results
  Interpretation


Frossard-friendly:

Intro
    Why CFs?
    Why continuous paths?
Methods
    Metrics
        Comparison to IG score
    Latent shift
    NF
    
    Datasets
        CakeOnSea?
        XOR?
        ForestCover
    Experiment 1: Validity losses (to adapt to multi-class setting)
        Compare validity losses to see which one increases validity the most
    Experiment 2: Path losses (to adjust complexity of paths and guarantee trustworthiness)
        Compare losses to see which one satisfies the constraints the most with respect to the decrease in validity
    Experiment 3: Manipulability of paths using losses (the technique works so well that it can be abused)
        Draw a 42, use SSIM to measure?
        Only change one feature at a time


# Abstract
The use of ML is hindered by the problem of explainability: in some applications justifying a model's decisions is critical to ensure trustworthiness, while in others it is set to become a legal necessity.
For a given input-output pair, counterfactual explanations (CFX) address this need by providing an answer to the question "What would it take for the model to change its mind?".
This has the advantage of clarity and, not only does it show which features are determinant to the model, it also constitutes a way for end-users to obtain a more desirable model outcome. 
However, it can be difficult to understand *why* an input gives rise to a particular CFX.

Recently, Latent Shift was introduced to produce a *progressive explanation path*, where the input is perturbed *continuously* towards the target class. However, this was only applied to binary classification problems on images.

Thus, our contributions are as follows: firstly, we extend Latent Shift to (numerical) tabular data; this poses the problem of visualization, which is not present for images or for text data and is made obvious as the number of features increases.

Secondly, we extend it to multi-class problems, where targeting a particular class is not the same as simply moving a point away from its current class; we experiment with different loss functions to maximize the probability of reaching the target class.

Thirdly, we propose a variation to Latent Shift to ensure paths satisfy certain interpretability constraints, e.g. the path should only go through *realistic* points.

Finally, we study the robustness of our proposed method; we demonstrate it can be abused to produce paths of any given shape.

# Intro

We explain the problem of explainable AI, differentiate between global and local explanations, compare and contrast different local methods (advantages and disadvantages):
- Attribution methods: IG
- Local approximation methods: LIME
- Rule-based: Anchors
- CFX
 
Given the previous discussion CFX are attractive, but they suffer from certain issues:
- different CFX can be equally valid (the "Rashomon effect")
- the generated points might not be realistic (in-distribution)
- the different goals of CFX can interfere with each other

Latent shift is a technique that displays only one CFX, but it shows the progression of how an input gets transformed into its CFX. This is more convincing than just showing one perturbation or a group of them, as the end-user can appreciate in more detail in what manner the perturbation would be performed.

# Related works

From less to more relevant:
- Causality-related
- More sensible if recourse is a desired goal.
- @mahajanPreserving2020
- @karimiAlgorithmic2020
- Contrastive explanations
- CARE (@rasouliCARE2022)
- GRACE (@leGRACE2020)
- DiCE (@mothilalExplaining2020)
- CLUE (@antoranGetting2021) (to reinforce model certainty)
- @wachterCounterfactual2017
- CRUDS (@downsCRUDS2020)
- Prototypes (@vanlooverenInterpretable2021)
- REVISE (@joshiRealistic2019, gradient in latent space)
- Repositories containing implementations and benchmarks
- @pawelczykCARLA2021
- @deoliveiraFramework2021
# Methods
## Autoencoder models
Normalizing flows, NICE
## MLPs
## Latent shift
Introduced in @cohenGifsplanation2022 but really just a simplification of gradient descent methods.
## Metrics
Cover the various desiderata for our path explanations
- Validity (class should be changed successfully)
- Realism
- Distance
- Comparison to IG score
## Path regularization
Contrary to latent shift, we relax the constraint of keeping the latent space task-agnostic: we learn the latent space by computing paths and optimizing for some interpretability constraints over the paths. 
For example we could implement the constraint of crossing as few decision boundaries as possible.
## Baselines
Revise, Latent shift
# Experiments
- E1: Which validity loss gets the best validity score?
- E2: Using path regularization, which path loss best optimizes for validity, distance and realism at once?
- E3: Can we abuse path regularization to choose the shape of the paths?
# Results
# Conclusion