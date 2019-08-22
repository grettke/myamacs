;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(defun gcr-log-entry ()
  "Produces and inserts a compact datestamp with full year and maybe a log message."
  (interactive)
  (let* ((stamp (format-time-string "%Y%m%dT%H%M"))
         (msg (s-trim (read-string "Log message? (hit return to leave blank): ")))
         (str (or (and (s-blank? msg) stamp)
                 (s-concat stamp "-" (s-replace " " "-" msg)))))
    (insert str)))

(defun gcr-timestamp-make-org-seconds ()
  (interactive)
  (let ((current-prefix-arg '(16)))
    (call-interactively 'org-time-stamp)))

(defun gcr-timestamp-make ()
  "Produces a full ISO 8601 format timestamp."
  (interactive)
  (let* ((timestamp-without-timezone (format-time-string "%Y-%m-%dT%T"))
         (timezone-name-in-numeric-form (format-time-string "%z"))
         (timezone-utf-offset
          (concat (substring timezone-name-in-numeric-form 0 3)
                  ":"
                  (substring timezone-name-in-numeric-form 3 5)))
         (timestamp (concat timestamp-without-timezone
                            timezone-utf-offset)))
    timestamp))

(defun gcr-timestamp-datestamp-us ()
  "Produces and inserts a US datestamp."
  (interactive)
  (insert (format-time-string "%m/%d/%y")))

(defun gcr-timestamp-datestamp-us-full-year-and-dashes ()
  "Produces and inserts a US datestamp with full year and dashes."
  (interactive)
  (insert (format-time-string "%m-%d-%Y")))

(defun gcr-timestamp-datestamp-us-full-year ()
  "Produces and inserts a US datestamp with full year."
  (interactive)
  (insert (format-time-string "%m/%d/%Y")))

(defun gcr-timestamp-datestamp-us-words ()
  "Produces and inserts a US datestamp using words."
  (interactive)
  (insert (format-time-string "%A %B %d, %Y")))

(defun gcr-timestamp-hour-seconds ()
  "Produces and inserts a Hour:Minute timestamp"
  (interactive)
  (insert (format-time-string "%H:%M")))

(defun gcr-timestamp-org-datestamp ()
  "Produces and inserts an Org-Mode timestamp."
  (interactive)
  (insert (format "<%s>"(format-time-string "%F"))))

(defun gcr-timestamp-jekyll ()
  "Insert Jekyll timestamp"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S %z")))

(defun gcr-timestamp-insert ()
  "Inserts a full ISO 8601 format timestamp."
  (interactive)
  (insert (gcr-timestamp-make)))

(defun gcr-timestamp-insert-no-colons ()
  "Produces a full ISO 8601 format timestamp with colons replaced by hyphens."
  (interactive)
  (let* ((timestamp (gcr-timestamp-make))
         (timestamp-no-colons (replace-regexp-in-string ":" "-" timestamp)))
    timestamp-no-colons))

(defun gcr-timestamp-insert-datestamp ()
  "Produces and inserts a partial ISO 8601 format timestamp."
  (interactive)
  (insert (format-time-string "%F")))
