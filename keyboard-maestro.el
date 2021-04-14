(defun gkm-bs () (corporate-bs-generator-make))

(defun gkm-sh (cmd) (shell-command-to-string cmd))

(defun gkm-spk ()
  (with-temp-buffer
    (spook)
    (buffer-substring-no-properties
     (point-min) (point-max))))
