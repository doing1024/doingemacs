(use-package mwim
  :if doingemacs-enable-mwim
  :load-path "site-lisp/mwim.el"
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))
(add-to-list 'custom-theme-load-path doingemacs-theme-load-path t)
(if doingemacs-enable-random-switch-theme-when-startup (load-theme (nth (random (length doingemacs-random-themes)) doingemacs-random-themes) t) (load-theme doingemacs-theme t))
(use-package which-key
  :load-path "site-lisp/emacs-which-key"
  :config (which-key-mode))
(which-key-mode)
(use-package format-all
  :load-path "site-lisp/format-all"
  :bind
  ("M-d c a" . format-all-buffer))
(use-package rainbow-delimiters
  :load-path "site-lisp/rainbow-delimiters"
  :hook (prog-mode . rainbow-delimiters-mode))
(use-package markdown-mode
  :load-path "site-lisp/markdown-mode"
  :mode "\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\|mdx\\)\\'")

(use-package goto-line-preview
  :load-path "site-lisp/goto-line-preview"
  :bind
  ("M-d f l" . goto-line-preview))
(use-package multiple-cursors
  :if doingemacs-enable-multiple-cursors
  :load-path "site-lisp/multiple-cursors.el"
  :bind
  ("M-d m l" . mc/edit-lines)
  ("M-d m w" . mc/mark-all-like-this)
  ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))
(defun what-the-doingemacs-version-i-use ()
  (interactive)
  (message doingemacs-version))
(provide 'smalls)
;;; smalls.el ends here