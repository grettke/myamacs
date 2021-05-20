;; -*- lexical-binding: t; no-byte-compile: t; coding: utf-8 -*-

;;; Text

(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
  (advice-add 'text-scale-adjust :after
              #'visual-fill-column-adjust))

(defun amacs-text-mode-hook-fn ()
  (visual-line-mode))

(add-hook 'text-mode-hook #'amacs-text-mode-hook-fn)

;;; Prog

(setq amacs-prog-modes '(sh-mode json-mode graphviz-dot-mode))
(setq amacs-lisp-modes
      '(emacs-lisp-mode-hook
        ielm-mode-hook
        lisp-interaction-mode-hook))
(setq amacs-prog-modes (append amacs-prog-modes amacs-lisp-modes))

(defun amacs-prog-mode-hook-fn ()
  (interactive)
  (auto-fill-mode))

;; Implementation

(add-hook 'prog-mode-hook #'amacs-prog-mode-hook-fn)

;;;; Checkdoc

(require 'checkdoc)
(setq checkdoc-package-keywords-flag t)

;;;; Emacs Lisp

(defun gcr-general-lisp-prettify ()
  (mapc (lambda (pair) (push pair prettify-symbols-alist))
        '(("-" . ?−)
          ("*" . ?×)
          ("/" . ?÷)
          ("<=" . ?≤)
          (">=" . ?≥)
          ("sqrt" . ?√)
          ("throw" . ?🡅))))

(defun gcr-general-lisp-mode-hook-fn ()
  (gcr-general-lisp-prettify))

(mapcar
 (lambda (mode) (add-hook mode #'gcr-general-lisp-mode-hook-fn))
 amacs-lisp-modes)

(global-eldoc-mode -1)

;;;; Shell-script

(defun gcr-sh-mode-hook-fn ()
  (interactive)
  (setq sh-basic-offset 2))

(add-hook 'sh-mode-hook #'gcr-sh-mode-hook-fn)

;;;; Conf

(defun gcr-conf-unix-mode-hook-fn ()
  (interactive)
  (remove-hook 'before-save-hook #'gcr-indent-buffer))

(add-hook 'conf-unix-mode-hook #'gcr-conf-unix-mode-hook-fn)

;;;; BibTeX

(load-file "~/src/myamacs/bibtex-tgl.el")

;;;; Htmlize

(setq htmlize-output-type 'inline-css)

;;;; Window

(winner-mode)

;;;; ccrypt

;; TODO ccrypt
(when (getenv "CCRYPT")
  (let ((path (concat (getenv "CCRYPT") "/share/emacs/site-lisp/ccrypt")))
    (add-to-list 'load-path path)
    (require 'ps-ccrypt)))

;;;; Flycheck

(defun gcr-flycheck-list-errors ()
  "Show and switch to error list."
  (interactive)
  (flycheck-list-errors)
  (other-window 1))
(defhydra gcr-hydra-flycheck (:color blue :hint nil)
  "
╔═^═════════╗
║ ^Flycheck ║^ Enabled? => %(bound-and-true-p flycheck-mode)
╠═^═════════╩^══════╦═^═^════^═════╗
║ ^Admin^           ║ ^List^ ^     ║
╚═^═════^═══════════╩═^═^════^═════╝
 [_c_] Check Buffer  [_l_] List
 [_C_] Clear Buffer  [_f_] Filter
 [_r_] Checker       [_F_] Reset
 [_t_] Toggle Mode    ^ ^
 [_v_] Verify Setup   ^ ^
 [_q_] Quit
"
  ;; Admin
  ("c" flycheck-buffer :exit nil)
  ("C" flycheck-clear :exit nil)
  ("r" flycheck-select-checker :exit nil)
  ("t" flycheck-mode :exit nil)
  ("v" flycheck-verify-setup)
  ("q" nil)
  ;; List
  ("l" gcr-flycheck-list-errors)
  ("f" flycheck-error-list-set-filter)
  ("F" flycheck-error-list-reset-filter)
  )

;;; textlint

(setq flycheck-textlint-config "~/opt/textlintbin/.textlintrc.json")

;;;; ispell

(require 'ispell)

;;;; LanguageTool

(setq langtool-language-tool-jar (getenv "LANGTOOL"))
(let ((lang "en-US"))
  (setq langtool-default-language lang)
  (setq langtool-mother-tongue lang))
(setq langtool-java-bin (concat (getenv "JAVA_HOME") "/bin/java"))
(setq langtool-disabled-rules nil)
(setq langtool-java-user-arguments
      '("-Dfile.encoding=UTF-8"))
(setq langtool-user-arguments nil)
(defhydra gcr-hydra-langtool (:color blue :hint nil)
  "
 Langtool:^         ^|^                   ^|^
-------------------^^+^-------------------^+^----------------------
 _h_: check buffer   | _j_: next error     | _i_: brief message
 _y_: correct buffer | _k_: previous error | _o_: detailed message
 _n_: finished       | _q_: quit           |
 "
  ("h" langtool-check :exit nil)
  ("y" langtool-correct-buffer :exit nil)
  ("n" langtool-check-done)

  ("j" langtool-goto-next-error :exit nil)
  ("k" langtool-goto-previous-error :exit nil)

  ("i" langtool-show-brief-message-at-point :exit nil)
  ("o" langtool-show-message-at-point :exit nil)

  ("q" nil))

;;;; JSON

(use-package json-mode
  :ensure t
  :mode (("\\.jshintrc$" . json-mode))
  :config
  (defhydra gcr-hydra-json (:color blue
                                   :hint nil)
    "
JSON: (q to quit)
_b_eautify
 _s_how-path _k_ill-path
  _t_oggle boolean _n_ullify sexp
   _i_ncrement number _d_ecrement number
"
    ("b" json-mode-beautify)
    ("s" json-mode-show-path)
    ("k" json-mode-kill-path)
    ("t" json-toggle-boolean)
    ("n" json-nullify-sexp)
    ("i" json-increment-number-at-point :exit nil)
    ("d" json-decrement-number-at-point :exit nil)
    ("q" nil))
  (setq js-indent-level 2)
  (define-key json-mode-map (kbd "RET") #'newline)
  (define-key json-mode-map (kbd "A-h") #'gcr-hydra-json/body))

;;;; Graphviz

(use-package graphviz-dot-mode
  :ensure t
  :config
  (setf (cdr (assoc "dot" org-src-lang-modes)) 'graphviz-dot))
(defhydra help/hydra/graphviz-dot-mode (:color blue :hint nil)
  "
Graphviz
^╔═^═══^════════════════════════════╗
^║ ^Use^                            ║
^╚═^═══^════════════════════════════╝
  _p_: View
  _L_: Enable Live Preview On Save
  _l_: Disable Live Preview On Save
  _t_: Complete Word
  _c_: Compile
  _i_: Indent Graph
  _s_: Set Layout
  _q_: Quit "

  ("p" graphviz-dot-preview)
  ("L" graphviz-turn-on-live-preview)
  ("l" graphviz-turn-off-live-preview)
  ("t" graphviz-dot-complete-word)
  ("c" compile)
  ("i" graphviz-dot-indent-graph)
  ("s" graphviz-dot-set-layout)
  ("q" nil))
(defun help/graphviz-dot-mode-hook-fun ()
  (setq
   graphviz-dot-view-command "open %s"
   graphviz-dot-view-edit-command nil
   graphviz-dot-save-before-view t
   graphviz-dot-auto-indent-on-newline nil
   graphviz-dot-indent-width 2
   graphviz-dot-auto-indent-on-braces nil
   graphviz-dot-auto-indent-on-semi nil
   graphviz-dot-delete-completions t
   graphviz-dot-auto-preview-on-save t)
  (local-set-key (kbd "H-j") #'help/hydra/graphviz-dot-mode/body)
  (local-set-key (kbd "H-i") #'compile)
  (local-set-key (kbd "H-o") #'graphviz-dot-complete-word))
(add-hook 'graphviz-dot-mode-hook #'help/graphviz-dot-mode-hook-fun)

;;;; Markdown

(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (use-package ox-gfm
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode)))
  (use-package markdown-toc :ensure t)
  (setq markdown-open-command "/Users/gcr/util/mark")
  (setq markdown-header-scaling t)
  (defun gcr-markdown-mode-hook-fn ()
    (interactive)
    (remove-hook 'before-save-hook #'gcr-indent-buffer))
  (add-hook 'markdown-mode-hook #'gcr-markdown-mode-hook-fn))

;;;; YAML

(use-package yaml-mode
  :ensure t
  :config
  (use-package indent-guide
    :ensure t)
  (defun gcr-yaml-mode-hook-fn ()
    (remove-hook 'before-save-hook #'gcr-indent-buffer)
    (turn-off-auto-fill)
    (indent-guide-mode))
  (add-hook 'yaml-mode-hook #'gcr-yaml-mode-hook-fn)
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))
