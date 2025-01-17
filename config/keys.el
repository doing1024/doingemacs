;;; keys.el --- doingemacs init file
;;; Commentary:
;; A subset of shortcuts are defined here
;; The other part is in the plugins directory

;;; Code:
;; Save and read sessions
(defun svdesk()
  (interactive)
  (desktop-save "~/.emacs.d/desktop/"))
(defun opdesk()
  (interactive)
  (make-directory "~/.emacs.d/desktop/" t)
  (desktop-read "~/.emacs.d/desktop/"))

;; A macro that defines the keystrokes
(defun kb (keyString command)
  ".short write of global set key,argv:KEYSTRING COMMAND."
  (global-set-key (kbd keyString) command))

;; Open user's custom file
(defun open-user-custom-file ()
  (interactive)
  (find-file "~/.emacs.d/user-custom/user-custom.el"))

;; Define keys
(define-prefix-command 'meta-d-map) ;; Most of the Doingemacs buttons start with M-d
(kb "RET" 'newline-and-indent)
(kb "M-d" nil)

;; see docs/keyboard.md,Some of the buttons about the plugin are defined in the plugins directory
(kb "M-d b d" 'kill-this-buffer)
(kb "M-d b w d" 'kill-buffer-and-window)
(kb "M-d c c" 'comment-or-uncomment-region)
(kb "M-d c s" 'sort-lines)
(kb "M-d d o" 'opdesk)
(kb "M-d d s" 'svdesk)
(kb "M-d f d o" 'open-user-custom-file)
(kb "M-d f d r" 'eval-buffer)
(kb "M-d w -" 'split-window-below)
(kb "M-d w /" 'split-window-right)
(kb "M-d w c +" 'enlarge-window)
(kb "M-d w c -" 'shrink-window)
(kb "M-d w d" 'delete-window)
(kb "M-d w h  +" 'enlarge-window-horizontally)
(kb "M-d w h -" 'shrink-window-horizontally)
(kb "M-n" 'flymake-goto-next-error)
(kb "M-p" 'flymake-goto-prev-error)
(provide 'keys)
;;; keys.el ends here
