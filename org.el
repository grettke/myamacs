(load-file "~/src/myamacs/org-ecm.el")
(let ((release "9.4.4"))
  (when (not (version= release org-version))
    (display-warning
     'myamacs
     (format
      (concat "Sorry, I might have problems running right now. It looks like "
              "version %s of Org mode is installed but I require "
              "version %s of Org mode to run predictably.")
      org-version release)
     :error)))
(load-file "~/src/myamacs/org-lp-fundamental-tgl.el")
(add-to-list 'load-path "~/src/htmlize")
(require 'htmlize)
;; Checkout the correct release here
(add-to-list 'load-path "~/src/org-mode/contrib/lisp")
(load-file "~/src/myamacs/org-mode-tgl.el")
