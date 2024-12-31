(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(require 'yasnippet)
(kb "M-d l o" 'lsp)
(kb "M-d l r" 'lsp-rename)
(kb "M-d l s" 'lsp-ivy-workspace-symbol)

(provide 'config-lsp)
;;; config-lsp.el ends here
