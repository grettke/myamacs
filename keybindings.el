;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Key Bindings

;;; Row 4: 1...

;; Modes

(global-set-key (kbd "A-4") #'org2blog-user-interface)

;;;;;; TO process

(global-set-key (kbd "A--") #'gcr-insert-em-dash)
(global-set-key (kbd "C-A--") #'gcr-insert-en-dash)
(global-set-key (kbd "A-=") #'gcr-open-in-textedit)

;;; Row 3: Q...

(global-set-key (kbd "C-A-q") #'gcr-unfill-paragraph)

(global-set-key (kbd "A-e") #'kmacro-end-or-call-macro)

(global-set-key (kbd "A-r") #'gcr-replace-string)

(global-set-key (kbd "A-t") #'gcr-ui-date)

(global-set-key (kbd "A-p") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "A-o") #'find-file)

(global-set-key (kbd "A-\\") #'gcr-indent-buffer)

;;; Row 2: A...

(global-set-key (kbd "A-s") #'shell)

(global-set-key (kbd "A-g") #'gcr-occur-dwim)

(global-set-key (kbd "A-j") #'switch-to-buffer)

(global-set-key (kbd "A-k") #'execute-extended-command)

(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)

(global-set-key (kbd "A-;") #'eval-expression)

;;; Row 1: Z...

(global-set-key (kbd "A-z") (kbd "C-c C-k"))

(global-set-key (kbd "A-b") 'Control-X-prefix)

(global-set-key (kbd "A-c") (kbd "C-c C-c"))

(global-set-key (kbd "A-n") #'other-window)

(global-set-key (kbd "A-/") #'winner-undo)

(global-set-key (kbd "C-A-/") #'winner-redo)

;;; Row 0: Ctrl...
