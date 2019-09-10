;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities
      '(("melpa-stable" . 100)
        ("gnu" . 50)
        ("melpa" . 0)))
(setq package-menu-hide-low-priority t)
(setq package-enable-at-startup nil)
