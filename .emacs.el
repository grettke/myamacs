;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; (package-initialize)

(load-file "~/src/amacs/.emacs.el")
(load-file "~/src/myamacs/projects.el")
(load-file "~/src/myamacs/org.el")
(load-file "~/src/myamacs/org2blog.el")
(load-file "~/src/myamacs/bibtex-tgl.el")
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

(define-key occur-mode-map (kbd "n") #'next-logical-line)
(define-key occur-mode-map (kbd "p") #'previous-logical-line)
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

;;;; Key Bindings

;;; Row 4: 1...

(global-set-key [(alt ?9)] #'owp-complete)
(global-set-key [(alt ?0)] #'owp-user-interface)
(global-set-key [(alt ?-)] #'gcr-open-in-textedit)
(global-set-key [(alt ?=)] #'say-mode)

;;; Row 3: Q...

(global-set-key (kbd "A-q") #'gcr-unfill-paragraph)

(global-set-key (kbd "A-e") #'kmacro-end-or-call-macro)

(global-set-key (kbd "A-r") #'gcr-replace-string)

(global-set-key (kbd "A-t") #'gcr-ui-date)

(global-set-key (kbd "A-p") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "A-o") #'find-file)

(global-set-key (kbd "A-\\") #'gcr-indent-buffer)

;;; Row 2: A...

(global-set-key (kbd "A-a") #'gcr-beginning-of-line-dwim)

(global-set-key (kbd "A-s") #'shell)

(global-set-key (kbd "A-f") 'Control-X-prefix)

(global-set-key (kbd "A-g") #'gcr-occur-dwim)

(global-set-key (kbd "A-j") #'switch-to-buffer)

(global-set-key (kbd "A-k") #'execute-extended-command)

(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)

(global-set-key (kbd "A-;") #'eval-expression)

;;; Row 1: Z...

(global-set-key (kbd "A-c") (kbd "C-c C-c"))

(global-set-key (kbd "A-b") #'keyboard-quit)

(global-set-key (kbd "A-n") #'other-window)
