;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(let () ; Support Libraries More Than One Thing Not Myamacs
  (add-to-list 'load-path "~/src/dash") ; Org make toc, Flycheck, Ag.
  (require 'dash)
  )

(let () ; Flycheck

  (add-to-list 'load-path "~/src/epl")
  (require 'epl)

  (add-to-list 'load-path "~/src/pkg-info")
  (require 'pkg-info)

  (add-to-list 'load-path "~/src/flycheck")
  (require 'flycheck)

  (setq flycheck-textlint-config "/Users/gcr/opt/textlintbin/.textlintrc")

  )

(let () ; Ag

  (and (add-to-list 'load-path "~/src/s")
       (require 's))

  (and (add-to-list 'load-path "~/src/ag")
       (require 'ag)))

(load-file "~/src/myamacs/org2blog.el")
