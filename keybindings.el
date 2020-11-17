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
(global-set-key (kbd "A-8") #'ispell)
(global-set-key (kbd "A-9") #'gcr-hydra-flycheck/body)
(global-set-key (kbd "A--") #'gcr-insert-em-dash)
(global-set-key (kbd "A-_") #'gcr-toggle-copy-region)
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
(global-set-key (kbd "A-i") #'other-window)
(global-set-key (kbd "A-o") #'narrow-to-region)
(global-set-key (kbd "A-p") #'pop-to-mark-command)
(global-set-key (kbd "M-A-p") #'flycheck-previous-error)
(global-set-key (kbd "A-\\") #'gcr-indent-buffer)

;;; Row 2: A

;;left
(global-set-key (kbd "A-a") (kbd "C-c C-k"))
(global-set-key (kbd "A-s") 'Control-X-prefix)
(global-set-key (kbd "A-d") (kbd "C-c C-c"))
(global-set-key (kbd "A-f") #'vc-next-action)
(global-set-key (kbd "A-g") #'gcr-hydra-ag/body)
;;right
(global-set-key (kbd "A-h") #'org-mark-element)
(global-set-key (kbd "A-j") #'switch-to-buffer)
(global-set-key (kbd "A-k") #'execute-extended-command)
(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)
(global-set-key (kbd "A-;") #'eval-expression)

;;; Row 1: Z...

;; left
(global-set-key (kbd "A-z") #'kill-this-buffer)
;; right
(global-set-key (kbd "A-n") #'dabbrev-expand)
(global-set-key (kbd "M-A-n") #'flycheck-next-error)
(global-set-key (kbd "A-m") #'isearch-forward)
(global-set-key (kbd "A-,") #'gcr-previous-window)
(global-set-key (kbd "A-.") #'other-window)

;;;; Org mode
;;; Left
(define-key org-mode-map (kbd "H-q") #'org-archive-subtree-default)
(define-key org-mode-map (kbd "H-e") #'gcr-org-refile)
(define-key org-mode-map (kbd "H-r") #'org-sort)
(define-key org-mode-map (kbd "H-t") #'org-todo)
(define-key org-mode-map (kbd "H-o") #'org-narrow-to-element)
;;; Right
;; Row 4
(define-key org-mode-map (kbd "H-8") #'org-babel-remove-result)
(define-key org-mode-map (kbd "H-9") #'org-babel-remove-inline-result)
;; Row 3
(define-key org-mode-map (kbd "H-A-i") #'org-metaup)
(define-key org-mode-map (kbd "H-M-i") #'org-shiftmetaup)
;; Row 2
(define-key org-mode-map (kbd "H-A-h") #'org-metaleft)
(define-key org-mode-map (kbd "H-M-h") #'org-shiftmetaleft)
(define-key org-mode-map (kbd "H-A-j") #'org-metadown)
(define-key org-mode-map (kbd "H-M-j") #'org-shiftmetadown)
(define-key org-mode-map (kbd "H-A-k") #'org-metaup)
(define-key org-mode-map (kbd "H-M-k") #'org-shiftmetaup)
(define-key org-mode-map (kbd "H-A-l") #'org-metaright)
(define-key org-mode-map (kbd "H-M-l") #'org-shiftmetaright)
;; Row 1
(define-key org-mode-map (kbd "H-A-m") #'org-mark-element)
(define-key org-mode-map (kbd "H-<") (lambda () (interactive) (insert "⟪")))
(define-key org-mode-map (kbd "H->") (lambda () (interactive) (insert "⟫")))
