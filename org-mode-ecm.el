;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(setq org-list-allow-alphabetical t)

(setq org-enforce-todo-checkbox-dependencies t)

(setq org-babel-noweb-wrap-start "⟪")
(setq org-babel-noweb-wrap-end "⟫")

(require 'org)

(defun gcr-display-system-info ()
  (interactive)
  (message "<<<ECM Information>>>\nThis buffer file: %s\nAs Of: %s\nOrg-Version: %s\nOrg-Git-Version:%s\nEmacs-Version: %s\nNoweb wrap start and stop delimeters: '%s' and '%s'\norg-babel-default-header-args:\n"
           buffer-file-name
           (let* ((timestamp-without-timezone (format-time-string "%Y-%m-%dT%T"))
                  (timezone-name-in-numeric-form (format-time-string "%z"))
                  (timezone-utf-offset
                   (concat (substring timezone-name-in-numeric-form 0 3)
                           ":"
                           (substring timezone-name-in-numeric-form 3 5)))
                  (timestamp (concat timestamp-without-timezone
                                     timezone-utf-offset)))
             timestamp)
           (org-version)
           (org-git-version)
           (emacs-version)
           org-babel-noweb-wrap-start
           org-babel-noweb-wrap-end)
  (pp org-babel-default-header-args))

(gcr-display-system-info)
