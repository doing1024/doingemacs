(use-package treemacs
  :if doingemacs-enable-treemacs
  :load-path "site-lisp/treemacs/src/elisp"
  :bind
  ("M-d f t" . treemacs)
  ("C-x t 1"  . treemacs-delete-other-windows)
  ("C-x t t"  . treemacs)
  ("C-x t B"  . treemacs-bookmark)
  :defer 2
  )
(use-package treemacs-file-management
  :if doingemacs-enable-treemacs
  :load-path "site-lisp/treemacs/src/elisp"
  :after treemacs
  )


(provide 'config-treemacs)
