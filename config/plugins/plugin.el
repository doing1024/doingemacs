;;; plugin.el --- doingemacs init file
;;; Commentary:
;; There are config about Packages
;;; Code:

(require 'package)
(package-initialize)
;; Add melpa support,DoingEmacs don't need that,just for user.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; Add some third-party library dependency directories to the loading path
(add-to-list 'load-path "~/.emacs.d/site-lisp/inheritenv")
(add-to-list 'load-path "~/.emacs.d/site-lisp/s.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/language-id")
(add-to-list 'load-path "~/.emacs.d/site-lisp/dash.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/ht.el")
(add-to-list 'load-path "~/.emacs.d/site-lisp/hydra")
(add-to-list 'load-path "~/.emacs.d/site-lisp/pfuture")

;; Some small and useful plugins
(require 'smalls)

;; Each window is numbered for easy switching
(require 'config-window-numbering)

;; Ivy,Counsel,and Swiper support
(require 'config-ivy)

;; Used to override the default Emacs splash page
(require 'config-dashboard)

;; Beautify Org Mode
(require 'config-org-mode)

;; Used to override Emacs' default auto-save
(require 'config-auto-save)

;; Tabbar
(require 'config-sort-tab)

;; Treesit is build-in for Emacs now,just config it
(require 'config-treesit)

;; Language complete
(if doingemacs-enable-language-complete (progn (if doingemacs-language-complete-use-eglot (require 'config-company))
																							 (require 'config-lsp)))

;; Translate,need crow installed
(require 'doing-translate)

;; Aider support

(require 'config-aider)

;; Dirvish support
(require 'config-dirvish)

(provide 'plugin)
;;; plugin.el ends here
