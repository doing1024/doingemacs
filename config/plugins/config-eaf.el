;;; Codes:
(require 'eaf)
(defun doingemacs-install-new-eaf-apps ()
  (interactive)
  (async-shell-command "python3 ~/.emacs.d/site-lisp/emacs-application-framework/install-eaf.py --install-new-apps" "*doingemacs-eaf-install-apps*"))
(kb "M-d e o" 'eaf-open)
(kb "M-d e i" 'doingemacs-install-new-eaf-apps)
(provide 'config-eaf)
;;; config-eaf.el ends here
