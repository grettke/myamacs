;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_4C483D43-7E0D-48E1-88D5-9353A0DBD83A][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_4C483D43-7E0D-48E1-88D5-9353A0DBD83A]]
(require 'bibtex)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_4C483D43-7E0D-48E1-88D5-9353A0DBD83A ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-13T18-00-23-06-00_cosmicality_32B5EE79-9019-4210-B45F-71B2781CEB4E][org_gcr_2018-11-13T18-00-23-06-00_cosmicality_32B5EE79-9019-4210-B45F-71B2781CEB4E]]
(defun gcr-bibtex-calculate-new-reference-key ()
  (interactive)
  (bibtex-clean-entry))
(defun gcr-bibtex-maybe-troublesome-mode-disable
    (interactive)
  (aggressive-indent-mode 'toggle)
  (visual-line-mode 't))
(defun gcr-bibtex-maybe-troublesome-mode-enable
    (interactive)
  (aggressive-indent-mode nil)
  (visual-line-mode nil))
;; org_gcr_2018-11-13T18-00-23-06-00_cosmicality_32B5EE79-9019-4210-B45F-71B2781CEB4E ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-13T18-00-23-06-00_cosmicality_62AAF44B-D738-4732-BD54-1111BCD6BB6E][org_gcr_2018-11-13T18-00-23-06-00_cosmicality_62AAF44B-D738-4732-BD54-1111BCD6BB6E]]
(defhydra gcr-bibtex (:color blue :hint nil)
  "
_c_ Clean Entry _C_ Clean Entry & Create New Reference
_f_ Reindent Field _F_ Reindent Buffer/Region
_m_ Disable Unhelpful Modes _M_ Enable Unhelpful Modes
"
  ("c" bibtex-clean-entry)
  ("C" gcr-bibtex-calculate-new-reference-key)
  ("f" bibtex-fill-entry)
  ("F" bibtex-reformat)
  ("m" gcr-bibtex-maybe-troublesome-mode-disable)
  ("M" gcr-bibtex-maybe-troublesome-mode-enable))
;; org_gcr_2018-11-13T18-00-23-06-00_cosmicality_62AAF44B-D738-4732-BD54-1111BCD6BB6E ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-13T18-00-23-06-00_cosmicality_3B76ECF1-3D55-4066-BCC1-1436E41D5C2D][org_gcr_2018-11-13T18-00-23-06-00_cosmicality_3B76ECF1-3D55-4066-BCC1-1436E41D5C2D]]
(defun gcr-bibtex-mode-hook-fn ()
  (key-chord-define-local "hh" #'gcr-bibtex/body))
(add-hook 'bibtex-mode-hook #'gcr-bibtex-mode-hook-fn)
;; org_gcr_2018-11-13T18-00-23-06-00_cosmicality_3B76ECF1-3D55-4066-BCC1-1436E41D5C2D ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1CF3A243-94CC-4423-9BC3-35BAAA3C9A23][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1CF3A243-94CC-4423-9BC3-35BAAA3C9A23]]
(setq bibtex-entry-format nil)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1CF3A243-94CC-4423-9BC3-35BAAA3C9A23 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_94FCD330-3C5E-404E-AA19-0C3E9D1DB6D4][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_94FCD330-3C5E-404E-AA19-0C3E9D1DB6D4]]
(add-to-list 'bibtex-entry-format 'opts-or-alts)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_94FCD330-3C5E-404E-AA19-0C3E9D1DB6D4 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1B324CB4-0390-43F2-9AE4-EDEC5D16614A][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1B324CB4-0390-43F2-9AE4-EDEC5D16614A]]
(add-to-list 'bibtex-entry-format 'required-fields)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_1B324CB4-0390-43F2-9AE4-EDEC5D16614A ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_A0A4865A-E855-463C-8F55-43C47199CAD8][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_A0A4865A-E855-463C-8F55-43C47199CAD8]]
(add-to-list 'bibtex-entry-format 'whitespace)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_A0A4865A-E855-463C-8F55-43C47199CAD8 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_21684BCC-04D4-4EE8-90E0-4F65764D1E26][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_21684BCC-04D4-4EE8-90E0-4F65764D1E26]]
(add-to-list 'bibtex-entry-format 'realign)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_21684BCC-04D4-4EE8-90E0-4F65764D1E26 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_B493A48E-FDE3-4B0B-B935-FBDF3BB99C35][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_B493A48E-FDE3-4B0B-B935-FBDF3BB99C35]]
(add-to-list 'bibtex-entry-format 'delimiters)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_B493A48E-FDE3-4B0B-B935-FBDF3BB99C35 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_D5C9AF40-97B8-4F1B-8CBC-373DB521C1EF][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_D5C9AF40-97B8-4F1B-8CBC-373DB521C1EF]]
(add-to-list 'bibtex-entry-format 'unify-case)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_D5C9AF40-97B8-4F1B-8CBC-373DB521C1EF ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-13T18-00-23-06-00_cosmicality_CE975BCA-7E66-4E82-BC85-941FFBB216C5][org_gcr_2018-11-13T18-00-23-06-00_cosmicality_CE975BCA-7E66-4E82-BC85-941FFBB216C5]]
(add-to-list 'bibtex-entry-format 'sort-fields)
;; org_gcr_2018-11-13T18-00-23-06-00_cosmicality_CE975BCA-7E66-4E82-BC85-941FFBB216C5 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-12T12-28-14-06-00_cosmicality_48463172-68BE-4034-922F-50D0F572F73A][org_gcr_2018-11-12T12-28-14-06-00_cosmicality_48463172-68BE-4034-922F-50D0F572F73A]]
(setq bibtex-autokey-name-year-separator "-")
(setq bibtex-autokey-year-title-separator "-")
(setq bibtex-autokey-titleword-separator "-")
;; org_gcr_2018-11-12T12-28-14-06-00_cosmicality_48463172-68BE-4034-922F-50D0F572F73A ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-12T12-28-14-06-00_cosmicality_9BDC47DE-78C9-460E-9333-3E8E79C51AFD][org_gcr_2018-11-12T12-28-14-06-00_cosmicality_9BDC47DE-78C9-460E-9333-3E8E79C51AFD]]
(setq bibtex-autokey-names 1)
(setq bibtex-autokey-names-stretch 1)
(setq bibtex-autokey-name-separator "-")
(setq bibtex-autokey-additional-names "-et-al")
;; org_gcr_2018-11-12T12-28-14-06-00_cosmicality_9BDC47DE-78C9-460E-9333-3E8E79C51AFD ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-12T12-28-14-06-00_cosmicality_E1A42ADA-92E6-4479-9C21-87612AE656C4][org_gcr_2018-11-12T12-28-14-06-00_cosmicality_E1A42ADA-92E6-4479-9C21-87612AE656C4]]
(setq bibtex-autokey-year-length 4)
;; org_gcr_2018-11-12T12-28-14-06-00_cosmicality_E1A42ADA-92E6-4479-9C21-87612AE656C4 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-11-12T12-28-14-06-00_cosmicality_2C0EDDD9-13CB-4A6D-BB57-D4CDDC671106][org_gcr_2018-11-12T12-28-14-06-00_cosmicality_2C0EDDD9-13CB-4A6D-BB57-D4CDDC671106]]
(setq bibtex-autokey-titlewords 2)
(setq bibtex-autokey-titlewords-stretch 1)
(setq bibtex-autokey-titleword-length 5)
;; org_gcr_2018-11-12T12-28-14-06-00_cosmicality_2C0EDDD9-13CB-4A6D-BB57-D4CDDC671106 ends here

;; [[file:~/git/src/myamacs/bibtex.org::org_gcr_2018-09-19T12-32-27-05-00_cosmicality_C87F9898-F014-4A14-8CD9-DCA6554DD133][org_gcr_2018-09-19T12-32-27-05-00_cosmicality_C87F9898-F014-4A14-8CD9-DCA6554DD133]]
(setq bibtex-autokey-edit-before-use nil)
;; org_gcr_2018-09-19T12-32-27-05-00_cosmicality_C87F9898-F014-4A14-8CD9-DCA6554DD133 ends here
