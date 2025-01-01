(if doingemacs-already-startup (sort-tab-turn-off))
(use-package sort-tab
  :if doingemacs-enable-tab
  :load-path "site-lisp/sort-tab"
  :config (sort-tab-mode 1)
  )
(kb "C-<iso-lefttab>" 'sort-tab-select-prev-tab)
(kb "C-M-<return>" 'sort-tab-close-current-tab)
(kb "C-<tab>" 'sort-tab-select-next-tab)
(kb "C-1" 'sort-tab-select-visible-tab)
(kb "C-2" 'sort-tab-select-visible-tab)
(kb "C-3" 'sort-tab-select-visible-tab)
(kb "C-4" 'sort-tab-select-visible-tab)
(kb "C-5" 'sort-tab-select-visible-tab)
(kb "C-6" 'sort-tab-select-visible-tab)
(kb "C-7" 'sort-tab-select-visible-tab)
(kb "C-8" 'sort-tab-select-visible-tab)
(kb "C-9" 'sort-tab-select-visible-tab)
(kb "C-0" 'sort-tab-select-visible-tab)
(provide 'config-sort-tab)
;;; config-sort-tab.el ends here
