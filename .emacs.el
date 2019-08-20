;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Auroramacs

(load-file "~/src/amacs/.emacs.el")

;;;; Packages

(require 'thingatpt)

;;;; macOS

(setq ns-control-modifier 'control)
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'hyper)
(setq ns-right-control-modifier 'alt)
(setq ns-right-command-modifier 'super)
(setq ns-right-alternate-modifier 'none)

;;;; Utility Functions

(defun gcr-recenter-line-near-top()
  (let ((recenter-positions '(5)))
    (recenter-top-bottom)))

(defun gcr-switch-to-previous-buffer () (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun gcr-vc-next-action ()
  (interactive)
  "Maybe close Org source block before calling `vc-next-action'."
  (when (condition-case nil (org-src-edit-buffer-p) (error nil))
    (org-edit-src-exit))
  (vc-next-action nil))

(defun gcr-beginning-of-line-dwim ()
  (let ((start-position (point)))
    (move-beginning-of-line nil)
    (when (= (point) start-position)
      (back-to-indentation))))

(defun gcr-unfill-paragraph (&optional region)
  (interactive (progn (barf-if-buffer-read-only) (list t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

;;;; Occur

(define-key occur-mode-map (kbd "n") #'next-logical-line)
(define-key occur-mode-map (kbd "p") #'previous-logical-line)
(add-hook 'occur-mode-find-occurrence-hook #'gcr-recenter-line-near-top)

(defun gcr-occur-dwim ()
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

;;;; Different Configurations

(load-file "gcr-org2blog.el")

;;;; Keymaps

;;; Key Bindings

;; Row 5: F1...

;; Row 4: 1...

(global-set-key (kbd "A-~") #'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "A-`") #'kmacro-end-or-call-macro)

(global-set-key (kbd "A-q") #'gcr-unfill-paragraph)

(global-set-key (kbd "A-p") (lambda () (interactive) (other-window -1)))

;; Row 2: A...

(global-set-key (kbd "A-f") 'Control-X-prefix)

(global-set-key (kbd "A-j") #'switch-to-buffer)

(global-set-key (kbd "A-k") #'execute-extended-command)

(global-set-key (kbd "A-;") #'eval-expression)

(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)

;; Row 1: Z...

(global-set-key (kbd "A-n") #'other-window)

;; Row 0: Ctrl...
