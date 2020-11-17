;;; bsim.el --- Defines a major mode for editing BSim files.

;;; Commentary:
;;

;;; Code:

(defconst bsim-directives '(".include"
			    ".macro"
			    ".align"
			    ".ascii"
			    ".text"
			    ".breakpoint"
			    ".protect"
			    ".unprotect"
			    ".options"
			    ".pcheckoff"
			    ".tcheckoff"
			    ".verify"))

(defconst bsim-font-lock-keywords
  (list `(,(concat "^\\s-*" (regexp-opt bsim-directives) "\\>") . font-lock-builtin-face)
	'("\\sw*:" . font-lock-preprocessor-face)
	'("\\(\\sw*\\)(.*)" . (1 font-lock-function-name-face)))

  "Highlighting expressions for `bsim-mode'.")

(defvar bsim-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?| "<" st)
    (modify-syntax-entry ?\n ">" st)
    (mapc (lambda (c) (modify-syntax-entry c "." st)) "~+-*/%><=")
    st)
  "Syntax table for `bsim-mode'.")

(defun bsim-mode ()
  "Major mode for editing bsim files."
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table bsim-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(bsim-font-lock-keywords))
  (setq major-mode 'bsim-mode)
  (setq mode-name "BSIM")
  (run-hooks 'bsim-mode-hook))

(provide 'bsim)

;;; bsim.el ends here
