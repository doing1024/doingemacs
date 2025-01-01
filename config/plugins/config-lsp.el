(use-package projectile
  :load-path "site-lisp/projectile/"
  :defer 3
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t))

(use-package yasnippet
  :defer 2
  :load-path "site-lisp/yasnippet/"
  :hook (prog-mode . yas-minor-mode)
  )
(if (doingemacs-language-complete-plugin-use-eglot) (use-package lsp-bridge
						      :init (setq lsp-bridge-python-lsp-server "pyright")
						      :load-path "site-lisp/lsp-bridge/"
						      :after (yasnippet)
						      :bind
						      ("M-d l r" lsp-bridge-rename)
						      :config
						      (global-lsp-bridge-mode)
						      )
  (progn
    (kb "M-d l o" 'eglot-ensure)
    (kb "M-d l r" 'eglot-rename)
    ))
(defun doingemacs-init-lsp-bridge
    (interactive)
  (async-shell-command "pip3 install epc orjson sexpdata six setuptools paramiko rapidfuzz watchdog packaging --break-system-packages" "*doingemacs-install-lsp-bridge*")
  )
(provide 'config-lsp)
;;; config-lsp.el ends here
