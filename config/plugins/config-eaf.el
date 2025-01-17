;;; Codes:
(use-package eaf
  :defer 3
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :config
  (dolist (plugin doingemacs-eaf-plugins)
    (require plugin) ; require eaf plugin
    )
  :custom
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  (defalias 'browse-web #'eaf-open-browser)) ;; unbind, see more in the Wiki
(kb "M-d e o" 'eaf-open)
(kb "M-d e i" 'eaf-install)
(provide 'config-eaf)
;;; config-eaf.el ends here
