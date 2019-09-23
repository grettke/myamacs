;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;;; Date UI

;;; Assumes that if you reached the Date UI and there is an active minibuffer
;;; that you reached the Date UI from that minibuffer. For example if you are
;;; creating a file with the date appended you can insert the date using the
;;; Date UI. This is how I will be using it.

;;; Every button has a unique function handler attached. The handler was
;;; created with 'defun. It is not visible within the namespace though. I'm
;;; not even sure what it could be called other then something perhaps like
;;; 'uifun combined some kind of unique identifier.

;;; Implementation could also have
;;; - Copied the Hydra approach
;;; - Copied the 'menu-bar-open approach
;;; - Somehow used the completion framework
;;; - Created a menu

(defmacro gcr--ui-date-entry (fun keybefore key keyafter)
  (let ((uifun (make-symbol "uifun")))
    `(progn
       (defun ,uifun ()
         (interactive)
         (let ((value (gcr-kill-identity (,fun)))
               (origin-buf-exists (buffer-live-p origin-buf)))
           (cond (origin-buf-exists
                  (with-current-buffer origin-buf
                    (insert-before-markers value))
                  (let ((win (active-minibuffer-window)))
                    (if win
                        (select-window win)
                      (pop-to-buffer-same-window origin-buf))))
                 (t (message "Sorry that buffer no longer exists."))))
         (kill-buffer ui-buf))
       (widget-insert ,keybefore)
       (widget-create
        'push-button
        :notify (lambda (&rest ignore) (,uifun))
        ,key)
       (widget-insert ,keyafter)
       (define-key ui-keymap ,key ',uifun))))

(defun gcr--ui-date-quit ()
  (interactive)
  "Quit date UI."
  (kill-this-buffer)
  (let ((win (active-minibuffer-window)))
    (when win
      (select-window win))))

(defun gcr-ui-date ()
  (interactive)
  (let* ((origin-buf (current-buffer))
         ;; When you return to an active minibuffer's buffer using
         ;; a function like 'pop-to-buffer-same the minibuffer's height becomes
         ;; the same as the buffer from which you came, gigantic, while it
         ;; continues to work correctly. By selecting the window the
         ;; minibuffer regains focus with the correct height.
         (origin-window-active-minibuffer
          (let ((it (selected-window)))
            (if (minibuffer-window-active-p it) it nil)))
         (ui-keymap (make-sparse-keymap))
         (title "Date Insert & Kill")
         (ui-buf (format "*%s*" title)))
    (set-keymap-parent ui-keymap widget-keymap)
    (pop-to-buffer-same-window ui-buf)
    (let ((inhibit-read-only t))
      (erase-buffer))
    (remove-overlays)
    (widget-insert "╔════════════════════╗\n")
    (widget-insert (format "║ %s ║\n" title))
    (widget-insert "╚════════════════════╝")
    (widget-insert "\n\n\n")
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
    (gcr--ui-date-entry gcr-timestamp-org-datestamp "" "T" "oday.")
    (widget-insert "\n\n\n")
    (widget-create
     'push-button
     :notify 'gcr--ui-date-quit
     "q")
    (widget-insert "uit")
    (define-key ui-keymap "q" 'gcr--ui-date-quit)
    (use-local-map ui-keymap)
    (widget-setup)))
