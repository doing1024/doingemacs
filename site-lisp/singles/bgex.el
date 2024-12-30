;;; bgex.el --- Emacs-BGEX patch convenience functions -*- lexical-binding: t -*-

;; Copyright (C) 2003-2021 Tadashi Watanabe <twacc2020@gmail.com>
;;
;; Author: Tadashi Watanabe <twacc2020@gmail.com>
;; Maintainer: Tadashi Watanabe <twacc2020@gmail.com>
;; URL: https://github.com/wachikun/emacs_bgex
;; Homepage: https://github.com/wachikun/emacs_bgex
;; Version: 0.1.0
;; Keywords: tools
;;
;; SPDX-License-Identifier: GPL-2.0-or-later

;;; Commentary:

;;; Code:

(defvar bgex--id-default nil)
(defvar bgex--initialized-p nil)

(defun bgex--initialize ()
  "Initialize The BGEX."
  (when (not bgex--initialized-p)
    (add-hook 'dired-mode-hook
              (lambda ()
                (define-key dired-mode-map "s" 'bgex-dired-sort-wrapper)))
    (setq bgex--initialized-p t)))


(bgex--initialize)


(defun bgex--bgexid-default-bg-registered-p ()
  "Returns non-nil if the default background image has been registered."
  (let ((list (bgexid-get-bgexid-list))
        (i 0)
        (id))
    (catch 'loop
      (while (setq id (nth i list))
        (let ((ilist (bgexid-get-identifier id)))
          (when (assq 'bgex-identifier-type-default ilist)
            (throw 'loop t))
          (setq i (1+ i))))
      (throw 'loop nil))))

(defun bgex--bgexid-bg-registered-p (identifier type)
  "Returns non-nil if the specified background image has been registered."
  (let ((list (bgexid-get-bgexid-list))
        (i 0)
        (id))
    (catch 'loop
      (while (setq id (nth i list))
        (let ((ilist (bgexid-get-identifier id)))
          (when (and (assq type ilist)
                     (string= (cdr (assq type ilist))
                              identifier))
            (throw 'loop id))
          (setq i (1+ i))))
      (throw 'loop nil))))

(defun bgex-enable ()
  "Enables BGEX."
  (interactive)
  (if (string= window-system "x")
      (progn
        (bgexi-enable)
        (redraw-display))
    (message "Emacs is not running under a X window system.")))

(defun bgex-disable ()
  "Disables BGEX."
  (interactive)
  (if (string= window-system "x")
      (progn
        (bgexi-disable)
        (redraw-display)
        (sit-for 0.1)
        (redraw-display))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-image (identifier type filename &optional dynamic-color-p)
  "Sets the background image for each windows.
IDENTIFIER is a string to identify the window, and sets the major mode or buffer name.
TYPE can be set to 'bgex-identifier-type-major-mode or 'bgex-identifier-type-buffer-name.
    'bgex-identifier-type-major-mode          (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-major-mode-regexp   (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-buffer-name         (Treats the identifier as a buffer name.)
    'bgex-identifier-type-buffer-name-regexp  (Treats the identifier as a buffer name.)
FILENAME is the image file name.
If DYNAMIC-COLOR-P is non-nil, it sets the dynamic color generation mode."
  (interactive)
  (unless (file-readable-p filename)
    (error "file \"%s\" not found." filename))
  (if (string= window-system "x")
      (progn
        (let ((getid (bgex--bgexid-bg-registered-p identifier type)))
          (if getid
              (progn
                (let ((color (bgexi-get-color getid)))
                  (bgexi-restart getid
                                 t
                                 dynamic-color-p
                                 color
                                 (expand-file-name filename)))
                (redraw-display)
                getid)
            (let ((id (bgexid-create identifier type)))
              (if id
                  (if (bgexi-create id
                                    t
                                    dynamic-color-p
                                    "white"
                                    (expand-file-name filename))
                      (message "bgexi-create failed.")
                    (redraw-display)
                    id)
                (error "Internal error."))))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-color (identifier type color &optional dynamic-color-p)
  "Sets the background color for each windows.
IDENTIFIER is a string to identify the window, and sets the major mode or buffer name.
TYPE can be set to 'bgex-identifier-type-major-mode or 'bgex-identifier-type-buffer-name.
    'bgex-identifier-type-major-mode          (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-major-mode-regexp   (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-buffer-name         (Treats the identifier as a buffer name.)
    'bgex-identifier-type-buffer-name-regexp  (Treats the identifier as a buffer name.)
COLOR can be set to a string representing a color name, or a list such as '(r g b)'.
r, g, and b are integers and can take values between 0 and 65535.
If DYNAMIC-COLOR-P is non-nil, it sets the dynamic color generation mode."
  (interactive)
  (if (string= window-system "x")
      (progn
        (let ((getid (bgex--bgexid-bg-registered-p identifier type)))
          (if getid
              (progn
                (let ((filename (bgexi-get-image-filename getid)))
                  (bgexi-restart getid nil dynamic-color-p color
                                 filename))
                (redraw-display)
                getid)
            (let ((id (bgexid-create identifier type)))
              (if id
                  (if (bgexi-create id nil dynamic-color-p color
                                    nil)
                      (message "bgexi-create failed.")
                    (redraw-display)
                    id)
                (error "Internal error."))))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-xpm-string (identifier type xpm-string &optional dynamic-color-p)
  "Sets the background image for each windows.
IDENTIFIER is a string to identify the window, and sets the major mode or buffer name.
TYPE can be set to 'bgex-identifier-type-major-mode or 'bgex-identifier-type-buffer-name.
    'bgex-identifier-type-major-mode          (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-major-mode-regexp   (Treats the identifier as a major-mode name.)
    'bgex-identifier-type-buffer-name         (Treats the identifier as a buffer name.)
    'bgex-identifier-type-buffer-name-regexp  (Treats the identifier as a buffer name.)
XPM-STRING is the XPM image.
If DYNAMIC-COLOR-P is non-nil, it sets the dynamic color generation mode."
  (interactive)
  (if (string= window-system "x")
      (progn
        (let ((getid (bgex--bgexid-bg-registered-p identifier type)))
          (if getid
              (progn
                (let ((color (bgexi-get-color getid)))
                  (bgexi-restart-for-xpm-string getid t dynamic-color-p
                                                color xpm-string))
                (redraw-display)
                getid)
            (let ((id (bgexid-create identifier type)))
              (if id
                  (if (bgexi-create-for-xpm-string id t dynamic-color-p
                                                   "white" xpm-string)
                      (message "bgexi-create failed.")
                    (redraw-display)
                    id)
                (error "Internal error."))))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-destroy (identifier type)
  "Discards the specified background."
  (interactive)
  (if (string= window-system "x")
      (progn
        (let ((getid (bgex--bgexid-bg-registered-p identifier type)))
          (when getid
            (bgexid-destroy getid)
            (redraw-display)
            getid)))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-dynamic-color-flag (bgexid flag)
  "Set the dynamic color generation mode flag for the specified background.
If FLAG is non-nil, it sets the dynamic color generation mode."
  (interactive)
  (redraw-display)
  (bgexi-set-dynamic-color-flag bgexid flag)
  (redraw-display))

(defun bgex-get-dynamic-color-flag (bgexid)
  "Get the dynamic color generation mode flag for the specified background."
  (interactive)
  (bgexi-get-dynamic-color-flag bgexid))

(defun bgex-set-image-default (filename &optional dynamic-color-p)
  "Sets the default background image."
  (interactive)
  (unless (file-readable-p filename)
    (error "file \"%s\" not found." filename))
  (if (string= window-system "x")
      (progn
        (when (and (not (car (nth 0
                                  (bgexid-get-identifier 0))))
                   (or (> (length (bgexid-get-bgexid-list)) 0)
                       (> (length (bgexi-get-bgexid-list)) 0)))
          (error "Cant set default image."))
        (if (bgex--bgexid-default-bg-registered-p)
            (progn
              (let ((color (bgexi-get-color bgex--id-default)))
                (bgexi-restart bgex--id-default
                               t
                               dynamic-color-p
                               color
                               (expand-file-name filename)))
              (redraw-display)
              0)
          (let ((id (bgexid-create nil 'bgex-identifier-type-default)))
            (if id
                (if (bgexi-create id
                                  t
                                  dynamic-color-p
                                  "white"
                                  (expand-file-name filename))
                    (message "bgexi-create failed.")
                  (setq bgex--id-default id)
                  (redraw-display)
                  0)
              (error "Internal error.")))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-color-default (color &optional dynamic-color-p)
  "Sets the default background color."
  (interactive)
  (if (string= window-system "x")
      (progn
        (when (and (not (car (nth 0
                                  (bgexid-get-identifier 0))))
                   (or (> (length (bgexid-get-bgexid-list)) 0)
                       (> (length (bgexi-get-bgexid-list)) 0)))
          (error "Cant set default color."))
        (if (bgex--bgexid-default-bg-registered-p)
            (progn
              (let ((filename (bgexi-get-image-filename bgex--id-default)))
                (bgexi-restart bgex--id-default nil dynamic-color-p
                               color filename))
              (redraw-display)
              0)
          (let ((id (bgexid-create nil 'bgex-identifier-type-default)))
            (if id
                (if (bgexi-create id nil dynamic-color-p color
                                  nil)
                    (message "bgexi-create failed.")
                  (setq bgex--id-default id)
                  (redraw-display)
                  0)
              (error "Internal error.")))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-xpm-string-default (xpm-string &optional dynamic-color-p)
  "Sets the default background image."
  (interactive)
  (if (string= window-system "x")
      (progn
        (when (and (not (car (nth 0
                                  (bgexid-get-identifier 0))))
                   (or (> (length (bgexid-get-bgexid-list)) 0)
                       (> (length (bgexi-get-bgexid-list)) 0)))
          (error "Cant set default image."))
        (if (bgex--bgexid-default-bg-registered-p)
            (progn
              (let ((color (bgexi-get-color bgex--id-default)))
                (bgexi-restart-for-xpm-string bgex--id-default
                                              t dynamic-color-p color xpm-string))
              (redraw-display)
              0)
          (let ((id (bgexid-create nil 'bgex-identifier-type-default)))
            (if id
                (if (bgexi-create-for-xpm-string id t dynamic-color-p
                                                 "white" xpm-string)
                    (message "bgexi-create failed.")
                  (setq bgex--id-default id)
                  (redraw-display)
                  0)
              (error "Internal error.")))))
    (message "Emacs is not running under a X window system.")))

(defun bgex-destroy-default ()
  "Discard the default background."
  (interactive)
  (if (string= window-system "x")
      (progn
        (if bgex--id-default
            (progn
              (bgexid-destroy bgex--id-default)
              (setq bgex--id-default nil)
              (redraw-display)
              0)
          (message "BGEX is not used.")))
    (message "Emacs is not running under a X window system.")))

(defun bgex-set-dynamic-color-flag-default (flag)
  "Sets the dynamic color generation mode flag for the default background."
  (interactive)
  (if (string= window-system "x")
      (progn
        (redraw-display)
        (bgexi-set-dynamic-color-flag bgex--id-default
                                      flag)
        (redraw-display))
    (message "Emacs is not running under a X window system.")))

(defun bgex-destroy-all ()
  "Discards the all background."
  (interactive)
  (if (string= window-system "x")
      (progn
        (let ((list (bgexid-get-bgexid-list))
              (i 0)
              (id))
          (while (setq id (nth i list))
            (bgexid-destroy id)
            (setq i (1+ i)))
          (redraw-display)
          i))
    (message "Emacs is not running under a X window system.")))

(defun bgex-dired-sort-wrapper (&optional arg)
  (interactive "P")
  (dired-sort-toggle-or-edit arg)
  (bgexi-redraw-window (selected-window)))

(provide 'bgex)

;;; bgex.el ends here
