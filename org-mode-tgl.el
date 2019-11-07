;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_9D21E326-1742-4DD0-BDF9-624D21873F92][org_gcr_2017-05-12_mara_9D21E326-1742-4DD0-BDF9-624D21873F92]]
(setq org-babel-min-lines-for-block-output 0)
;; org_gcr_2017-05-12_mara_9D21E326-1742-4DD0-BDF9-624D21873F92 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_9427EB38-B623-4B99-B562-C2FD737EB0D7][org_gcr_2017-05-12_mara_9427EB38-B623-4B99-B562-C2FD737EB0D7]]
(setq org-edit-src-auto-save-idle-delay 0)
(setq org-edit-src-turn-on-auto-save nil)
;; org_gcr_2017-05-12_mara_9427EB38-B623-4B99-B562-C2FD737EB0D7 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_780AFFD3-B8F3-4D0F-A3C1-DB30C2182730][org_gcr_2017-05-12_mara_780AFFD3-B8F3-4D0F-A3C1-DB30C2182730]]
(defun gcr-org-babel-after-execute-hook ()
  "Settings for the `org-babel-after-execute-hook'."
  (interactive)
  (org-redisplay-inline-images))

(add-hook 'org-babel-after-execute-hook #'gcr-org-babel-after-execute-hook)
;; org_gcr_2017-05-12_mara_780AFFD3-B8F3-4D0F-A3C1-DB30C2182730 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_F0536A1B-195D-4AB9-90B8-D73651740849][org_gcr_2017-05-12_mara_F0536A1B-195D-4AB9-90B8-D73651740849]]
(setq org-confirm-babel-evaluate nil)
;; org_gcr_2017-05-12_mara_F0536A1B-195D-4AB9-90B8-D73651740849 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_B804AA93-9D3B-4DC8-BFA3-658DD1FB0601][org_gcr_2017-05-12_mara_B804AA93-9D3B-4DC8-BFA3-658DD1FB0601]]
(setq org-src-tab-acts-natively nil)
;; org_gcr_2017-05-12_mara_B804AA93-9D3B-4DC8-BFA3-658DD1FB0601 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_9DE5CE12-157D-4516-9FB1-7DAFA02C571E][org_gcr_2017-05-12_mara_9DE5CE12-157D-4516-9FB1-7DAFA02C571E]]
(setq org-todo-keywords
      '((sequence
         "TODO(t!)"
         "GO(g@)"
         "WAIT(w@)"
         "BLOCKED(b@)"
         "REVIEW(r!)"
         "|"
         "DONE(d@)"
         "CANCELED(c@)"
         "DUPLICATE(p@)"
         )))
