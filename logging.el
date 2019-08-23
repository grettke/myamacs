;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(defun gcr-log-entry ()
  "Compact datestamp with full year and maybe a log message."
  (interactive)
  (let* ((stamp (format-time-string "%Y%m%dT%H%M"))
         (msg (s-trim (read-string "Log message? (hit return to leave blank): ")))
         (str (or (and (s-blank? msg) stamp)
                 (s-concat stamp "-" (s-replace " " "-" msg)))))
    (gcr--kill str)))

(defun gcr-timestamp-make ()
  "Full ISO 8601 format timestamp."
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

(defun gcr-timestamp-datestamp ()
  "Partial ISO 8601 format timestamp."
  (interactive)
  (gcr--kill (format-time-string "%F")))

(defun gcr-timestamp-datestamp-us ()
  "US datestamp."
  (interactive)
  (gcr--kill (format-time-string "%m/%d/%y")))

(defun gcr-timestamp-datestamp-us-full-year-and-dashes ()
  "US datestamp with full year and dashes."
  (interactive)
  (gcr--kill (format-time-string "%m-%d-%Y")))

(defun gcr-timestamp-datestamp-us-full-year ()
  "US datestamp with full year."
  (interactive)
  (gcr--kill (format-time-string "%m/%d/%Y")))

(defun gcr-timestamp-datestamp-us-words ()
  "US datestamp using words."
  (interactive)
  (gcr--kill (format-time-string "%A %B %d, %Y")))

(defun gcr-timestamp-hour-seconds ()
  "Hour:Minute timestamp"
  (interactive)
  (gcr--kill (format-time-string "%H:%M")))

(defun gcr-timestamp-org-datestamp ()
  "Org-Mode timestamp."
  (interactive)
  (gcr--kill (format "<%s>"(format-time-string "%F"))))

(defun gcr-timestamp-jekyll ()
  "Jekyll timestamp"
  (interactive)
  (gcr--kill (format-time-string "%Y-%m-%d %H:%M:%S %z")))

(defun gcr-timestamp-8601 ()
  "Full ISO 8601 format timestamp."
  (interactive)
  (gcr--kill (gcr-timestamp-make)))

(defun gcr-timestamp-8601-no-colons ()
  "Full ISO 8601 format timestamp with colons replaced by hyphens."
  (interactive)
  (let* ((timestamp (gcr-timestamp-make))
         (timestamp-no-colons (replace-regexp-in-string ":" "-" timestamp)))
    (gcr--kill timestamp-no-colons)))
