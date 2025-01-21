;;; basic.el --- doingemacs init file
;;; Commentary:
;; There are some basic config in here,like proxy,fonts.
;; Autocomplete brackets
(electric-pair-mode t)

;; Refresh when files are updated
(global-auto-revert-mode t)

;; Entering text after selecting it will replace the text
(delete-selection-mode t)

;; Disable toolbar
(tool-bar-mode -1)

;; Disable scroll bars in graphical interface
(when (display-graphic-p) (toggle-scroll-bar -1))

;; Disable menu bar
(menu-bar-mode -1)

;; Set emacs proxy
(if doingemacs-enable-proxy
    (progn (setq my-http-proxy (format "%s:%d" doingemacs-proxy-host doingemacs-proxy-port))
	   (setq my-socks-proxy (format "%s:%d" doingemacs-proxy-host doingemacs-proxy-port))
	   ))

;; Change yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Set emacs font
(if doingemacs-enable-custom-font (progn (set-frame-font doingemacs-default-font)
					 (dolist (charset '(han kana symbol cjk-misc bopomofo))
					   (set-fontset-font (frame-parameter nil 'font)
							     charset
							     (font-spec :family doingemacs-cjk-font)
							     ))
					 ))

;; Tell user what doingemacs they use,for easier debug
(defun what-the-doingemacs-version-i-use ()
  (interactive)
  (message doingemacs-version))


(provide 'basic)
;;; basic.el ends here
