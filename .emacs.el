;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; (package-initialize)

(load-file "~/src/auroramacs/.emacs.el")
(load-file "~/src/myamacs/projects.el")
(load-file "~/src/myamacs/org.el")
(load-file "~/src/myamacs/org2blog.el")
(load-file "~/src/maccadet/maccadet.el")

(require 'thingatpt)
(require 'zone)
(require 'subr-x)

(load-file "~/src/myamacs/logging.el")
(load-file "~/src/myamacs/utility.el")
(load-file "~/src/myamacs/modes.el")
(load-file "~/src/myamacs/user-interfaces.el")
(load-file "~/src/myamacs/package.el")

;;;; Operations

(put #'narrow-to-region 'disabled nil)

(defun gcr-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist. Create it?" parent-directory)))
      (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions
             #'gcr-create-non-existent-directory)

(define-key global-map [remap replace-string] 'gcr-replace-string)

;;; Content

(defun gcr-warn-if-utf-8-bom ()
  (let ((name (symbol-name buffer-file-coding-system)))
    (when (string-match-p "utf-8-with-signature" name)
      (warn "This UTF-8 file has a BOM."))))

(add-hook 'find-file-hook #'gcr-warn-if-utf-8-bom)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(add-hook 'before-save-hook #'gcr-untabify-buffer)
(add-hook 'before-save-hook #'gcr-indent-buffer)
(add-hook 'before-save-hook #'gcr-delete-trailing-whitespace)

;; Occur

(define-key occur-mode-map (kbd "n") #'next-line)
(define-key occur-mode-map (kbd "p") #'previous-line)
(add-hook 'occur-mode-find-occurrence-hook #'gcr-recenter-line-near-top)

(defun gcr-occur-dwim ()
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur)
  (other-window 1))

(load-file "~/src/myamacs/keybindings.el")
