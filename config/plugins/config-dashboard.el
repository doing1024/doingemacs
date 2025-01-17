;;; config-dashboard.el --- doingemacs init file
;;; Commentary:
;; There are config dashboard mode
;;; Code:

(use-package dashboard
 :load-path "site-lisp/emacs-dashboard"
 :config
 ;; Disable the Emacs default startup page
 (setq inhibit-startup-message t)
 (setq dashboard-projects-backend 'project-el)
 (if doingemacs-dashboard-title (setq dashboard-banner-logo-title doingemacs-dashboard-title) (setq dashboard-banner-logo-title "Welcome to Doingemacs"))
 (if doingemacs-dashboard-logo (setq dashboard-startup-banner doingemacs-dashboard-logo) (setq dashboard-startup-banner "~/.emacs.d/logo.png"))
 (setq dashboard-items '((recents . 10)  ;; Displays how many recent files
  (bookmarks . 5) ;; Displays how many recent bookmarks
  (projects . 10))) ;; Displays how many recent items
 ;; start dashboard
 (dashboard-setup-startup-hook))
(provide 'config-dashboard)
;;; config-dashboard.el ends here
