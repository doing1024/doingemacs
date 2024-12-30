;;; Hooks
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(if doingemacs-enable-flycheck
    (add-hook 'prog-mode-hook #'flycheck-mode))

(add-hook 'org-mode-hook #'org-bullets-mode)
;; LSP hooks
(if doingemacs-enable-language-complete
    (progn (dolist (language-hook doingemacs-language-need-complete)
	     (add-hook language-hook #'lsp-mode)
	     )
	   (add-hook 'lsp-mode #'lsp-enable-which-key-integration)))
					;(add-hook 'prog-mode-hook #'lsp)

(provide 'hooks)
;;; hooks.el ends here
