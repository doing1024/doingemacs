(defun user/config ()
  ;;; user config
  (setq doingemacs-enable-custom-font t)
					; if you want to set doingemacs's font,you can set these options:
  (setq doingemacs-default-font "Jetbrains Mono 10")
  (setq doingemacs-cjk-font "Jetbrains Mono 10")
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
  (setq doingemacs-enable-treemacs t)
  (setq doingemacs-enable-auto-save t)
  (setq doingemacs-enable-tab t)
  (setq doingemacs-enable-multiple-cursors t)
  (setq doingemacs-enable-language-complete t)
  (setq doingemacs-language-need-complete (list 'c-mode-hook 'c++-mode-hook 'css-mode-hook 'html-mode-hook 'mhtml-mode-hook 'js-mode-hook 'python-mode-hook 'sh-mode-hook))
  (setq doingemacs-enable-eaf t)
  (setq doingemacs-enable-translate t))
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
