;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(defmacro gcr--ui-date-entry (fun keybefore key keyafter)
  (let ((uifun (make-symbol "uifun")))
    `(progn
       (defun ,uifun ()
         (interactive)
         (kill-buffer buf)
         (let ((origin-exists (get-buffer origin))
               (value (gcr-kill-identity (,fun))))
           (cond (origin-exists
                  (with-current-buffer origin
                    (insert-before-markers value))
                  (let ((minibuf (active-minibuffer-window)))
                    (if minibuf
                        (select-window minibuf)
                      (pop-to-buffer-same-window origin))))
                 (t (message "Can't insert %s: source buffer %s is closed."
                             value origin)))))
       (widget-insert ,keybefore)
       (widget-create
        'push-button
        :notify (lambda (&rest ignore) (,uifun))
        ,key)
       (widget-insert ,keyafter)
       (define-key ui-keymap ,key ',uifun))))

(defun gcr-ui-date ()
  (interactive)
  (let* ((origin (buffer-name))
         (ui-keymap (make-sparse-keymap))
         (title "Date Insert & Kill")
         (buf (format "*%s*" title)))
    (set-keymap-parent ui-keymap widget-keymap)
    (pop-to-buffer-same-window buf)
    (let ((inhibit-read-only t))
      (erase-buffer))
    (remove-overlays)
    (widget-insert "╔════════════════════╗\n")
    (widget-insert (format "║ %s ║\n" title))
    (widget-insert "╚════════════════════╝")
    (widget-insert "\n\n")
    (widget-insert "Date: ")
    (gcr--ui-date-entry gcr-timestamp-datestamp "" "I" "SO")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-datestamp-us "" "U" "S")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-datestamp-us-full-year "US " "F" "ull Year")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-datestamp-us-full-year-and-dashes "With " "D" "ashes")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-datestamp-us-words "In " "W" "ords")
    (widget-insert ".\n\n")
    (widget-insert "Date/Time: ")
    (gcr--ui-date-entry gcr-timestamp-8601 "" "C" "olons")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-8601-no-colons "" "N" "o Colons")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-log-entry "" "L" "og Entry")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-jekyll "" "J" "ekyll")
    (widget-insert ".\n\n")
    (widget-insert "Time: ")
    (gcr--ui-date-entry gcr-timestamp-12-hour-minute "" "1" "2h Clock")
    (widget-insert ", ")
    (gcr--ui-date-entry gcr-timestamp-24-hour-minute "" "2" "4h Clock")
    (widget-insert ".\n\n")
    (widget-insert "Org-Mode: ")
    (gcr--ui-date-entry gcr-timestamp-org-datestamp "" "T" "oday")
    (widget-insert "\n\nHit (q) to quit.")
    (define-key ui-keymap "q" 'kill-this-buffer)
    (use-local-map ui-keymap)
    (widget-setup)))
