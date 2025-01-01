;;; Code:
(defvar doing-translate-map nil
  "Keymap used when popup is shown.")

(setq doing-translate-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "q") #'kill-buffer-and-window)
        map))

(define-minor-mode doing-translate-mode
  "doing translate mode."
  :keymap doing-translate-map
  :init-value nil)


(defun doing-translate-to-english (str)
  "将输入内容（STR）翻译为英文."
  (interactive "MEnter the text to be translated to English: ")
  (async-shell-command (format "trans -t en '%s'" str) "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (doing-translate-mode 1))

(defun doing-translate-to-chinese (str)
  "将输入内容（STR）翻译为中文."
  (interactive "MEnter the text to be translated to Chinese: ")
  (async-shell-command (format "trans '%s'" str)  "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (doing-translate-mode 1))
(kb "M-d t c" 'doing-translate-to-chinese)
(kb "M-d t e" 'doing-translate-to-english)

(provide 'doing-translate)
;;; doing-translate.el ends here
