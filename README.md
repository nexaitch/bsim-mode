# Emacs BSim mode for 50.002 Computation Structures

bsim-mode is a major mode for editing BSim code, used in SUTD's 50.002 Computation Structures module. Currently it only handles syntax highlighting.

## How to use

1. Put `bsim.el` into your init folder.
1. Add the following into your init file, replacing `path/to/bsim.el` with the location of `bsim.el:

```elisp
(load "path/to/bsim.el" nil t)
(add-to-list 'auto-mode-alist '("\\.uasm\\'" . bsim-mode))
```
