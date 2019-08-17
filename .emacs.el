;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;;

(load-file "~/src/amacs/.emacs.el")

;;;; macOS Keys

(setq ns-control-modifier 'control)
(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'hyper)
(setq ns-right-control-modifier 'super)
(setq ns-right-command-modifier 'alt)
(setq ns-right-alternate-modifier 'hyper)

;;;; Helper Functions

(defun gcr-dot-sp ()
  (interactive)
  (gcr-ins-evt ?\.)
  (gcr-ins-evt ?\s))

(defun gcr-dot ()
  (interactive)
  (gcr-ins-evt ?\.))

(defun gcr-semi-sp ()
  (interactive)
  (gcr-ins-evt ?\;)
  (gcr-ins-evt ?\s))

(defun gcr-semi ()
  (interactive)
  (gcr-ins-evt ?\;))

(defun gcr-comma-sp ()
  (interactive)
  (gcr-ins-evt ?\,)
  (gcr-ins-evt ?\s))

(defun gcr-comma ()
  (interactive)
  (gcr-ins-evt ?\,))

(defun gcr-em-dash ()
  "Insert a EM-DASH.

- \"best limited to two appearances per sentence\"
- \"can be used in place of commas to enhance readability.
   Note, however, that dashes are always more emphatic than
   commas\"
- \"can replace a pair of parentheses. Dashes are considered
   less formal than parentheses; they are also more intrusive.
   If you want to draw attention to the parenthetical content,
   use dashes. If you want to include the parenthetical content
   more subtly, use parentheses.\"
  - \"Note that when dashes are used in place of parentheses,
     surrounding punctuation should be omitted.\"
- \"can be used in place of a colon when you want to emphasize
   the conclusion of your sentence. The dash is less formal than
   the colon.\"
- \"Two em dashes can be used to indicate missing portions of a
   word, whether unknown or intentionally omitted.\"
  - \"When an entire word is missing, either two or three em
     dashes can be used. Whichever length you choose, use it
     consistently throughout your document. Surrounding punctuation
     should be placed as usual.\"
- \"The em dash is typically used without spaces on either side,
   and that is the style used in this guide. Most newspapers,
   however, set the em dash off with a single space on each side.\"

Source: URL `https://www.thepunctuationguide.com/em-dash.html'"
  (interactive)
  (gcr-ins-evt ?—))

(defun gcr-en-dash ()
  "Insert a EN-DASH.

- \"is used to represent a span or range of numbers, dates,
   or time. There should be no space between the en dash and
   the adjacent material. Depending on the context, the en
   dash is read as “to” or “through.”\"
  - \"If you introduce a span or range with words such as
     'from' or 'between', do not use the en dash.\"
- \"is used to report scores or results of contests.\"
- \"an also be used between words to represent conflict,
   connection, or direction.\"
- \"When a compound adjective is formed with an element that
   is itself an open compound or hyphenated compound, some
   writers replace the customary hyphen with an en dash. This
   is an aesthetic choice more than anything.

Source: URL `https://www.thepunctuationguide.com/en-dash.html'"
  (interactive)
  (gcr-ins-evt ?–))

(defun gcr-hyphen ()
  "Insert a HYPHEN

- \"For most writers, the hyphen’s primary function is the
   formation of certain compound terms. The hyphen is also
   used for word division [in typesetting].
- \"Compound terms are those that consist of more than one
   word but represent a single item or idea.\"

Source: URL `https://www.thepunctuationguide.com/hyphen.html'"

  (interactive)
  (gcr-ins-evt ?-))

(defun gcr-untabify ()
  "Unless tab mode enabled untabify the region or buffer.

URL: `http://emacsredux.com/blog/2013/03/27/indent-region-or-buffer/'"
  (interactive)
  (unless indent-tabs-mode
    (save-excursion
      (if (region-active-p)
        (progn
          (untabify (region-beginning) (region-end))
          (message "Untabified region."))
      (progn
        (untabify (point-min) (point-max))
        (message "Untabified buffer."))))))

(defun gcr-ins-evt (char)
  "Generate a kepy event while inserting CHAR. 

Unlike using `insert' generates a key event so buffer and modes 
and maybe more react as though it is real input from the user typing
at the keyboard."
  (cl-flet ((do-insert
             () (if (bound-and-true-p org-mode)
                    (org-self-insert-command 1)
                  (self-insert-command 1))))
    (setq last-command-event char)
    (do-insert)))

(defun gcr-vc-next-action ()
  "If in org source block, exit it before `vc-next-action'."
  (interactive)
  (when (condition-case nil
            (org-src-edit-buffer-p)
          (error nil))
    (org-edit-src-exit))
  (vc-next-action nil))

(defun gcr-switch-to-previous-buffer ()
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers.

Attribution: URL `http://pragmaticemacs.com/emacs/toggle-between-most-recent-buffers/'

Attribution: URL `https://www.emacswiki.org/emacs/SwitchingBuffers#toc5'"
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


;;;; Org2Blog

(add-to-list 'load-path "~/src/htmlize")
(require 'htmlize)
(add-to-list 'load-path "~/src/hydra")
(require 'hydra)
(add-to-list 'load-path "~/src/xml-rpc")
(require 'xml-rpc)
(add-to-list 'load-path "~/src/org-make-toc")
(require 'org-make-toc)
(add-to-list 'load-path "~/src/dash")
(require 'dash)

(add-to-list 'load-path "~/src/org2blog")
(require 'org2blog)
(add-hook 'org-mode-hook #'owp-maybe-start)
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
-–—
;; Row 3: Q...

(global-set-key (kbd "H-e") #'eval-last-sexp)
(global-set-key (kbd "H-i") #'gcr-switch-to-previous-buffer)
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
