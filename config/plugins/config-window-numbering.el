(require 'window-numbering)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*sort-tab*") 9)))
(window-numbering-mode)

(provide 'config-window-numbering)
;;; config-window-numbering.el ends here
