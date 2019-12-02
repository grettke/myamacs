;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(use-package org-make-toc :ensure t)

(use-package package-lint :ensure t)

(use-package flycheck :ensure t)

(use-package ag :ensure t)

(use-package langtool :ensure t)

;; FYI only controls installation: Package always
;; loads Org2Blog
(unless gcr-org2blog-local
  (use-package org2blog :ensure t))
