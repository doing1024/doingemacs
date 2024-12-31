(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(require 'yasnippet)
(kb "M-d l o" 'eglot-ensure)
(kb "M-d l r" 'eglot-rename)

(provide 'config-lsp)
;;; config-lsp.el ends here
