(defun user/config ()
  ;;; user config
  (setq doingemacs-enable-custom-font nil)
  ; if you want to set doingemacs's font,you can set these options:
  ; (setq doingemacs-default-font "")
  ; (setq doingemacs-cjk-font "")
  (setq doingemacs-enable-proxy nil)
  ; (setq doingemacs-proxy-host "127.0.0.1")
  ; (setq doingemacs-proxy-port 12334)
  (setq doingemacs-enable-mwim t)
  (setq doingemacs-enable-random-switch-theme-when-startup nil)
  ; (setq doingemacs-random-themes '(atom-one-dark dracula vivendi wombat))
  (setq doingemacs-theme-load-path "~/.emacs.d/site-lisp/themes/")
  (setq doingemacs-theme 'atom-one-dark)
  (setq doingemacs-dashboard-logo nil)
  (setq doingemacs-dashboard-title nil)
  (setq doingemacs-enable-treemacs nil)
  (setq doingemacs-enable-auto-save t)
  (setq doingemacs-enable-tab t)
  (setq doingemacs-enable-flycheck t)
  (setq doingemacs-enable-multiple-cursors t)
  (setq doingemacs-enable-language-complete t)
  (setq doingemacs-language-complete-plugin-use-eglot t) ;use "eglot" or "lsp-bridge"
  (setq doingemacs-eglot-language-need-complete (list 'c-mode-hook 'c++-mode-hook 'css-mode-hook 'html-mode-hook 'mhtml-mode-hook 'js-mode-hook 'python-mode-hook 'sh-mode-hook))
  (setq doingemacs-enable-eaf t)
  (setq doingemacs-eaf-plugins '())
	(setq doingemacs-enable-translate t)
	(setq doingemacs-enable-aider nil)
	;; see https://aider.chat/docs/llms.html
	;; It is recommended to add "--no-auto-commits" to doingemacs-aider-args
	(setq doingemacs-aider-args '("any-args-you-want-to-pass-in-the-aider"))
	(setq doingemacs-aider-key-name "API_KEY_NAME")
	(setq doingemacs-aider-key-value "API_KEY"))
(defun user/run-before-init ()
  ;;; any thing you want it to run before load any doingemacs config
  ;;; warning: don't delete this function,it'll make error when doingemacs startup

  )
(defun user/run-after-init ()
  ;;; any thing you want it to run after load any doingemacs config
  ;;; warning: don't delete this function,it'll make error when doingemacs startup
					; (message "Doingemacs Startup!")
  )

(provide 'user-custom)
;;; user-custom.el ends here
