(use-package projectile
  :load-path "site-lisp/projectile/"
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t))

(use-package yasnippet
  :load-path "site-lisp/yasnippet/"
  :hook (prog-mode . yas-minor-mode)
  )
(if (not doingemacs-language-complete-use-eglot)
    (use-package lsp-bridge
      :load-path "site-lisp/lsp-bridge/"
      :init (setq lsp-bridge-python-lsp-server "pyright")
      :after (yasnippet)
      :bind
      ("M-d l r" . lsp-bridge-rename)
      ("M-d l p" . lsp-bridge-peek)
      :hook
      (prog-mode . lsp-bridge-mode)
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
