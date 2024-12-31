(use-package counsel
  :load-path "site-lisp/swiper"
  )
(use-package ivy
  :load-path "site-lisp/swiper"
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   ("M-d f c" . counsel-rg)
   ("M-d f f" . counsel-fzf)

   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))
(use-package amx
 :load-path "site-lisp/amx"
 :config (amx-mode))
(provide 'config-ivy)
;;; config-ivy.el ends here
