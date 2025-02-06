(use-package dirvish
	:load-path "~/.emacs.d/site-lisp/dirvish"
	:init
	(kb "M-d f t" 'dirvish-side)
	:config
	(dirvish-override-dired-mode)
	;; (dirvish-peek-mode) ; Preview files in minibuffer
	;; (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
	(setq dirvish-mode-line-format
				'(:left (sort symlink) :right (omit yank index)))
	(setq dirvish-attributes
				'(all-the-icons file-time file-size subtree-state))
	(setq delete-by-moving-to-trash t)
	(setq dired-listing-switches
				"-l --almost-all --human-readable --group-directories-first --no-group")
	:bind ; Bind `dirvish|dirvish-side|dirvish-dwim' as you see fit
	(("C-c f" . dirvish-fd)
	 :map dirvish-mode-map ; Dirvish inherits `dired-mode-map'
	 ("c f" . dired-create-empty-file)
	 ("c d" . dired-create-directory)
	 ("a"   . dirvish-quick-access)
	 ("f"   . dirvish-file-info-menu)
	 ("y"   . dirvish-yank-menu)
	 ("N"   . dirvish-narrow)
	 ("^"   . dirvish-history-last)
	 ("h"   . dirvish-history-jump) ; remapped `describe-mode'
	 ("s"   . dirvish-quicksort)    ; remapped `dired-sort-toggle-or-edit'
	 ("v"   . dirvish-vc-menu)      ; remapped `dired-view-file'
	 ("TAB" . dirvish-subtree-toggle)
	 ("M-f" . dirvish-history-go-forward)
	 ("M-b" . dirvish-history-go-backward)
	 ("M-l" . dirvish-ls-switches-menu)
	 ("M-m" . dirvish-mark-menu)
	 ("M-t" . dirvish-layout-toggle)
	 ("M-s" . dirvish-setup-menu)
	 ("M-e" . dirvish-emerge-menu)
	 ("M-j" . dirvish-fd-jump)))

(provide 'config-dirvish)
;; config-dirvish.el ends here