;; org_gcr_2017-05-12_mara_9DE5CE12-157D-4516-9FB1-7DAFA02C571E ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_B237C004-4827-4C39-A9B9-4D0FF9B01053][org_gcr_2017-05-12_mara_B237C004-4827-4C39-A9B9-4D0FF9B01053]]
(setq org-log-states-order-reversed nil)
;; org_gcr_2017-05-12_mara_B237C004-4827-4C39-A9B9-4D0FF9B01053 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_32AAD797-A7D7-416D-9CE2-425EB96781A7][org_gcr_2017-05-12_mara_32AAD797-A7D7-416D-9CE2-425EB96781A7]]
(setq org-log-into-drawer t)
;; org_gcr_2017-05-12_mara_32AAD797-A7D7-416D-9CE2-425EB96781A7 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_B6F42ECC-14C0-4C60-8E00-6BBF883B3043][org_gcr_2017-05-12_mara_B6F42ECC-14C0-4C60-8E00-6BBF883B3043]]
(setq org-archive-mark-done nil)
;; org_gcr_2017-05-12_mara_B6F42ECC-14C0-4C60-8E00-6BBF883B3043 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-05-23T09-03-14-05-00_mara_E899B70E-F49F-4ADC-9C4C-819F1B40D5AE][org_gcr_2018-05-23T09-03-14-05-00_mara_E899B70E-F49F-4ADC-9C4C-819F1B40D5AE]]
(require 'org-inlinetask)
;; org_gcr_2018-05-23T09-03-14-05-00_mara_E899B70E-F49F-4ADC-9C4C-819F1B40D5AE ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_DEE287C2-5B88-4015-9B4F-57DA0F922B0C][org_gcr_2017-05-12_mara_DEE287C2-5B88-4015-9B4F-57DA0F922B0C]]
(setq org-refile-targets '((nil . (:maxlevel . 10))))
(setq org-refile-use-outline-path t)
;; org_gcr_2017-05-12_mara_DEE287C2-5B88-4015-9B4F-57DA0F922B0C ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7B11F38B-157A-400A-8F93-68E610D47128][org_gcr_2017-05-12_mara_7B11F38B-157A-400A-8F93-68E610D47128]]
(defun gcr-org-refile (arg)
  "Refile to /level/ in /file/ by using use /prefix args/: 2+/this/[none], 1+/this/1, 1/choose-file/2"
  (interactive "P")
  (cond
   ((not (null arg))
    (let ((val (car current-prefix-arg))
          (current-prefix-arg nil)
          (org-refile-use-outline-path 'file)
          (org-reverse-note-order nil))
      (cond ((= val 4)
             (call-interactively 'org-refile))
            ((= val 16)
             (let* ((fil (read-file-name "Enter destination file: "))
                    (xfil (expand-file-name fil))
                    (_ (when (not (file-exists-p xfil))
                         (with-temp-file xfil (insert))))
                    (org-refile-targets
                     `((,xfil :maxlevel . 10))))
               (progn (call-interactively 'org-refile)
                      (find-file xfil)))))))
   (t
    (call-interactively 'org-refile))))
;; org_gcr_2017-05-12_mara_7B11F38B-157A-400A-8F93-68E610D47128 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_29930A09-6462-4BE7-9AE2-18DC1858666C][org_gcr_2017-05-12_mara_29930A09-6462-4BE7-9AE2-18DC1858666C]]
(setq org-reverse-note-order t)
;; org_gcr_2017-05-12_mara_29930A09-6462-4BE7-9AE2-18DC1858666C ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_E0E01F45-C01E-4F6E-AE8D-1B0073ECB377][org_gcr_2017-05-12_mara_E0E01F45-C01E-4F6E-AE8D-1B0073ECB377]]
(setq org-outline-path-complete-in-steps nil)
;; org_gcr_2017-05-12_mara_E0E01F45-C01E-4F6E-AE8D-1B0073ECB377 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_07650079-9AE1-4291-97A3-BCFD0628C95D][org_gcr_2017-05-12_mara_07650079-9AE1-4291-97A3-BCFD0628C95D]]
(setq org-refile-allow-creating-parent-nodes nil)
;; org_gcr_2017-05-12_mara_07650079-9AE1-4291-97A3-BCFD0628C95D ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7E513EE1-3EF9-415B-BB94-2135CBFB0E74][org_gcr_2017-05-12_mara_7E513EE1-3EF9-415B-BB94-2135CBFB0E74]]
(setq org-log-refile 'note)
;; org_gcr_2017-05-12_mara_7E513EE1-3EF9-415B-BB94-2135CBFB0E74 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_1F938B98-B056-4381-833C-2C9B835B1C23][org_gcr_2017-05-12_mara_1F938B98-B056-4381-833C-2C9B835B1C23]]
(defun org-read-entry-property-name ()
  "Read a property name from the current entry."
  (let ((completion-ignore-case t)
        (default-prop (or (and (org-at-property-p)
                               (org-match-string-no-properties 2))
                          org-last-set-property)))
    (org-completing-read
     (format "Property [%s]: " (if default-prop default-prop ""))
     (org-entry-properties nil nil)
     nil nil nil nil default-prop)))

(defun gcr-org-region-to-property (&optional property)
  "Copies the region as value to an Org-mode property"
  (interactive)
  ;; if no region is defined, do nothing
  (if (use-region-p)
      ;; if a region string is found, ask for a property and set property to
      ;; the string in the region
      (let ((val (replace-regexp-in-string
                  "\\`[ \t\n]*" ""
                  (replace-regexp-in-string "[ \t\n]*\\'" ""
                                            (substring (buffer-string)
                                                       (- (region-beginning) 1)
                                                       (region-end))))
                 )
            ;; if none was stated by user, read property from user
            (prop (or property
                      (org-read-entry-property-name))))
        ;; set property
        (org-set-property prop val))))
;; org_gcr_2017-05-12_mara_1F938B98-B056-4381-833C-2C9B835B1C23 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-05-17T22-08-31-05-00_mara_AE590C3B-9E70-4694-A2B1-B4EA164D36FB][org_gcr_2018-05-17T22-08-31-05-00_mara_AE590C3B-9E70-4694-A2B1-B4EA164D36FB]]
(setq org-table-export-default-format "orgtbl-to-tsv")
;; org_gcr_2018-05-17T22-08-31-05-00_mara_AE590C3B-9E70-4694-A2B1-B4EA164D36FB ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-03-07_mara_D89CE4CB-12B1-47A6-9B0B-EA544343BA85][org_gcr_2018-03-07_mara_D89CE4CB-12B1-47A6-9B0B-EA544343BA85]]
(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
;; org_gcr_2018-03-07_mara_D89CE4CB-12B1-47A6-9B0B-EA544343BA85 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-03-07_mara_C60306B4-7FB0-45AB-B39F-2BF47FA39604][org_gcr_2018-03-07_mara_C60306B4-7FB0-45AB-B39F-2BF47FA39604]]
(defun gcr-org-latex-remove-package (package)
  "Remove package PACKAGE from `org-latex-default-packages-alist' or error out."
  (interactive)
  (let* ((length-before (length org-latex-default-packages-alist))
         (new (seq-remove (lambda (elt) (equal (cadr elt) package))
                          org-latex-default-packages-alist))
         (length-after (length new))
         (worked (= length-after (- length-before 1))))
    (if worked
        (setq org-latex-default-packages-alist new)
      (error "Couldn't remove %s from org-latex-default-packages-alist."
             package))))
(gcr-org-latex-remove-package "hyperref")
(defconst gcr-org-latex-packages-alist-pre-hyperref
  '(("letterpaper,margin=1.0in" "geometry")
    ("" "float")))
