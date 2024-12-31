(use-package company
 :load-path "site-lisp/company-mode"
 :config
 (global-company-mode)
 (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
 (setq company-tooltip-align-annotations t)
   (setq company-idle-delay 0.0)
 (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
 (setq company-selection-wrap-around t)
 (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉
(provide 'config-company)
;;; config-company.el ends here
