;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(when nil
  (add-to-list 'load-path "~/src/pretty-mode")
  (require 'pretty-mode)

  (add-to-list 'load-path "~/src/universal-emotions-emoticons")
  (require 'universal-emotions-emoticons)

  (add-to-list 'load-path "~/src/corporate-bs-generator")
  (require 'corporate-bs-generator)

  (add-to-list 'load-path "~/src/org-utf-to-xetex")
  (require 'org-utf-to-xetex)
  (add-hook 'org-mode-hook #'org-utf-to-xetex-prettify)

  (add-to-list 'load-path "~/src/say")
  (require 'say)

  (add-to-list 'load-path "~/src/flymake-shellcheck")
  (require 'flymake-shellcheck))
