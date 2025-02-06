;;; init.el --- doingemacs init file
;;; Commentary:
;; This is the initialization file of Emacs, responsible for loading all configurations
;; Configuration is managed in multiple files


;;; Code:
;; Resolve Package cl is deprecated warning
(setq byte-compile-warnings '(cl-functions))

;; Increase garbage collection threshold for faster startup
(setq gc-cons-threshold (* 50 1024 1024))

;; Set doingmacs version number
(setq doingemacs-version "doingemacs 1.1.0")

;; Marks whether Emacs has finished starting,Mainly to prevent multiple sort-tabs from appearing
(setq doingemacs-already-startup nil)
;; Add configuration directory and user configuration to load path
(add-to-list 'load-path "~/.emacs.d/user-custom")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/plugins")

;; Load user-defined configuration
(require 'user-custom)

;; Perform custom operations before initialization
(user/run-before-init)

;; Load user configuration
(user/config)

;; Load basic config
(require 'basic)
;; Load keymap without plugins
(require 'keys)
;; Load hooks without plugins
(require 'hooks)
;; Load plugins
(require 'plugin)

;; Load custom variable settings and beautify the main file
(setq custom-file "~/.emacs.d/config/custom-set-var.el")
(load custom-file)

;; Perform custom operations after initialization
(user/run-after-init)

;; Mark Emacs as having finished starting
(setq doingemacs-already-startup t)

;; Restore garbage collection threshold
; (setq gc-cons-threshold (* 2 1000 1000))
(provide 'init)
;;; init.el ends here
