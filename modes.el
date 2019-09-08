;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Checkdoc

(require 'checkdoc)
(setq checkdoc-package-keywords-flag t)

;;;; Emacs Lisp

(defun gcr-general-lisp-prettify ()
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
        '(("nil" . ?∅)
          ("*" . ?×)
          ("/" . ?÷)
          ("<=" . ?≤)
          (">=" . ?≥)
          ("lambda" . ?λ)
          ("not" . ?¬)
          ("and" . ?∧)
          ("or" . ?∨)
          ("sqrt" . ?√)
          ("throw" . ?🠩))))

(defun gcr-general-lisp-mode-hook-fn ()
  (gcr-general-lisp-prettify))

(mapcar
 (lambda (mode) (add-hook mode #'gcr-general-lisp-mode-hook-fn))
 amacs-lisp-modes)

;;;; Shell-script

(defun gcr-shell-script-mode-hook-fn ()
  (interactive)
  (setq sh-basic-offset 2))

(add-hook 'sh-mode-hook #'gcr-shell-script-mode-hook-fn)

;;;; Conf

(defun gcr-conf-unix-mode-hook-fn ()
  (interactive)
  (remove-hook 'before-save-hook #'gcr-indent-buffer))

(add-hook 'conf-unix-mode-hook #'gcr-conf-unix-mode-hook-fn)

;;;; BibTeX

(load-file "~/src/myamacs/bibtex.el")

;;;; Htmlize

(setq htmlize-output-type 'inline-css)

;;;; Say

(defun say--line (&optional line)
  "Say current line."
  (interactive)
  (setq line (or line (thing-at-point 'line)))
  (start-process "say" nil "say" line))

(defun say--next-line ()
  "Say next line."
  (interactive)
  (next-line)
  (say--line))

(defun say--previous-line ()
  "Say previous line."
  (interactive)
  (previous-line)
  (say--line))

(define-minor-mode say-mode
  "Toggle Say mode.

Interactively with no argument, this command toggles the mode.
A positive prefix argument enables the mode, any other prefix
argument disables it. From Lisp, argument omitted or nil enables
the mode, `toggle' toggles the state.

Say mode asynchronously sends the current line of text to the
system `say' command.

When enabled Say mode makes the buffer read-only by enabling
`read-only-mode'. When disabled Say mode makes the buffer read-write by
disabling `read-only-mode'.

TODO: Handle starting in read only mode
TODO: make balanced rigth and left hand bindings and document it
TODO: Warn how to handle not working, try command manually, note macos dash breaks

When Say mode is enabled this is the keymap:
- l: say the current line.
- j: move the cursor down one line and say the line.
- n: move the cursor down one line.
- k: move the cursor up one line and say the line.
- p: move the cursor up one line.
- u or q: toggle the mode."
  :lighter " Say"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "l") #'say--line)
            (define-key map (kbd "j") #'say--next-line)
            (define-key map (kbd "n") #'next-line)
            (define-key map (kbd "k") #'say--previous-line)
            (define-key map (kbd "p") #'previous-line)
            (define-key map (kbd "u") #'say-mode)
            (define-key map (kbd "q") #'say-mode)
            map)
  (read-only-mode (if (bound-and-true-p say-mode) 1 0)))