(defconst gcr-org-latex-packages-alist-post-hyperref
  '(("" "fontspec")
    ("section" "placeins")
    ("" "tikz")
    ("" "caption")
    ("" "latexsym")
    ("" "lettrine")
    ("" "listings")
    ("" "color")
    ("" "fancyvrb")
    ("" "fancyhdr")
    ("" "scrlayer-scrpage")
    ("" "lastpage")
    ("" "polyglossia")
    ("" "tabularx")
    ("" "tabu")
    ("" "grantcrettke")))
(setq org-latex-packages-alist
      (append gcr-org-latex-packages-alist-pre-hyperref
              '(("" "hyperref" nil))
              gcr-org-latex-packages-alist-post-hyperref))
;; org_gcr_2018-03-07_mara_C60306B4-7FB0-45AB-B39F-2BF47FA39604 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-04-28T19-58-14-05-00_mara_50C0EEF0-A896-44B3-AC2B-0635552A723A][org_gcr_2018-04-28T19-58-14-05-00_mara_50C0EEF0-A896-44B3-AC2B-0635552A723A]]
(setq org-latex-listings-options
      '(("basicstyle" "\\ttfamily")
        ("breakatwhitespace" "false")
        ("breakautoindent" "true")
        ("breaklines" "true")
        ("columns" "[c]fullflexible")
        ("commentstyle" "")
        ("emptylines" "*")
        ("extendedchars" "false")
        ("fancyvrb" "true")
        ("firstnumber" "auto")
        ("flexiblecolumns" "false")
        ("frame" "single")
        ("frameround" "tttt")
        ("identifierstyle" "")
        ("keepspaces" "true")
        ("keywordstyle" "")
        ("mathescape" "false")
        ("numbers" "left")
        ("numbers" "none")
        ("numbersep" "5pt")
        ("numberstyle" "\\tiny")
        ("resetmargins" "false")
        ("showlines" "true")
        ("showspaces" "false")
        ("showstringspaces" "false")
        ("showtabs" "true")
        ("stepnumber" "2")
        ("stringstyle" "")
        ("tab" "↹")
        ("tabsize" "4")
        ("texcl" "false")
        ("upquote" "false")))
;; org_gcr_2018-04-28T19-58-14-05-00_mara_50C0EEF0-A896-44B3-AC2B-0635552A723A ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_006EB5E3-5478-43C7-AEAC-34CCF49127AC][org_gcr_2017-05-12_mara_006EB5E3-5478-43C7-AEAC-34CCF49127AC]]
(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
                '("help-article"
                  "\\documentclass[12pt]{article}")))

