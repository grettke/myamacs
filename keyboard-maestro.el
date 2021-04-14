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

;;;; Fortune

(defun gkm4-carlin ()
  (gkm-sh "fortune ~/src/fortunes/carlin"))

(defun gkm4-conalnet ()
  (gkm-sh "fortune ~/src/fortunes/conalnet"))

(defun gkm4-default ()
  (gkm-sh "fortune"))

(defun gkm4-groucho ()
  (gkm-sh "fortune ~/src/fortunes/groucho"))

(defun gkm4-handey ()
  (gkm-sh "fortune ~/src/fortunes/handey"))

(defun gkm4-jung ()
  (gkm-sh "fortune ~/src/fortunes/jung"))

(defun gkm4-mrrogers ()
  (gkm-sh "fortune ~/src/fortunes/MrRogers"))

(defun gkm4-predictions ()
  (gkm-sh "fortune ~/src/fortunes/predictions"))

(defun gkm4-redgreen ()
  (gkm-sh "fortune ~/src/fortunes/redgreen"))

(defun gkm4-realfacts ()
  (gkm-sh "fortune ~/src/fortunes/realfacts"))

(defun gkm4-subgenius ()
  (gkm-sh "fortune ~/src/fortunes/subgenius"))

(defun gkm4-zippy ()
  (gkm-sh "fortune ~/src/fortunes/yow"))

