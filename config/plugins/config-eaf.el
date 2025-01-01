;;; Codes:
(use-package eaf
  :defer 3
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
					; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  (defalias 'browse-web #'eaf-open-browser)) ;; unbind, see more in the Wiki
(defun doingemacs-install-new-eaf-apps ()
  (interactive)
  (async-shell-command "python3 ~/.emacs.d/site-lisp/emacs-application-framework/install-eaf.py --install-new-apps" "*doingemacs-eaf-install-apps*"))
(kb "M-d e o" 'eaf-open)
(kb "M-d e i" 'doingemacs-install-new-eaf-apps)
(provide 'config-eaf)
;;; config-eaf.el ends here
