(require 'projectile)
(setq projectile-mode-line "Projectile")
(setq projectile-track-known-projects-automatically nil)

(setq lsp-keymap-prefix "C-c l"
      lsp-file-watch-threshold 500)
(require 'lsp-mode)
(setq lsp-headerline-breadcrumb-enable t)

(require 'lsp-ui)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-doc-position 'top)
(kb "M-d l o" 'lsp)
(kb "M-d l r" 'lsp-rename)
(kb "M-d l s" 'lsp-ivy-workspace-symbol)


(provide 'config-lsp)
;;; config-lsp.el ends here
