;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Auroramacs

(load-file "~/src/amacs/.emacs.el")

;;;; Packages

(require 'thingatpt)

;;;; macOS

;; TODO Correct these to my new layout

(setq ns-control-modifier 'control)
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'hyper)
(setq ns-right-control-modifier 'super)
(setq ns-right-command-modifier 'alt)
(setq ns-right-alternate-modifier 'hyper)

;;;; Utility Functions

(defun gcr-recenter-line-near-top()
  "Move current line near top"
  (interactive)
  (let ((recenter-positions '(5)))
    (recenter-top-bottom)))

;;;; Occur

(define-key occur-mode-map (kbd "n") #'next-logical-line)
(define-key occur-mode-map (kbd "p") #'previous-logical-line)
(add-hook 'occur-mode-find-occurrence-hook #'gcr-recenter-line-near-top)

(defun gcr-occur-dwim ()
  "Call `occur' on thing and goto results.

URL `http://oremacs.com/2015/01/26/occur-dwim/'"
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

;;;; Org2Blog

(add-to-list 'load-path "~/src/htmlize")
(require 'htmlize)
(add-to-list 'load-path "~/src/hydra")
(require 'hydra)
(add-to-list 'load-path "~/src/xml-rpc")
(require 'xml-rpc)
(add-to-list 'load-path "~/src/dash")
(require 'dash)
(add-to-list 'load-path "~/src/s")
(require 's)
(add-to-list 'load-path "~/src/org-make-toc")
(require 'org-make-toc)

(add-to-list 'load-path "~/src/org2blog")
(require 'org2blog)
(add-hook 'org-mode-hook #'owp-maybe-start)
;; TODO Set up these shortcuts
(defun gcr-org2blog/wp-mode-hook-fn ()
  (local-set-key (kbd "s-(") #'owp-user-interface)
  (local-set-key (kbd "s-)") #'owp-complete))
(add-hook 'org2blog/wp-mode-hook #'gcr-org2blog/wp-mode-hook-fn)

(setq org2blog/wp-use-wp-latex nil)

(setq org2blog/wp-use-sourcecode-shortcode t)

(setq org2blog/wp-track-posts nil)

(add-hook 'org2blog/wp-after-new-post-or-page-functions (lambda (p) (pp p)))

(require 'auth-source)
(let* ((credentials (auth-source-user-and-password "wisdomandwonder"))
       (username (nth 0 credentials))
       (password (nth 1 credentials))
       (config `(("wisdomandwonder"
                  :url "https://www.wisdomandwonder.com/xmlrpc.php"
                  :username ,username
                  :password ,password
                  :confirm t))))
  (setq org2blog/wp-blog-alist config))

;;;; Keybindings

;; Row 5: F1...

;; Row 4: 1...

(global-set-key (kbd "H-1") #'delete-other-windows)
(global-set-key (kbd "-") #'gcr-hyphen)
(global-set-key (kbd "H-M--") #'gcr-em-dash)
(global-set-key (kbd "H-M-_") #'gcr-en-dash)

;; Row 3: Q...

(global-set-key (kbd "H-e") #'eval-last-sexp)
(global-set-key (kbd "H-i") #'gcr-switch-to-previous-buffer)
;; TODO: Make this a lambda function
(global-set-key (kbd "H-o") #'occur)
(global-set-key (kbd "H-O") #'find-file)
(global-set-key (kbd "H-|") #'gcr-untabify)

;; Row 2: A...

(global-set-key (kbd "H-h") #'other-window)
(global-set-key (kbd "H-j") #'switch-to-buffer)
(global-set-key (kbd "H-k") #'execute-extended-command)
(global-set-key (kbd "H-K") #'kill-current-buffer)
(global-set-key (kbd "H-l") #'goto-line)
(global-set-key (kbd "H-L") #'shell)

;; Row 1: Z...

(global-set-key (kbd "H-b") #'ibuffer)
(global-set-key (kbd "H-N") #'gcr-vc-next-action)

;; Row 0: Ctrl...

