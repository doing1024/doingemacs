(use-package dashboard
 :load-path "site-lisp/emacs-dashboard"
 :config
 (if doingemacs-dashboard-title (setq dashboard-banner-logo-title doingemacs-dashboard-title) (setq dashboard-banner-logo-title "Welcome to Doingemacs"))
 ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
 (if doingemacs-dashboard-logo (setq dashboard-startup-banner doingemacs-dashboard-logo) (setq dashboard-startup-banner "~/.emacs.d/logo.png"))
 (setq dashboard-items '((recents . 10)  ;; 显示多少个最近文件
  (bookmarks . 5) ;; 显示多少个最近书签
  (projects . 10))) ;; 显示多少个最近项目
 (dashboard-setup-startup-hook))
(provide 'config-dashboard)
;;; config-dashboard.el ends here
