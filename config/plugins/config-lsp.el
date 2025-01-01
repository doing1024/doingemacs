(use-package projectile
  :load-path "~/.emacs.d/site-lisp/projectile/"
  :defer 3
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t))

(use-package yasnippet
  :defer 2
  :load-path "~/.emacs.d/site-lisp/yasnippet/"
  :hook (prog-mode . yas-minor-mode)
  )
(kb "M-d l o" 'eglot-ensure)
(kb "M-d l r" 'eglot-rename)

(provide 'config-lsp)
;;; config-lsp.el ends here
