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
  "Move current line near top"
  (interactive)
  (let ((recenter-positions '(5)))
    (recenter-top-bottom)))

(defun gcr-switch-to-previous-buffer ()
  "Switch to most recent buffer. 

Repeated calls toggle back and forth between the most recent two
buffers.

Attribution: 
URL `http://pragmaticemacs.com/emacs/toggle-between-most-recent-buffers/'

Attribution: 
URL `https://www.emacswiki.org/emacs/SwitchingBuffers#toc5'"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun gcr-vc-next-action ()
  "When in Org source block exit it first."
  (interactive)
  (when (condition-case nil
            (org-src-edit-buffer-p)
          (error nil))
    (org-edit-src-exit))
  (vc-next-action nil))

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

(global-set-key (kbd "H-A-1") #'help)
(global-set-key (kbd "H-A-3") #'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "H-A-4") #'kmacro-end-or-call-macro)
(global-set-key (kbd "H-A-5") #'kmacro-name-last-macro)
(global-set-key (kbd "H-A-6") #'insert-kbd-macro)

;; Row 3: Q...

(global-set-key (kbd "A-r") #'vc-revert)

(global-set-key (kbd "A-o") #'gcr-occur-dwim)
(global-set-key (kbd "A-O") #'find-file)
(global-set-key (kbd "H-A-o") #'kill-current-buffer)

;; Row 2: A...

(global-set-key (kbd "A-s") #'shell)

(global-set-key (kbd "A-d") #'vc-diff)
(global-set-key (kbd "A-f") #'gcr-vc-next-action)

(global-set-key (kbd "A-j") #'switch-to-buffer)
(global-set-key (kbd "A-J") #'buffer-menu)
(global-set-key (kbd "H-A-j") #'ibuffer)
(global-set-key (kbd "A-k") #'execute-extended-command)
(global-set-key (kbd "A-l") #'gcr-switch-to-previous-buffer)

;; Row 1: Z...


;; Row 0: Ctrl...

