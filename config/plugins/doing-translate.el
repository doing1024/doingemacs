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


(defun doing-translate-to-english ()
  "将输入内容或选中内容翻译为英文.
如果没有选中内容，则提示输入要翻译的文本."
  (interactive)
  (if (use-region-p)
        (setq tmp (buffer-substring-no-properties (region-beginning) (region-end)))
      (setq tmp (read-string "Enter the text to be translated to English: ")))
  (shell-command (format "crow -b -e bing -s zh -t en '%s'" tmp) "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (setq doing-translate-context (buffer-string))
  (kill-buffer-and-window)
  (kill-new doing-translate-context))

(defun doing-translate-to-chinese (str)
  "将输入内容（STR）翻译为中文."
  (interactive "MEnter the text to be translated to Chinese: ")
  (async-shell-command (format "crow -e bing -b '%s'" str)  "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (doing-translate-mode 1))
(kb "M-d t c" 'doing-translate-to-chinese)
(kb "M-d t e" 'doing-translate-to-english)

(provide 'doing-translate)
;;; doing-translate.el ends here
