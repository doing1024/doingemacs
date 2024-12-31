(if doingemacs-enable-mwim
    (progn (require 'mwim)
	   (kb "C-a" 'mwim-beginning-of-code-or-line)
	   (kb "C-e" 'mwim-end-of-code-or-line)))

(if doingemacs-enable-random-switch-theme-when-startup (load-theme (nth (random (length doingemacs-random-themes)) doingemacs-random-themes) t) (load-theme doingemacs-theme t))
(require 'which-key)
(which-key-mode)

(require 'rainbow-delimiters)
(require 'markdown-mode)
(require 'goto-line-preview)
(if doingemacs-enable-multiple-cursors (progn (require 'multiple-cursors)
					      (kb "M-d m l" 'mc/edit-lines)
					      (kb "M-d m w" 'mc/mark-all-like-this)
					      (kb "C-S-<mouse-1>" 'mc/toggle-cursor-on-click)))
(defun what-the-doingemacs-version-i-use ()
  (interactive)
  (message doingemacs-version))
(provide 'smalls)
;;; smalls.el ends here
