;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

(defun gcr--kill (it)
  "Add IT to the kill ring."
  (interactive)
  (kill-new it)
  (message "Killed: %s" it))

(defun gcr-recenter-line-near-top()
  (interactive)
  (let ((recenter-positions '(5)))
    (recenter-top-bottom)))

(defun gcr-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun gcr-vc-next-action ()
  (interactive)
  "Maybe close Org source block before calling `vc-next-action'."
  (when (condition-case nil (org-src-edit-buffer-p) (error nil))
    (org-edit-src-exit))
  (vc-next-action nil))

(defun gcr-beginning-of-line-dwim ()
  (interactive)
  (let ((start-position (point)))
    (move-beginning-of-line nil)
    (when (= (point) start-position)
      (back-to-indentation))))

(defun gcr-unfill-paragraph (&optional region)
  (interactive (progn (barf-if-buffer-read-only) (list t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

(defun gcr-replace-string ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (call-interactively 'replace-string)))

(defun zone-choose (pgm)
  "Choose a PGM to run for `zone'."
  (interactive
   (list
    (completing-read
     "Program: "
     (mapcar 'symbol-name zone-programs))))
  (let ((zone-programs (list (intern pgm))))
    (zone)))

(defun gcr-dos2unix ()
  (interactive)
  (set-buffer-file-coding-system 'unix 't) )

(defun gcr-move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive
   (list (if buffer-file-name
             (read-file-name "Move file to: ")
           (read-file-name "Move file to: "
                           default-directory
                           (expand-file-name (file-name-nondirectory (buffer-name))
                                             default-directory)))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (buffer-file-name)))
    (write-file new-location t)
    (when (and old-location
             (file-exists-p new-location)
             (not (string-equal old-location new-location)))
      (delete-file old-location))))

(defun gcr-rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun gcr-sort-lines-ignore-case ()
  "Sort lines ignoring case."
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

(defun gcr-delete-this-buffer-and-file ()
  "Deletes file connected to this buffer and kills this buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Nothing to delete: '%s' is not visiting a file." name)
      (when (yes-or-no-p "Are you sure you want to delete this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully deleted." filename)))))

(defun gcr-remove-vowel ($string &optional $from $to)
  "Remove the following letters: {a e i o u}.

When called interactively, work on current paragraph or text selection.

When called in lisp code, if ξstring is non-nil, returns a changed string.
If ξstring nil, change the text in the region between positions ξfrom ξto."
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)) )
       (list nil (car bds) (cdr bds)) ) ) )
  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if $string t nil))
    (setq inputStr (if workOnStringP $string (buffer-substring-no-properties $from $to)))
    (setq outputStr
          (let ((case-fold-search t))
            (replace-regexp-in-string "a\\|e\\|i\\|o\\|u\\|" "" inputStr) )  )

    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region $from $to)
        (goto-char $from)
        (insert outputStr)))))

(defun gcr-alist-set (key val alist &optional symbol)
  "Set property KEY to VAL in ALIST. Return new alist.
This creates the association if it is missing, and otherwise sets
the cdr of the first matching association in the list. It does
not create duplicate associations. By default, key comparison is
done with `equal'. However, if SYMBOL is non-nil, then `eq' is
used instead.

This method may mutate the original alist, but you still need to
use the return value of this method instead of the original
alist, to ensure correct results."
  (if-let ((pair (if symbol (assq key alist) (assoc key alist))))
      (setcdr pair val)
    (push (cons key val) alist))
  alist)

(defun gcr-org-count-words ()
  "If region is active, count words in it; otherwise count words in current subtree."
  (interactive)
  (if (use-region-p)
      (funcall-interactively #'count-words-region (region-beginning) (region-end))
    (org-with-wide-buffer
     (cl-loop for (lines words characters)
              in (org-map-entries
                  (lambda ()
                    (gcr-org-forward-to-entry-content 'unsafe)
                    (let ((end (org-entry-end-position)))
                      (list (count-lines (point) end)
                            (count-words (point) end)
                            (- end (point)))))
                  nil 'tree)
              sum lines into total-lines
              sum words into total-words
              sum characters into total-characters
              finally do (message "Subtree \"%s\" has %s lines, %s words, and %s characters."
                                  (org-get-heading t t) total-lines
                                  total-words total-characters)))))

(defun gcr-org-forward-to-entry-content (&optional unsafe)
  "Skip headline, planning line, and all drawers in current entry.
If UNSAFE is non-nil, assume point is on headline."
  (unless unsafe
    (org-back-to-heading))
  (cl-loop for element = (org-element-at-point)
           for pos = (pcase element
                       (`(headline . ,_) (org-element-property :contents-begin element))
                       (`(,(or 'planning 'property-drawer 'drawer) . ,_) (org-element-property :end element)))
           while pos
           do (goto-char pos)))

(defvar gcr-most-used-words-count 10 "Default most used word count to show")

(defun gcr-most-used-words-fn (&optional n)
  "Make a list of the N most used words in buffer, or use default.
Attribution: Udyant Wig <udyantw@gmail.com>"
  (let ((n (or n gcr-most-used-words-count))
        (counts (make-hash-table :test #'equal))
        (words (split-string (buffer-string)))
        sorted-counts)
    (dolist (word words)
      (let ((count (gethash (downcase word) counts 0)))
        (puthash (downcase word) (1+ count) counts)))
    (cl-loop for word being the hash-keys of counts
             using (hash-values count)
             do
             (push (list word count) sorted-counts)
             finally (setf sorted-counts (cl-sort sorted-counts #'>
                                                  :key #'cl-second)))
    (mapcar #'cl-first (cl-subseq sorted-counts 0 n))))

(defun gcr-most-used-words ()
  "Report top N most used words in a new buffer, defaults to 1"
  (interactive)
  (let* ((input-raw (read-string "Report the top N most used words <hit enter for default>: " nil nil nil))
         (input-num (floor (string-to-number (string-trim input-raw))))
         (n (if (<= input-num 0) gcr-most-used-words-count input-num))
         (words (gcr-most-used-words-fn n))
         (name (format "TOP %s USED WORDS IN %s" n (buffer-name)))
         (underbar (make-string (length name) ?=))
         (buf (get-buffer-create (format "*%s*"name))))
    (switch-to-buffer buf)
    (insert (format "%s\n%s\n" name underbar))
    (dolist (word words) (insert (format "%s\n" word)))
    (help-mode)
    (setq buffer-read-only t)
    (goto-char (point-min))))

(defun gcr-occur-non-ascii ()
  (interactive)
  (occur "[^[:ascii:]]"))

(defun gcr-untabify-buffer ()
  (interactive)
  (unless indent-tabs-mode
    (save-excursion (untabify (point-min) (point-max)))))

(defun gcr-untabify-dwim ()
  (interactive)
  (save-excursion
    (cond ((region-active-p) (untabify (region-beginning) (region-end))
           (message "Untabified selected region."))
          (t (gcr-untabify-buffer)
             (message "Untabified buffer.")))))

(defun gcr-indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun gcr-indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (gcr-indent-buffer)
        (message "Indented buffer.")))))

(defvar gcr-delete-trailing-whitespace-p t)

(defun gcr-delete-trailing-whitespace ()
  (interactive)
  (when gcr-delete-trailing-whitespace-p
    (let ((first-part-start (point-min))
          (first-part-end (point-at-bol))
          (second-part-start (point-at-eol))
          (second-part-end (point-max)))
      (delete-trailing-whitespace first-part-start first-part-end)
      (delete-trailing-whitespace second-part-start second-part-end))))
