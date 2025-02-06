;;; Code:
(defun doing-translate-to-english ()
  "将输入内容或选中内容翻译为英文.
如果没有选中内容，则提示输入要翻译的文本."
  (interactive)
  (if (use-region-p)
      (setq tmp (buffer-substring-no-properties (region-beginning) (region-end)))
    (setq tmp (read-string "Enter the text to be translated to English: ")))
  (shell-command (format "%s -b -e bing -s zh -t en '%s'" doingemacs-translate-excute tmp) "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (setq doing-translate-context (buffer-string))
  (kill-buffer-and-window)
  (kill-new doing-translate-context))

(defun doing-translate-to-chinese ()
  "将输入内容或选中内容翻译为中文.
如果没有选中内容，则提示输入要翻译的文本."
  (interactive)
  (if (use-region-p)
      (setq tmp (buffer-substring-no-properties (region-beginning) (region-end)))
    (setq tmp (read-string "Enter the text to be translated to Chinese: ")))
  (shell-command (format "%s %s '%s'" doingemacs-translate-excute doing-translate-args tmp) "*doing-translate*")
  (switch-to-buffer-other-window "*doing-translate*")
  (setq doing-translate-context (buffer-string))
  (kill-buffer-and-window)
  (kill-new doing-translate-context))
(kb "M-d t c" 'doing-translate-to-chinese)
(kb "M-d t e" 'doing-translate-to-english)

(provide 'doing-translate)
;;; doing-translate.el ends here
