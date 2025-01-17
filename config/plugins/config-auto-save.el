;;; config-auto-save.el --- doingemacs init file
;;; Commentary:
;; Used to override Emacs' default auto-save
;;; Code:

(use-package auto-save
  :load-path "site-lisp/auto-save"
  :if doingemacs-enable-auto-save
  :config
  ;; Disable Emacs defualt auto backup
  (setq make-backup-files nil)
  (auto-save-enable)
  (setq auto-save-silent t)   ; quietly save
  (setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving

;;; custom predicates if you don't want auto save.
;;; disable auto save mode when current filetype is an gpg file.
  (setq auto-save-disable-predicates
	'((lambda ()
	    (string-suffix-p
	     "gpg"
	     (file-name-extension (buffer-name)) t))))
  )
(provide 'config-auto-save)
;;; config-auto-save.el ends here
