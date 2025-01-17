;;; config-org-mode.el --- doingemacs init file
;;; Commentary:
;; There are config about Org Mode
;;; Code:

;; Build-in config
(setq org-startup-indented t
      org-src-tab-acts-natively t)
(setq org-hide-emphasis-markers t)
(setq valign-fancy-bar t)

;; org bullets
(use-package org-bullets
  :load-path "site-lisp/org-bullets"
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("◉" "✸" "✿" "✜" "◆"))
  (setq org-ellipsis "⤵"))
(provide 'config-org-mode)
;;; config-org-mode.el ends here
