(add-to-list 'load-path "~/.emacs.d/site-lisp/projectile/")
(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet/")
(require 'yasnippet)
(kb "M-d l o" 'eglot-ensure)
(kb "M-d l r" 'eglot-rename)

(provide 'config-lsp)
;;; config-lsp.el ends here