(setq org-latex-default-class "help-article")
;; org_gcr_2017-05-12_mara_006EB5E3-5478-43C7-AEAC-34CCF49127AC ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-04-28T19-58-14-05-00_mara_C24D46F9-B35E-4D87-B47D-662D29F4173A][org_gcr_2018-04-28T19-58-14-05-00_mara_C24D46F9-B35E-4D87-B47D-662D29F4173A]]
(setq org-latex-listings t)
;; org_gcr_2018-04-28T19-58-14-05-00_mara_C24D46F9-B35E-4D87-B47D-662D29F4173A ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-03-07_mara_22B13787-67AA-4462-949B-3C1E6702EB7C][org_gcr_2018-03-07_mara_22B13787-67AA-4462-949B-3C1E6702EB7C]]
(setq org-latex-default-figure-position "H")
;; org_gcr_2018-03-07_mara_22B13787-67AA-4462-949B-3C1E6702EB7C ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_9A50B1B6-9446-4CE2-AC58-5ED8878E9041][org_gcr_2017-05-12_mara_9A50B1B6-9446-4CE2-AC58-5ED8878E9041]]
(setq org-startup-with-inline-images (display-graphic-p))
;; org_gcr_2017-05-12_mara_9A50B1B6-9446-4CE2-AC58-5ED8878E9041 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_C5BBF231-E413-4A62-9367-A25932090329][org_gcr_2017-05-12_mara_C5BBF231-E413-4A62-9367-A25932090329]]
(setq org-use-speed-commands t)
;; org_gcr_2017-05-12_mara_C5BBF231-E413-4A62-9367-A25932090329 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_D874DF5C-61BE-4EF9-97F7-5C77927F8656][org_gcr_2017-05-12_mara_D874DF5C-61BE-4EF9-97F7-5C77927F8656]]
(setq org-confirm-shell-link-function 'y-or-n-p)
;; org_gcr_2017-05-12_mara_D874DF5C-61BE-4EF9-97F7-5C77927F8656 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7715C738-ADCF-4DA7-BB26-DF37B5A55460][org_gcr_2017-05-12_mara_7715C738-ADCF-4DA7-BB26-DF37B5A55460]]
(setq org-confirm-elisp-link-function 'y-or-n-p)
;; org_gcr_2017-05-12_mara_7715C738-ADCF-4DA7-BB26-DF37B5A55460 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_40EE32EF-D461-4A4C-BDDA-5203A0EB5279][org_gcr_2017-05-12_mara_40EE32EF-D461-4A4C-BDDA-5203A0EB5279]]
(setq org-enforce-todo-dependencies t)
;; org_gcr_2017-05-12_mara_40EE32EF-D461-4A4C-BDDA-5203A0EB5279 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_065D8A70-E573-4204-B75B-B69F81926188][org_gcr_2017-05-12_mara_065D8A70-E573-4204-B75B-B69F81926188]]
(require 'org-mouse)
;; org_gcr_2017-05-12_mara_065D8A70-E573-4204-B75B-B69F81926188 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_BD01DD8A-9BA2-4240-8B63-6479D1C868CC][org_gcr_2017-05-12_mara_BD01DD8A-9BA2-4240-8B63-6479D1C868CC]]
(setq org-ellipsis "…")
;; org_gcr_2017-05-12_mara_BD01DD8A-9BA2-4240-8B63-6479D1C868CC ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_D567F41E-C336-402E-A1A3-EB8D4F91CBDC][org_gcr_2017-05-12_mara_D567F41E-C336-402E-A1A3-EB8D4F91CBDC]]
(setq org-hide-leading-stars t)
;; org_gcr_2017-05-12_mara_D567F41E-C336-402E-A1A3-EB8D4F91CBDC ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_95F90F5A-E6EB-43BE-9EF1-B3F0CCE4B331][org_gcr_2017-05-12_mara_95F90F5A-E6EB-43BE-9EF1-B3F0CCE4B331]]
(setq org-adapt-indentation nil)
;; org_gcr_2017-05-12_mara_95F90F5A-E6EB-43BE-9EF1-B3F0CCE4B331 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_563BB770-66CC-431C-98DE-BD3B5B5762AC][org_gcr_2017-05-12_mara_563BB770-66CC-431C-98DE-BD3B5B5762AC]]
(setq org-fontify-emphasized-text t)
;; org_gcr_2017-05-12_mara_563BB770-66CC-431C-98DE-BD3B5B5762AC ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_5A4B6DC2-4F16-4177-9C8E-0D0CFDE2B24C][org_gcr_2017-05-12_mara_5A4B6DC2-4F16-4177-9C8E-0D0CFDE2B24C]]
(setq org-pretty-entities t)
;; org_gcr_2017-05-12_mara_5A4B6DC2-4F16-4177-9C8E-0D0CFDE2B24C ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_6488365E-DF20-4300-A979-BA8CE807BBE4][org_gcr_2017-05-12_mara_6488365E-DF20-4300-A979-BA8CE807BBE4]]
(setq org-use-sub-superscripts '{})
;; org_gcr_2017-05-12_mara_6488365E-DF20-4300-A979-BA8CE807BBE4 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_8D163D72-07DD-42F2-93BA-9C70EC04D22F][org_gcr_2017-05-12_mara_8D163D72-07DD-42F2-93BA-9C70EC04D22F]]
(setq org-highlight-latex-and-related '(latex script entities))
;; org_gcr_2017-05-12_mara_8D163D72-07DD-42F2-93BA-9C70EC04D22F ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7A828354-84C9-42DE-B123-E9936D2CC914][org_gcr_2017-05-12_mara_7A828354-84C9-42DE-B123-E9936D2CC914]]
(setq org-footnote-define-inline t)
(setq org-footnote-auto-label 'random)
(setq org-footnote-auto-adjust nil)
(setq org-footnote-section nil)
;; org_gcr_2017-05-12_mara_7A828354-84C9-42DE-B123-E9936D2CC914 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_C7174763-7D1F-491E-9395-8C4100AEA78D][org_gcr_2017-05-12_mara_C7174763-7D1F-491E-9395-8C4100AEA78D]]
(setq org-catch-invisible-edits 'error)
;; org_gcr_2017-05-12_mara_C7174763-7D1F-491E-9395-8C4100AEA78D ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_E8933212-1893-466F-95D1-BE41ADD2DD68][org_gcr_2017-05-12_mara_E8933212-1893-466F-95D1-BE41ADD2DD68]]
(setq org-loop-over-headlines-in-active-region t)
;; org_gcr_2017-05-12_mara_E8933212-1893-466F-95D1-BE41ADD2DD68 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_018F43BF-99DA-4632-B5B0-A291CEBBA6B5][org_gcr_2017-05-12_mara_018F43BF-99DA-4632-B5B0-A291CEBBA6B5]]
(setq org-startup-folded "nofold")
;; org_gcr_2017-05-12_mara_018F43BF-99DA-4632-B5B0-A291CEBBA6B5 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_85DCD661-A0DA-4AC2-8EB2-5BD9A4C2D0CB][org_gcr_2017-05-12_mara_85DCD661-A0DA-4AC2-8EB2-5BD9A4C2D0CB]]
(setq org-image-actual-width t)
;; org_gcr_2017-05-12_mara_85DCD661-A0DA-4AC2-8EB2-5BD9A4C2D0CB ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_2DD6E6FC-375C-4FA5-BFA4-C6C9B0EAB483][org_gcr_2017-05-12_mara_2DD6E6FC-375C-4FA5-BFA4-C6C9B0EAB483]]
(setq org-hide-emphasis-markers t)
;; org_gcr_2017-05-12_mara_2DD6E6FC-375C-4FA5-BFA4-C6C9B0EAB483 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_B5F4B79C-70AD-46D1-AAAF-A4E31091F9B2][org_gcr_2017-05-12_mara_B5F4B79C-70AD-46D1-AAAF-A4E31091F9B2]]
(setq org-startup-align-all-tables t)
;; org_gcr_2017-05-12_mara_B5F4B79C-70AD-46D1-AAAF-A4E31091F9B2 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_75CA3C3E-CFA6-4FA5-98DA-7EC394781A17][org_gcr_2017-05-12_mara_75CA3C3E-CFA6-4FA5-98DA-7EC394781A17]]
(setq org-html-checkbox-type 'unicode)
;; org_gcr_2017-05-12_mara_75CA3C3E-CFA6-4FA5-98DA-7EC394781A17 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_F04CC035-CFB3-47DB-B1A0-9E58ECE5B01D][org_gcr_2017-05-12_mara_F04CC035-CFB3-47DB-B1A0-9E58ECE5B01D]]
(setq org-src-fontify-natively nil)
;; org_gcr_2017-05-12_mara_F04CC035-CFB3-47DB-B1A0-9E58ECE5B01D ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_829BF364-D929-4B12-BFB7-82C6F4105CDA][org_gcr_2017-05-12_mara_829BF364-D929-4B12-BFB7-82C6F4105CDA]]
(setq org-src-strip-leading-and-trailing-blank-lines t)
;; org_gcr_2017-05-12_mara_829BF364-D929-4B12-BFB7-82C6F4105CDA ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_A4769342-BBC0-40C1-B144-BD24CE74523C][org_gcr_2017-05-12_mara_A4769342-BBC0-40C1-B144-BD24CE74523C]]
(setq org-src-window-setup 'current-window)
;; org_gcr_2017-05-12_mara_A4769342-BBC0-40C1-B144-BD24CE74523C ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7120E516-C6D1-4FD5-A925-7F79B3FE9323][org_gcr_2017-05-12_mara_7120E516-C6D1-4FD5-A925-7F79B3FE9323]]
(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)
;; org_gcr_2017-05-12_mara_7120E516-C6D1-4FD5-A925-7F79B3FE9323 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_1AE94FA9-77C0-4A30-8A70-AFAFD4E4011F][org_gcr_2017-05-12_mara_1AE94FA9-77C0-4A30-8A70-AFAFD4E4011F]]
(setq org-edit-src-code nil)
;; org_gcr_2017-05-12_mara_1AE94FA9-77C0-4A30-8A70-AFAFD4E4011F ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_258FD451-015B-4195-8349-8B4EFA61B581][org_gcr_2017-05-12_mara_258FD451-015B-4195-8349-8B4EFA61B581]]
(setq org-hide-macro-markers nil)
;; org_gcr_2017-05-12_mara_258FD451-015B-4195-8349-8B4EFA61B581 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_7CFE23CC-8EBC-46F3-889F-BF36EC45D6CA][org_gcr_2017-05-12_mara_7CFE23CC-8EBC-46F3-889F-BF36EC45D6CA]]
(setq org-return-follows-link t)
;; org_gcr_2017-05-12_mara_7CFE23CC-8EBC-46F3-889F-BF36EC45D6CA ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_711B4205-DC28-4A35-B620-23AFD46E3973][org_gcr_2017-05-12_mara_711B4205-DC28-4A35-B620-23AFD46E3973]]
(define-key org-mode-map (kbd "<return>") #'org-return-indent)
(define-key org-mode-map (kbd "C-M-<return>") #'newline)
;; org_gcr_2017-05-12_mara_711B4205-DC28-4A35-B620-23AFD46E3973 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_1A8FB05F-FF18-45DD-BFC4-89E76C366B9F][org_gcr_2017-05-12_mara_1A8FB05F-FF18-45DD-BFC4-89E76C366B9F]]
(define-key org-mode-map (kbd "H-7") #'org-babel-load-in-session)
(define-key org-mode-map (kbd "H-8") #'org-babel-switch-to-session)
(define-key org-mode-map (kbd "H-*") #'org-babel-switch-to-session-with-code)
;; org_gcr_2017-05-12_mara_1A8FB05F-FF18-45DD-BFC4-89E76C366B9F ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_6BA97DBC-AE5D-4C60-AD03-EF150686A03F][org_gcr_2017-05-12_mara_6BA97DBC-AE5D-4C60-AD03-EF150686A03F]]
;; (progn
;;   (key-chord-define org-mode-map "y7" #'org-shifleft)
;;   (key-chord-define org-mode-map "Y&" #'org-shifup))
;; (progn
;;   (key-chord-define org-mode-map "u8" #'org-shiftmetaleft)
;;   (key-chord-define org-mode-map "U*" #'org-shiftmetaup)
;;   (key-chord-define org-mode-map "i9" #'org-shiftmetaright)
;;   (key-chord-define org-mode-map "I(" #'org-shiftmetadown))
;; (progn
;;   (key-chord-define org-mode-map "o0" #'org-shiftright)
;;   (key-chord-define org-mode-map "O)" #'org-shiftdown))
;; org_gcr_2017-05-12_mara_6BA97DBC-AE5D-4C60-AD03-EF150686A03F ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2019-02-22T23-11-36-06-00_cosmicality_138EE053-3BAE-45F5-B19B-B8FB19580AF3][org_gcr_2019-02-22T23-11-36-06-00_cosmicality_138EE053-3BAE-45F5-B19B-B8FB19580AF3]]
(global-unset-key (kbd "C-M-t"))
;; org_gcr_2019-02-22T23-11-36-06-00_cosmicality_138EE053-3BAE-45F5-B19B-B8FB19580AF3 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_49522E70-EE2D-4CF9-95D7-8E43524A469D][org_gcr_2017-05-12_mara_49522E70-EE2D-4CF9-95D7-8E43524A469D]]
(define-key org-mode-map (kbd "H-]") (lambda () (interactive)
                                       (message "Removing all source block resuls")
                                       (gcr-org-2every-src-block
                                        'org-babel-remove-result)
                                       (message "Done removing all source block results")))
(define-key org-mode-map (kbd "H-y") #'gcr-safb-org-babel-execute-buffer)
(define-key org-mode-map (kbd "H-u") #'gcr-safb-org-babel-execute-subtree)
(define-key org-mode-map (kbd "H-U") #'org-mark-ring-goto)
(define-key org-mode-map (kbd "H-i") #'org-babel-execute-src-block)
(define-key org-mode-map (kbd "H-I") #'org-table-insert-row)
(define-key org-mode-map (kbd "H-o") #'org-babel-remove-result-one-or-many)
(define-key org-mode-map (kbd "H-O") #'org-org-export-to-org)
(define-key org-mode-map (kbd "H-p") #'org-babel-execute-maybe)
(define-key org-mode-map (kbd "H-[") #'org-babel-remove-inline-result)
(defun gcr-unset-C-M-t ()
  (interactive)
  (local-unset-key (kbd "C-M-t")))
(add-hook 'org-mode-hook #'gcr-unset-C-M-t)
;; org_gcr_2017-05-12_mara_49522E70-EE2D-4CF9-95D7-8E43524A469D ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_EC7D6149-4451-443D-BFFF-1A40073D7D98][org_gcr_2017-05-12_mara_EC7D6149-4451-443D-BFFF-1A40073D7D98]]
(define-key org-mode-map (kbd "C-c C-k") nil)
(define-key org-mode-map (kbd "H-h") #'org-babel-tangle)
(define-key org-mode-map (kbd "H-j") #'org-babel-next-src-block)
(define-key org-mode-map (kbd "H-k") #'org-babel-previous-src-block)
(define-key org-mode-map (kbd "H-l") #'org-edit-src-code)
(define-key org-mode-map (kbd "H-;") #'gcr-safb-gcr-org-babel-demarcate-block)
(define-key org-mode-map (kbd "C->") #'(lambda () (interactive) (insert "\\rarr{}")))
(defun gcr-org-insert-subscript (arg)
  "Maybe insert a subscript with the postfix space."
  (interactive "MSubscript: ")
  (if (s-blank? arg)
      (message "Nothing to insert")
    (insert "_{" arg "} ")))
(defun gcr-org-insert-superscript (arg)
  "Maybe insert a super with the postfix space."
  (interactive "MSuperscript: ")
  (if (s-blank? arg)
      (message "Nothing to insert")
    (insert "^{" arg "} ")))
;; org_gcr_2017-05-12_mara_EC7D6149-4451-443D-BFFF-1A40073D7D98 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-07-12_mara_65D0CDCC-66C7-4C81-ABF3-D22AAF71868E][org_gcr_2017-07-12_mara_65D0CDCC-66C7-4C81-ABF3-D22AAF71868E]]
(define-key global-map (kbd "H-o") nil)
;; org_gcr_2017-07-12_mara_65D0CDCC-66C7-4C81-ABF3-D22AAF71868E ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_8C00E3FE-4AE1-49BA-97E7-FAB2784DD0A9][org_gcr_2017-05-12_mara_8C00E3FE-4AE1-49BA-97E7-FAB2784DD0A9]]
(define-key org-mode-map (kbd "H-n") #'org-babel-view-src-block-info)
(define-key org-mode-map (kbd "H-m") #'org-babel-expand-src-block)
(define-key org-mode-map (kbd "H-,") #'org-babel-open-src-block-result)
;; org_gcr_2017-05-12_mara_8C00E3FE-4AE1-49BA-97E7-FAB2784DD0A9 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-07-12_mara_97C70CDA-DFBF-4422-942A-00E732D3AB6A][org_gcr_2017-07-12_mara_97C70CDA-DFBF-4422-942A-00E732D3AB6A]]
(define-key global-map (kbd "H-m") nil)
;; org_gcr_2017-07-12_mara_97C70CDA-DFBF-4422-942A-00E732D3AB6A ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_90AA8396-E8A0-439C-A1E4-373E90C4DC84][org_gcr_2017-05-12_mara_90AA8396-E8A0-439C-A1E4-373E90C4DC84]]
;; ;; (defhydra gcr-hydra/right-side/org-mode (:color blue
;; :hint nil)
;; "
;; Org-Mode: (_q_uit)
;; Row 4: _1_ SHA-1-hash _2_ display images _3_ hide images _4_ id-create _8_ ltx/noindent
;; Row 3: _w_ ob-clip-formatted _e_ edit field  _E_ list entities _r_ gcr-org-refile _R_ insert \"refile\"  _t_oggle macro marker ATT_R_HTML 4 table export format _u_tf2xtx  _p_ copy-reg-2-property
;; Row 2: _a_ archive-subtree _s_ sort _S_ lobigst _d_ g2s-b/hd _g_ goto _k_ ob-check-src-blk _l_ lint _L_ insert inline task
;; Row 1: _z_ insert-superscript _Z_ insert-subscript _x_ tangled file permissions _c_ org-fill-para _C_ount words _b_ swtch2sessn _B_ NOrg2Blog _n_ n2sbtre _m_ mark-subtree"

;; ("q" org-babel-switch-to-session-with-code)

;; ;; Row 4
;; ("1" org-babel-sha1-hash)
;; ("2" org-display-inline-images)
;; ("3" org-remove-inline-images)
;; ("4" org-id-get-create)
;; ("8" (lambda () (interactive) (insert "@@latex:\\noindent{}@@")))

;; ;; Row 3
;; ("w" ox-clip-formatted-copy)
;; ("e" org-table-edit-field)
;; ("W" gcr-org-mark-subtree/kill-ring-save)
;; ("E" org-entities-help)
;; ("r" gcr-org-refile)
;; ("R" (lambda () (interactive) (insert "(refile)")))
;; ("t" gcr-org-toggle-macro-markers)
;; ("R" (lambda () (interactive) (insert "#+ATTR_HTML: :border 2 :rules all :frame border")))
;; ("u" org-utf-to-xetex-insert-or-wrap-with-macro)
;; ("p" gcr-org-region-to-property)

;; ;; TODO

;; ;; Row 2
;; ("a" org-archive-subtree-default)
;; ("s" org-sort)
;; ("S" org-babel-lob-ingest)
;; ("d" org-babel-goto-src-block-head)
;; ("g" org-goto)
;; ("i" org-babel-do-key-sequence-in-edit-buffer)
;; ("I" org-babel-insert-header-arg)
;; ("k" org-babel-check-src-block)
;; ("l" org-lint)
;; ("L" org-inlinetask-insert-task)

;; ;; Row 1
;; ("z" gcr-org-insert-superscript)
;; ("Z" gcr-org-insert-subscript)
;; ("x" gcr-org-insert-tangle-mode-permission)
;; ("c" org-fill-paragraph)
;; ("C" gcr-org-count-words)
;; ("b" org-babel-switch-to-session)
;; ("B" o2b-gui/body)
;; ("n" org-narrow-to-subtree)
;; ("m" org-mark-subtree)
;; ("M" org-mark-element))
;; (defun gcr-org-mark-subtree/kill-ring-save ()
;;   ""
;;   (interactive)
;;   (call-interactively 'org-mark-subtree)
;;   (call-interactively 'kill-ring-save))
;; (key-chord-define org-mode-map "hh" #'gcr-hydra/right-side/org-mode/body)
;; (defun gcr-org-insert-tangle-mode-permission ()
;;   (interactive)
;;   (insert ":tangle-mode (identity #o755)"))
;; org_gcr_2017-05-12_mara_90AA8396-E8A0-439C-A1E4-373E90C4DC84 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_5DE43FD1-AEF3-40D0-8C67-1ACBB6EA8317][org_gcr_2017-05-12_mara_5DE43FD1-AEF3-40D0-8C67-1ACBB6EA8317]]
(define-key org-src-mode-map (kbd "H-l") #'org-edit-src-exit)
;; org_gcr_2017-05-12_mara_5DE43FD1-AEF3-40D0-8C67-1ACBB6EA8317 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_BF73D071-57B8-4DBA-93E9-5A1D532A6321][org_gcr_2017-05-12_mara_BF73D071-57B8-4DBA-93E9-5A1D532A6321]]
;; (key-chord-define org-mode-map "<<" (lambda () (interactive) (insert "\\laquo{}")))
;; (key-chord-define org-mode-map ">>" (lambda () (interactive) (insert "\\raquo{}")))
;; org_gcr_2017-05-12_mara_BF73D071-57B8-4DBA-93E9-5A1D532A6321 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-06-21T13-13-25-05-00_mara_91DB03A0-F253-41EF-B3D7-820293D5AD94][org_gcr_2018-06-21T13-13-25-05-00_mara_91DB03A0-F253-41EF-B3D7-820293D5AD94]]
(setq org-hide-macro-markers nil)
;; org_gcr_2018-06-21T13-13-25-05-00_mara_91DB03A0-F253-41EF-B3D7-820293D5AD94 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-03-15_mara_05415B89-71CA-4176-80EF-FB36F2D97F20][org_gcr_2018-03-15_mara_05415B89-71CA-4176-80EF-FB36F2D97F20]]
(defun gcr-prettify-org-mode ()
  (interactive)
  (setq prettify-symbols-alist (gcr-alist-set "#+NAME\:" ?╭ prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+name\:" ?╭ prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+BEGIN_SRC" ?├ prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+begin_src" ?├ prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+END_SRC" ?╰ prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+end_src" ?╰
                                              prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+BEGIN_EXAMPLE" ?💡
                                              prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+begin_example" ?💡
                                              prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+END_EXAMPLE" ?💡
                                              prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+end_example" ?💡
                                              prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+BEGIN_QUOTE" ?🗣 prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+begin_quote" ?🗣 prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+END_QUOTE" ?🗣 prettify-symbols-alist))
  (setq prettify-symbols-alist (gcr-alist-set "#+end_quote" ?🗣 prettify-symbols-alist))
  (gcr-prettify-org-mode-names))
(add-hook 'org-mode-hook #'gcr-prettify-org-mode)

(defun gcr-prettify-org-mode-names (&optional replacement)
  (interactive)
  (or replacement (setq replacement ?╮))
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (while (re-search-forward "#\\+name: " nil t)
        (copy-region-as-kill (point) (line-end-position))
        (let ((name (substring-no-properties(pop kill-ring))))
          (when (string-prefix-p "org_" name)
            (setq prettify-symbols-alist (gcr-alist-set name replacement prettify-symbols-alist))))))))
;; org_gcr_2018-03-15_mara_05415B89-71CA-4176-80EF-FB36F2D97F20 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2018-06-14T14-15-42-05-00_mara_2F1F424E-F780-4D04-B582-7770987CC960][org_gcr_2018-06-14T14-15-42-05-00_mara_2F1F424E-F780-4D04-B582-7770987CC960]]
(font-lock-add-keywords
 'org-mode
 '(("^[[:space:]]*\\(-\\) "
    0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "—")))))
;; org_gcr_2018-06-14T14-15-42-05-00_mara_2F1F424E-F780-4D04-B582-7770987CC960 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2019-01-14T09-58-00-06-00_cosmicality_9D450653-5C54-48DB-B0A9-24E8408B0CF2][org_gcr_2019-01-14T09-58-00-06-00_cosmicality_9D450653-5C54-48DB-B0A9-24E8408B0CF2]]
(defun gcr-org-mode-hook-fun ()
  (local-unset-key (kbd "C-j")))
(add-hook 'org-mode-hook #'org2blog-maybe-start)
;; org_gcr_2019-01-14T09-58-00-06-00_cosmicality_9D450653-5C54-48DB-B0A9-24E8408B0CF2 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_C74104AA-A25C-4BE8-A7DD-99DEA240FF73][org_gcr_2017-05-12_mara_C74104AA-A25C-4BE8-A7DD-99DEA240FF73]]
(eval-after-load "ox" '(require 'ox-koma-letter))
;; org_gcr_2017-05-12_mara_C74104AA-A25C-4BE8-A7DD-99DEA240FF73 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_8A241D12-24B3-4C4C-AC99-B55954611025][org_gcr_2017-05-12_mara_8A241D12-24B3-4C4C-AC99-B55954611025]]
(eval-after-load "ox-koma-letter"
  '(progn
     (add-to-list 'org-latex-classes
                  '("help-letter"
                    "\\documentclass[12pt, pagesize, UScommercial9]{scrlttr2}"))

     (setq org-koma-letter-default-class "help-letter")))
