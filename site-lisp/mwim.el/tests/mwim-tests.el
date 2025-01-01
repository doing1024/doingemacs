;;; mwim-tests.el --- Tests for MWIM package

;; Copyright © 2016 Alex Kost <alezost@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file provides some tests to check that the point appears on the
;; right positions after calling MWIM commands.
;;
;; These tests can be run like this:
;;
;;   cd /path/to/mwim
;;   emacs -Q -nw -L . --batch --eval '(progn (load-file "tests/mwim-tests.el") (ert-run-tests-batch-and-exit))'

;;; Code:

(require 'ert)
(require 'mwim)

(defvar mwim-test-elisp-sample
  '(emacs-lisp-mode . "\
  hello    ; comment
      ;; another comment
something  
"))

(defvar mwim-test-c-sample
  '(c-mode . "\
int foo;  /* comment */
  // foo  
// foo   
"))

(defmacro mwim-test-with-sample (sample &rest body)
  (declare (debug t) (indent 1))
  `(with-temp-buffer
     (funcall (car ,sample))
     (insert (cdr ,sample))
     (goto-char (point-min))
     ,@body))

(defun mwim-test-fancy-move ()
  (mwim-goto-next-position
    (mwim-line-comment-beginning)
    (mwim-line-end)
    (+ 7 (line-beginning-position))
    (mwim-code-beginning)
    (mwim-code-end)))

(ert-deftest mwim-test-beginning-of-line-or-code ()
  (mwim-test-with-sample mwim-test-elisp-sample
    (mwim-beginning-of-line-or-code)
    (should (= (point) 3))
    (mwim-beginning-of-line-or-code 1)
    (should (= (point) 22))
    (mwim-beginning-of-line-or-code)
    (should (= (point) 28))
    (mwim-beginning-of-line-or-code)
    (should (= (point) 22))))

(ert-deftest mwim-test-beginning-of-code-or-line-or-comment ()
  (mwim-test-with-sample mwim-test-elisp-sample
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 14))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 3))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 1))
    (mwim-beginning-of-code-or-line-or-comment 2)
    (should (= (point) 47))
    (mwim-beginning-of-code-or-line-or-comment -1)
    (should (= (point) 28))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 22))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 31)))

  (mwim-test-with-sample mwim-test-c-sample
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 14))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 1))
    (mwim-beginning-of-code-or-line-or-comment 1)
    (should (= (point) 27))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 25))
    (mwim-beginning-of-code-or-line-or-comment)
    (should (= (point) 30))))

(ert-deftest mwim-test-end-of-code-or-line ()
  (mwim-test-with-sample mwim-test-elisp-sample
    (mwim-end-of-code-or-line)
    (should (= (point) 8))
    (mwim-end-of-code-or-line)
    (should (= (point) 21))
    (mwim-end-of-code-or-line 2)
    (should (= (point) 56))
    (mwim-end-of-code-or-line)
    (should (= (point) 58))
    (mwim-end-of-code-or-line -1)
    (should (= (point) 46))
    (mwim-end-of-code-or-line)
    (should (= (point) 46)))

  (mwim-test-with-sample mwim-test-c-sample
    (mwim-end-of-code-or-line)
    (should (= (point) 9))
    (mwim-end-of-code-or-line)
    (should (= (point) 24))
    (mwim-end-of-code-or-line 1)
    (should (= (point) 33))
    (mwim-end-of-code-or-line)
    (should (= (point) 35))
    (mwim-end-of-code-or-line 1)
    (should (= (point) 42))
    (mwim-end-of-code-or-line)
    (should (= (point) 45))))

(ert-deftest mwim-test-mwim ()
  (mwim-test-with-sample mwim-test-elisp-sample
    (mwim)
    (should (= (point) 3))
    (mwim)
    (should (= (point) 8))
    (mwim)
    (should (= (point) 14))
    (mwim t)
    (should (= (point) 8))
    (mwim)
    (should (= (point) 14))
    (mwim)
    (should (= (point) 21))
    (mwim)
    (should (= (point) 1))
    (mwim t)
    (should (= (point) 21))

    (forward-line)
    (forward-char)
    (mwim)
    (should (= (point) 22))
    (mwim)
    (should (= (point) 28))
    (mwim)
    (should (= (point) 31))
    (mwim)
    (should (= (point) 46))))

(ert-deftest mwim-test-fancy ()
  (mwim-test-with-sample mwim-test-elisp-sample
    (mwim-test-fancy-move)
    (should (= (point) 12))
    (mwim-test-fancy-move)
    (should (= (point) 21))
    (mwim-test-fancy-move)
    (should (= (point) 8))
    (mwim-test-fancy-move)
    (should (= (point) 3))
    (mwim-test-fancy-move)
    (should (= (point) 12))

    (forward-line)
    (mwim-test-fancy-move)
    (should (= (point) 28))
    (mwim-test-fancy-move)
    (should (= (point) 46))
    (mwim-test-fancy-move)
    (should (= (point) 29))
    (mwim-test-fancy-move)
    (should (= (point) 28))

    (forward-line)
    (mwim-test-fancy-move)
    (should (= (point) 56))
    (mwim-test-fancy-move)
    (should (= (point) 58))
    (mwim-test-fancy-move)
    (should (= (point) 54))
    (mwim-test-fancy-move)
    (should (= (point) 47)))

  (mwim-test-with-sample mwim-test-c-sample
    (mwim-test-fancy-move)
    (should (= (point) 9))
    (mwim-test-fancy-move)
    (should (= (point) 11))
    (mwim-test-fancy-move)
    (should (= (point) 24))
    (mwim-test-fancy-move)
    (should (= (point) 8))
    (mwim-test-fancy-move)
    (should (= (point) 1))

    (forward-line)
    (mwim-test-fancy-move)
    (should (= (point) 27))
    (mwim-test-fancy-move)
    (should (= (point) 35))
    (mwim-test-fancy-move)
    (should (= (point) 32))
    (mwim-test-fancy-move)
    (should (= (point) 33))))

(provide 'mwim-tests)

;;; mwim-tests.el ends here
