;;; config-ivy.el --- doingemacs init file
;;; Commentary:
;; Config counsel,ivy,swiper,and amx
;;; Code:

;; config counsel
(use-package counsel
  :defer 1
  :load-path "site-lisp/swiper"
  :config
  (counsel-mode 1)
  :bind
  (("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   ("M-d c f" . counsel-rg)
   ("M-d f f" . counsel-fzf)

   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history))
  )

;; config ivy & swiper
(use-package ivy
  :load-path "site-lisp/swiper"
  :after counsel
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ))

;; config amx
(use-package amx
  :defer 1
  :load-path "site-lisp/amx"
  :config (amx-mode))
(provide 'config-ivy)
;;; config-ivy.el ends here
