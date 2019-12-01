;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(setq gcr-org2blog-local t)

(when gcr-org2blog-local
  (add-to-list 'load-path "~/src/htmlize")
  (require 'htmlize)
  (add-to-list 'load-path "~/src/hydra")
  (require 'hydra)
  (add-to-list 'load-path "~/src/xml-rpc")
  (require 'xml-rpc)
  (add-to-list 'load-path "~/src/org2blog")
  (require 'metaweblog)
  (require 'org2blog))

(setq org2blog/wp-use-wp-latex nil)

(setq org2blog/wp-use-sourcecode-shortcode t)

(setq org2blog/wp-track-posts nil)

(defun gcr-owp-pp-post-result (p)
  (lambda (p) (pp p)))
(add-hook 'org2blog/wp-after-new-post-or-page-functions #'gcr-owp-pp-post-result)

(add-hook 'org-mode-hook #'org2blog-maybe-start)

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
