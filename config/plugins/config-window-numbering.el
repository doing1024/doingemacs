;;; config-window-numbering.el --- doingemacs init file
;;; Commentary:
;; Each window is numbered for easy switching
;;; Code:

;; Load window numbering
(use-package window-numbering
  :load-path "site-lisp/window-numbering.el"
  :config
  ;; Set tabbar(if it exists) to nuumber 9(mini buffer is number 0)
  (setq window-numbering-assign-func
	(lambda () (when (equal (buffer-name) "*sort-tab*") 9)))
  (window-numbering-mode)
  )

(provide 'config-window-numbering)
;;; config-window-numbering.el ends here
