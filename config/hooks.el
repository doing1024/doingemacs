;;; Hooks
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'flymake-mode)
;; LSP hooks
(if doingemacs-enable-language-complete
    (progn (dolist (language-hook doingemacs-language-need-complete)
	     (add-hook language-hook 'eglot-ensure)
	     )))
					
(provide 'hooks)
;;; hooks.el ends here
