(setq org-startup-indented t
      org-src-tab-acts-natively t)
(setq org-hide-emphasis-markers t)
(setq valign-fancy-bar t)
(use-package org-bullets
  :load-path "site-lisp/org-bullets"
  :hook (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("◉" "✸" "✿" "✜" "◆"))
  (setq org-ellipsis "⤵"))
(provide 'config-org-mode)
;;; config-org-mode.el ends here
