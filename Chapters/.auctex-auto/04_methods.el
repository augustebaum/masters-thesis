(TeX-add-style-hook
 "04_methods"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("subfiles" "../main.tex")))
   (TeX-run-style-hooks
    "latex2e"
    "Figures/cake_on_sea"
    "subfiles"
    "subfiles10")
   (LaTeX-add-labels
    "ch:methods"
    "algo:pathreg"
    "fig:cake_on_sea"))
 :latex)

