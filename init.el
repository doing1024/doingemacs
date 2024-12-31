;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
(setq doingemacs-already-startup nil)
(add-to-list 'load-path "~/.emacs.d/user-custom")
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/config/plugins")
(require 'user-custom)
(user/run-before-init)
(user/config)
(require 'basic)
(require 'keys)
(require 'plugin)
(require 'hooks)
(setq custom-file "~/.emacs.d/config/custom-set-var.el")
(load custom-file)
(user/run-after-init)
(setq doingemacs-already-startup t)
(setq doingemacs-version "doingemacs 0.0.3")
(provide 'init)
;;; init.el ends here