;; org_gcr_2017-05-12_mara_8A241D12-24B3-4C4C-AC99-B55954611025 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_33A83D5A-E541-474C-AA0D-2E039EC74CDD][org_gcr_2017-05-12_mara_33A83D5A-E541-474C-AA0D-2E039EC74CDD]]
(setq org-koma-letter-class-option-file "KomaDefault")
;; org_gcr_2017-05-12_mara_33A83D5A-E541-474C-AA0D-2E039EC74CDD ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_62E6542A-B340-470A-B7E0-2F4438EBBAE9][org_gcr_2017-05-12_mara_62E6542A-B340-470A-B7E0-2F4438EBBAE9]]
(setq org-html-htmlize-output-type htmlize-output-type)
;; org_gcr_2017-05-12_mara_62E6542A-B340-470A-B7E0-2F4438EBBAE9 ends here

;; [[file:~/src/myamacs/org-mode.org::org_gcr_2017-05-12_mara_41F8B285-650A-4394-8ECD-85C81181DF14][org_gcr_2017-05-12_mara_41F8B285-650A-4394-8ECD-85C81181DF14]]
(setq org-ascii-text-width 80)
(setq org-ascii-global-margin 0)
;; org_gcr_2017-05-12_mara_41F8B285-650A-4394-8ECD-85C81181DF14 ends here
