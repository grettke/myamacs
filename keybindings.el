;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Global Key Bindings

;;; Row 4: 1...

;;left
(global-set-key (kbd "A-1") #'gcr-open-in-textedit)
(global-set-key (kbd "A-2") #'shell)
(global-set-key (kbd "A-3") #'org2blog-user-interface)
(global-set-key (kbd "H-A-3") #'org2blog-complete)
(global-set-key (kbd "A-4") #'gcr-ui-date)
;; right
(global-set-key (kbd "A--") #'gcr-insert-em-dash)
(global-set-key (kbd "C-A--") #'gcr-insert-en-dash)

;;; Row 3: Q...

;; left
(global-set-key (kbd "A-q") #'gcr-unfill-paragraph)
(global-set-key (kbd "A-w") #'widen)
(global-set-key (kbd "A-e") #'goto-line)
(global-set-key (kbd "A-r") #'gcr-occur-dwim)
(global-set-key (kbd "A-t") (lambda () (interactive) (insert "~/")))
;;right
(global-set-key (kbd "A-y") #'kmacro-end-or-call-macro)
(global-set-key (kbd "A-u") #'find-file)
(global-set-key (kbd "A-i") #'isearch-backward)
(global-set-key (kbd "A-o") #'isearch-forward)
(global-set-key (kbd "A-p") #'pop-to-mark-command)
(global-set-key (kbd "A-\\") #'gcr-indent-buffer)

;;; Row 2: A

;;left
(global-set-key (kbd "A-a") (kbd "C-c C-k"))
(global-set-key (kbd "A-s") 'Control-X-prefix)
(global-set-key (kbd "A-d") (kbd "C-c C-c"))
(global-set-key (kbd "A-f") #'vc-next-action)
;;right
(global-set-key (kbd "A-j") #'switch-to-buffer)
(global-set-key (kbd "A-k") #'execute-extended-command)
(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)
(global-set-key (kbd "A-;") #'eval-expression)
(global-set-key (kbd "A-'") #'goto-line)

;;; Row 1: Z...

;; left
(global-set-key (kbd "A-z") #'kill-this-buffer)
;; right
(global-set-key (kbd "A-n") #'gcr-replace-string)
(global-set-key (kbd "A-m") #'other-window)
(global-set-key (kbd "A-,") #'gcr-previous-window)
(global-set-key (kbd "A-.") #'other-window)

;;;; Org mode

;;; Right
;; Row 3
(define-key org-mode-map (kbd "H-w") #'org-id-new)
(define-key org-mode-map (kbd "H-A-y") #'org-archive-subtree-default)
(define-key org-mode-map (kbd "H-A-u") #'gcr-org-refile)
(define-key org-mode-map (kbd "H-A-i") #'org-metaup)
(define-key org-mode-map (kbd "H-M-i") #'org-shiftmetaup)
(define-key org-mode-map (kbd "H-A-o") #'org-sort)
;; Row 2
(define-key org-mode-map (kbd "H-A-h") #'org-todo)
(define-key org-mode-map (kbd "H-A-j") #'org-metaleft)
(define-key org-mode-map (kbd "H-M-j") #'org-shiftmetaleft)
(define-key org-mode-map (kbd "H-A-k") #'org-metadown)
(define-key org-mode-map (kbd "H-M-k") #'org-shiftmetadown)
(define-key org-mode-map (kbd "H-A-l") #'org-metaright)
(define-key org-mode-map (kbd "H-M-l") #'org-shiftmetaright)
;; Row 1
(define-key org-mode-map (kbd "H-A-n") #'org-narrow-to-element)
(define-key org-mode-map (kbd "H-A-m") #'org-mark-element)
