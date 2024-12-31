(use-package treemacs
  :if doingemacs-enable-treemacs
  :load-path "site-lisp/treemacs/src/elisp"
  :bind
  ("M-d f t" . treemacs)
  (:map global-map
	("M-0"    . treemacs-select-window)
	("C-x t 1"  . treemacs-delete-other-windows)
	("C-x t t"  . treemacs)
	("C-x t B"  . treemacs-bookmark))
  )
(use-package treemacs-file-management
  :if doingemacs-enable-treemacs
  :load-path "site-lisp/treemacs/src/elisp"
  )


(provide 'config-treemacs)
