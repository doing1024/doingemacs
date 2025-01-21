;;; hooks.el --- doingemacs init file
;;; Commentary:
;; Doingemascs defined some hooks for Emacs build-in plugins and modes there
;;; Code:

;; In programming mode, when the cursor is over a parentheses, another parenthesis is highlighted
(add-hook 'prog-mode-hook #'show-paren-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; LSP hooks when user use eglot
(if (and doingemacs-enable-language-complete doingemacs-language-complete-use-eglot) ; If user use eglot
    (progn (dolist (language-hook doingemacs-eglot-language-need-complete)
	     (add-hook language-hook 'eglot-ensure) ; add hook when language mode enable
	     )))

(provide 'hooks)
;;; hooks.el ends here
