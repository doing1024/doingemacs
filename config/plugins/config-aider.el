;;; config-aider.el --- doingemacs init file
;;; Commentary:
;; There are config about aider.el,ai powered programer
;;; Code:

(use-package aider
    :load-path "site-lisp/aider.el"
    :config
    (setq aider-args doingemacs-aider-args)
    (setenv doingemacs-aider-key-name doingemacs-aider-key-value)
    (global-set-key (kbd "M-d a") 'aider-transient-menu)
		:bind
		("M-d a" . aider-transient-menu))
(provide 'config-aider)
 ;;; config-aider.el ends here
