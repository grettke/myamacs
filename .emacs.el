;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; (package-initialize)

(require 'thingatpt)
(require 'zone)
(require 'subr-x)
(require 'seq)

(and (load-file "~/src/lolsmacs/lolsmacs.el")
     (lolsmacs-init))
(load-file "~/src/myamacs/projects.el")
(load-file "~/src/myamacs/org.el")
(load-file "~/src/maccadet/maccadet.el")

(load-file "~/src/myamacs/logging.el")
(load-file "~/src/myamacs/utility.el")
(load-file "~/src/myamacs/user-interfaces.el")
(load-file "~/src/myamacs/org2blog.el")
(load-file "~/src/myamacs/package.el")
(load-file "~/src/myamacs/applications.el")
(load-file "~/src/myamacs/modes.el")

;;;; Operations

(put #'narrow-to-region 'disabled nil)

(defun gcr-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
               (y-or-n-p (format "Directory `%s' does not exist. Create it?" parent-directory)))
      (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions
             #'gcr-create-non-existent-directory)

(define-key global-map [remap move-beginning-of-line] 'gcr-beginning-of-line-dwim)
(define-key global-map [remap occur] 'gcr-occur-dwim)

;;;; Aliases

(defun swh () (interactive) (split-window-horizontally))
(defun swv () (interactive) (split-window-vertically))
(defun os () (interactive) (org-sort))
(defalias 'rs 'replace-string)
(defalias 'otic 'org-table-insert-column)
(defalias 'otdc 'org-table-delete-column)
(defalias 'vfcm 'visual-fill-column-mode)
(defalias 'eb 'eval-buffer)

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

(winner-mode)

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

(load-theme 'leuven)
(setq blink-matching-paren nil)

