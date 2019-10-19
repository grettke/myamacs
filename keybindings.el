;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Key Bindings

;;; Row 4: 1...

;;left
(global-set-key (kbd "A-1") #'gcr-open-in-textedit)
(global-set-key (kbd "A-2") #'shell)
(global-set-key (kbd "A-3") #'org2blog-user-interface)
(global-set-key (kbd "A-4") #'gcr-ui-date)
;; right
(global-set-key (kbd "A--") #'gcr-insert-em-dash)
(global-set-key (kbd "C-A--") #'gcr-insert-en-dash)

;;; Row 3: Q...

;; left
(global-set-key (kbd "A-q") #'gcr-unfill-paragraph)
;;right
(global-set-key (kbd "A-y") #'kmacro-end-or-call-macro)
(global-set-key (kbd "A-u") #'find-file)
(global-set-key (kbd "A-i") #'isearch-backward)
(global-set-key (kbd "A-o") #'isearch-forward)
(global-set-key (kbd "A-p") #'pop-to-mark-command)
(global-set-key (kbd "A-\\") #'gcr-indent-buffer)

;;; Row 2: A

;;left
(global-set-key (kbd "A-f") #'vc-next-action)
;;right
(global-set-key (kbd "A-j") #'switch-to-buffer)
(global-set-key (kbd "A-k") #'execute-extended-command)
(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)
(global-set-key (kbd "A-;") #'eval-expression)
(global-set-key (kbd "A-'") #'goto-line)

;;; Row 1: Z...

;; left
(global-set-key (kbd "A-z") (kbd "C-c C-k"))
(global-set-key (kbd "A-x") 'Control-X-prefix)
(global-set-key (kbd "A-c") (kbd "C-c C-c"))
;; right
(global-set-key (kbd "A-n") #'gcr-replace-string)
(global-set-key (kbd "A-m") #'other-window)
(defun gcr-previous-window () (interactive) (other-window -1))
(global-set-key (kbd "A-,") #'gcr-previous-window)
(global-set-key (kbd "A-.") #'other-window)
