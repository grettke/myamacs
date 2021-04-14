(defun gkm-bs () (corporate-bs-generator-make))

(defun gkm-diac (str)
  (with-temp-buffer
    (insert str)
    (diacriticalize-markup-region
     (point-min)
     (point-max))
    (buffer-substring-no-properties
     (point-min) (point-max))))

(defun gkm-scope ()
  (horoscope nil))

(defun gkm-sh (cmd) (shell-command-to-string cmd))

(defun gkm-shop ()
  (with-temp-buffer
    (shop)
    (buffer-substring-no-properties
     (point-min) (point-max))))

(defun gkm-spk ()
  (with-temp-buffer
    (spook)
    (buffer-substring-no-properties
     (point-min) (point-max))))
