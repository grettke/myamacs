;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(let () ; Support Libraries More Than One Thing Not Myamacs
  (add-to-list 'load-path "~/src/dash") ; Org make toc, Flycheck.
  (require 'dash)
  )

(let () ; Flycheck

  (add-to-list 'load-path "~/src/epl")
  (require 'epl)

  (add-to-list 'load-path "~/src/pkg-info")
  (require 'pkg-info)

  (add-to-list 'load-path "~/src/flycheck")
  (require 'flycheck)

  )

(load-file "~/src/myamacs/org2blog.el")
