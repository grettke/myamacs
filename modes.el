;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;; Text

(defun amacs-text-mode-hook-fn ()
  (visual-line-mode))

(add-hook 'text-mode-hook #'amacs-text-mode-hook-fn)

;;; Prog

(setq amacs-prog-modes '())
(setq amacs-lisp-modes
      '(emacs-lisp-mode-hook
        ielm-mode-hook
        lisp-interaction-mode-hook))
(setq amacs-prog-modes (append amacs-prog-modes amacs-lisp-modes))

(defun amacs-prog-mode-hook-fn ()
  (interactive)
  (auto-fill-mode))

;; Implementation

(add-hook 'prog-mode-hook #'amacs-prog-mode-hook-fn)

;;;; Checkdoc

(require 'checkdoc)
(setq checkdoc-package-keywords-flag t)

;;;; Emacs Lisp

(defun gcr-general-lisp-prettify ()
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
        '(("-" . ?−)
          ("*" . ?×)
          ("/" . ?÷)
          ("<=" . ?≤)
          (">=" . ?≥)
          ("sqrt" . ?√)
          ("throw" . ?🡅))))

(defun gcr-general-lisp-mode-hook-fn ()
  (gcr-general-lisp-prettify))

(mapcar
 (lambda (mode) (add-hook mode #'gcr-general-lisp-mode-hook-fn))
 amacs-lisp-modes)

(global-eldoc-mode -1)

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

(load-file "~/src/myamacs/bibtex-tgl.el")

;;;; Htmlize

(setq htmlize-output-type 'inline-css)

;;;; Window

(winner-mode)

;;;; ccrypt

(let ((path (concat (getenv "CCRYPT") "/share/emacs/site-lisp/ccrypt")))
  (add-to-list 'load-path path)
  (require 'ps-ccrypt))

;;;; Flycheck

(defun gcr-flycheck-list-errors ()
  "Show and switch to error list."
  (interactive)
  (flycheck-list-errors)
  (other-window 1))
(defhydra gcr-hydra-flycheck (:color blue :hint nil)
  "
╔═^═════════╗
║ ^Flycheck ║^ Enabled? => %(bound-and-true-p flycheck-mode)
╠═^═════════╩^══════╦═^══════^══^═╗
║ ^Admin^           ║ ^List^    ^ ║
╚═^═════^═══════════╩═^══════^══^═╝
 [_c_] Check Buffer  [_l_] List
 [_C_] Clear Buffer  [_f_] Filter
 [_t_] Toggle Mode   [_F_] Reset
 [_v_] Verify Setup   ^ ^
 [_q_] Quit
"
  ;; Admin
  ("c" flycheck-buffer :exit nil)
  ("C" flycheck-clear :exit nil)
  ("t" flycheck-mode :exit nil)
  ("v" flycheck-verify-setup)
  ("q" nil)
  ;; List
  ("l" gcr-flycheck-list-errors)
  ("f" flycheck-error-list-set-filter)
  ("F" flycheck-error-list-reset-filter)
  )

;;;; ispell

(require 'ispell)
