;;; vscode-tokyo-night-theme.el --- Visual Studio Code Tokyo Night theme -*- lexical-binding: t; -*-

;; Copyright (C) 2024-2025 Parker Vaughn

;; Author: Parker Vaughn
;; URL: https://github.com/tbd
;; Version: 0.0.0

;; Credit: https://github.com/ianyepan/vscode-dark-plus-emacs-theme/tree/master
;; Thank you Ian for releasing your theme ports!

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:
;; A complete port of the default Visual Studio Tokyo Night theme.

;; Please see https://github.com/enkia/tokyo-night-vscode-theme for
;; the VSCode version.

(deftheme vscode-tokyo-night "Tokyo Night Theme")

(defcustom vscode-tokyo-night-box-org-todo t
  "Set box around TODO items in org-mode"
  :type 'boolean
  :group 'tokyo-night)

(defcustom vscode-tokyo-night-scale-org-faces t
  "Scale headlines and other org faces"
  :type 'boolean
  :group 'tokyo-night)

(defcustom vscode-tokyo-night-invert-hl-todo t
  "Set (:invert-video t) on hl-todo face"
  :type 'boolean
  :group 'tokyo-night)

(defcustom vscode-tokyo-night-render-line-highlight 'default
  "Controls rendering of the current line highlight."
  :type '(radio
          (const :tag "None" none)
          (const :tag "Gutter" gutter)
          (const :tag "Line" line)
          (const :tag "Gutter and Line" all)
          (const :tag "Default" default))
  :group 'tokyo-night)

(let ((class '((class color) (min-colors 89)))
      ;; tokyo night palette
      (tk-fg		 "#a9b1d6") ; Editor Foreground
      (tk-bg		 "#1a1b26") ; Editor Background
      (tk-html-ele	 "#f7768e") ; This keyword, HTML elements, Regex group symbol, CSS units, Terminal Red
      (tk-num		 "#ff9e64") ; Number and Boolean constants, Language support constants
      (tk-params	 "#e0af68") ; Function parameters, Regex character sets, Terminal Yellow
      (tk-str		 "#9ece6a") ; Strings, CSS class names
      (tk-obj-keys	 "#73daca") ; Object literal keys, Markdown links, Terminal Green
      (tk-regex-str	 "#b4f9f8") ; Regex literal strings
      (tk-lang-fns	 "#2ac3de") ; Language support functions, CSS HTML elements
      (tk-obj-props	 "#7dcfff") ; Object properties, Regex quantifiers and flags, Markdown headings, Terminal Cyan, Markdown code, Import/export keywords
      (tk-fn-names	 "#7aa2f7") ; Function names, CSS property names, Terminal Blue
      (tk-builtin	 "#bb9af7") ; Control Keywords, Storage Types, Regex symbols and operators, HTML Attributes, Terminal Magenta
      (tk-vars		 "#c0caf5") ; Variables, Class names, Terminal White
      (tk-text		 "#9aa5ce") ; Markdown Text, HTML Text
      (tk-params-hl	 "#cfc9c2") ; Parameters inside functions (semantic highlighting only)
      (tk-comments	 "#565f89") ; Comments
      (tk-black		 "#414868") ; Terminal Black
      (tk-error          "#db4b4b") ; Error
      (tk-warning        "#e0af68") ; Warning
      (tk-isearch        "#e0af68") ; isearch current selection border
      (tk-isearch-bg     "#283357") ; "#3d59a1") ; isearch bg
       
      ;; custom colors
      (ruler             "#101014")
      
      (fg0               "#c0caf5") ; cursor fg
      (fg1               "#a9b1d6") ; default fg
      (fg2               "#515670") ; ?breadcrumb fg
      (fg3               "#aaaaaa") ; prev -> "#f4f4f4")
      (fg4               "#fafafa")
      (bg0               "#111111")
      (bg1               "#1a1b26") ; default bg
      (bg2               "#16161e") ; ?menu bg
      (bg3               "#16161e") ; ?activityBar bg
      (bg4               "#4b474c")
      (bg-hl             "#515c7e") ; ?selection bg
      (vc-r              "#a41511")
      (vc-g              "#4a7f00")
      (vc-b              "#207fa1")
      (key2              "#9ece6a")
      (key3              "#9cdcfe")
      (accent            "#ffffff")
      (numeric           "#b5cea8")
      (mode-line-bg      "#565f89") ; active pane
      (mode-line-bg-dark "#16161e") ; inactive pane
      (line-num          "#363b54")
      (line-num-current  "#737aa2")
      (builtin           "#c586c0")
      (keyword           "#bb9af7")
      (const             "#569cd6")
      (comment           "#565f89")
      (doc               "#ce9178")
      (doc-alt           "#888888")
      (func              "#dcdcaa")
      (str               "#9ece6a")
      (type              "#4ec9b0")
      (var               "#c0caf5")
      (warning           "#f7768e")
      
      ;; standardized palette
      (ms-yellow         "#dcdcaa")
      (ms-bluegreen      "#4ec9b0")
      (ms-magenta        "#c586c0")
      (ms-orange         "#ce9178")
      (ms-lightorange    "#d7ba7d")
      (ms-red            "#d16969")
      (ms-green          "#6a9955")
      (ms-blue           "#569cd6")
      (ms-lightred       "#f19999")
      (ms-lightgreen     "#b5cea8")
      (ms-lightblue      "#9cdcfe")
      (ms-red-bg         "#551b1e")
      (ms-green-bg       "#39422a")
      (ms-blue-bg        "#040e3f")
      (ms-red-bghl       "#74140f")
      (ms-green-bghl     "#4b5332")
      (ms-blue-bghl      "#141e4f"))


  (custom-theme-set-faces
   'vscode-tokyo-night

   ;; basic faces
   `(default                                  ((,class (:background ,tk-bg :foreground ,tk-fg))))
   `(cursor                                   ((,class (:background ,fg0))))
   `(region                                   ((,class (:background ,bg-hl :distant-foreground ,fg0 :extend nil))))
   `(secondary-selection                      ((,class (:inherit region))))
   `(highlight                                ((,class (:inherit region))))
   `(fill-column-indicator                    ((,class (:foreground ,ruler))))
   `(fringe                                   ((,class (:background unspecified :foreground ,fg3))))
   `(show-paren-match                         ((t (:box (:line-width (-1 . -1)) :bold t))))
   `(show-paren-mismatch                      ((t (:foreground ,tk-error :bold t))))
   `(isearch                                  ((,class (:box (:line-width (-1 . -1) :color ,tk-isearch)))))
   `(lazy-highlight                           ((,class (:background ,tk-isearch-bg))))
   `(vertical-border                          ((,class (:foreground ,tk-black))))
   `(minibuffer-prompt                        ((,class (:foreground ,tk-builtin :weight normal))))
   `(link                                     ((,class (:foreground "#3794ff" :underline t))))
   `(error                                    ((,class (:foreground ,tk-error))))
   `(warning                                  ((,class (:foreground ,tk-warning))))
   `(success                                  ((,class (:foreground ,ms-bluegreen))))
;;   `(hl-line                                  ((,class ,(pcase vscode-tokyo-night-render-line-highlight
;;                                                          ((or 'line 'all)
;;                                                           `(:background ,bg1 :box (:color ,bg3 :line-width (0 . -1))))
;;                                                          ('none `(:background ,bg1))
;;                                                          ('default `(:background ,bg3))))))

   ;; font-lock faces
   
   `(font-lock-builtin-face                   ((,class (:foreground ,tk-builtin))))
   `(font-lock-comment-face                   ((,class (:foreground ,tk-comments))))
   `(font-lock-negation-char-face             ((,class (:foreground ,const))))
   `(font-lock-reference-face                 ((,class (:foreground ,const))))
   `(font-lock-constant-face                  ((,class (:foreground ,const))))
   `(font-lock-doc-face                       ((,class (:foreground ,doc))))
   `(font-lock-function-name-face             ((,class (:foreground ,tk-fn-names :bold nil))))
   `(font-lock-keyword-face                   ((,class (:bold nil :foreground ,keyword))))
   `(font-lock-number-face                    ((,class (:foreground ,numeric))))
   `(font-lock-operator-face                  ((,class (:inherit default))))
   `(font-lock-punctuation-face               ((,class (:inherit default))))
   `(font-lock-string-face                    ((,class (:foreground ,str))))
   `(font-lock-type-face                      ((,class (:foreground ,type ))))
   `(font-lock-variable-name-face             ((,class (:foreground ,var))))
   `(font-lock-warning-face                   ((,class (:foreground ,warning :background ,bg2))))
   `(font-lock-regexp-grouping-backslash      ((,class (:foreground ,ms-lightorange))))
   `(font-lock-regexp-grouping-construct      ((,class (:foreground ,ms-lightorange))))

   `(dired-directory                          ((t (:inherit (font-lock-keyword-face)))))
   `(line-number                              ((,class (:inherit default :foreground ,line-num))))
   `(line-number-current-line                 ((,class (:inherit default :foreground ,line-num-current
                                                                 ,@(pcase vscode-tokyo-night-render-line-highlight
                                                                     ((or 'gutter 'all)
                                                                      `(:background ,bg1 :box (:color ,bg3 :line-width (0 . -1))))
                                                                     ((or 'none 'default)
                                                                      `(:background ,bg1)))))))
   `(header-line                              ((,class (:bold nil :foreground ,fg4 :background ,bg3))))

   `(mode-line                                ((,class (:bold nil :foreground ,fg4 :background ,mode-line-bg))))
   `(mode-line-inactive                       ((,class (:bold nil :foreground ,fg1 :background ,mode-line-bg-dark))))
   `(mode-line-buffer-id                      ((,class (:bold nil :foreground ,accent :background unspecified))))
   `(mode-line-highlight                      ((,class (:foreground ,keyword :box nil :weight normal))))
   `(mode-line-emphasis                       ((,class (:foreground ,fg1))))

   `(company-preview-common                   ((t (:foreground unspecified :background ,bg2))))
   `(company-scrollbar-bg                     ((t (:background ,bg2))))
   `(company-scrollbar-fg                     ((t (:background ,bg3))))
   `(company-tooltip                          ((t (:inherit default :background ,bg2))))
   `(company-tooltip-common                   ((t (:foreground ,ms-blue :bold t))))
   `(company-tooltip-selection                ((t (:background ,bg-hl))))
   `(company-tooltip-annotation               ((t (:foreground ,doc-alt)))) ; parameter hints etc.
   `(company-template-field                   ((t (:inherit region))))

   `(org-level-1                              ((,class (:bold nil :foreground ,ms-bluegreen
                                                              ,@(when vscode-tokyo-night-scale-org-faces (list :height 1.1))))))
   `(org-level-2                              ((,class (:bold nil :foreground ,ms-lightblue))))
   `(org-level-3                              ((,class (:bold nil :foreground ,ms-blue))))
   `(org-level-4                              ((,class (:bold nil :foreground ,ms-yellow))))
   `(org-level-5                              ((,class (:bold nil :foreground ,ms-magenta))))
   `(org-level-6                              ((,class (:bold nil :foreground ,ms-orange))))
   `(org-level-7                              ((,class (:bold nil :foreground ,ms-lightorange))))
   `(org-level-8                              ((,class (:bold nil :foreground ,ms-red))))
   `(org-code                                 ((,class (:foreground ,ms-orange))))
   `(org-hide                                 ((,class (:foreground ,bg1))))
   `(org-date                                 ((,class (:underline t :foreground ,var) )))
   `(org-footnote                             ((,class (:underline t :foreground ,fg4))))
   `(org-link                                 ((,class (:underline t :foreground ,type ))))
   `(org-special-keyword                      ((,class (:foreground ,ms-green))))
   `(org-block                                ((,class (:foreground ,fg2 :background ,bg0 :extend t))))
   `(org-quote                                ((,class (:inherit org-block :slant italic))))
   `(org-verse                                ((,class (:inherit org-block :slant italic))))
   `(org-todo                                 ((,class (,@(when vscode-tokyo-night-box-org-todo (list :box '(:line-width 1 :color ,ms-lightred)))
                                                        :foreground ,ms-lightred :bold nil))))
   `(org-done                                 ((,class (:box (:line-width 1 :color ,ms-lightgreen) :foreground ,ms-lightgreen :bold nil ))))
   `(org-warning                              ((,class (:underline t :foreground ,warning))))
   `(org-agenda-structure                     ((,class (:weight normal :foreground ,fg3 :box (:color ,fg4) :background ,bg3))))
   `(org-agenda-date                          ((,class (:foreground ,var ,@(when vscode-tokyo-night-scale-org-faces (list :height 1.1))))))
   `(org-agenda-date-weekend                  ((,class (:weight normal :foreground ,fg4))))
   `(org-agenda-date-today                    ((,class (:weight normal :foreground ,keyword
                                                                ,@(when vscode-tokyo-night-scale-org-faces (list :height 1.2))))))
   `(org-agenda-done                          ((,class (:foreground ,bg4))))
   `(org-scheduled                            ((,class (:foreground ,type))))
   `(org-scheduled-today                      ((,class (:foreground ,tk-fn-names :weight normal
                                                                    ,@(when vscode-tokyo-night-scale-org-faces (list :height 1.2))))))
   `(org-ellipsis                             ((,class (:foreground ,tk-builtin))))
   `(org-verbatim                             ((,class (:foreground ,ms-lightorange))))
   `(org-document-title                       ((,class (:foreground ,type :bold t
                                                                    ,@(when vscode-tokyo-night-scale-org-faces (list :height 1.2)))))) ; title
   `(org-document-info                        ((,class (:foreground ,ms-yellow)))) ; author, date etc.
   `(org-document-info-keyword                ((,class (:foreground ,ms-green))))  ; "#+Title", "#+Date" etc.
   `(org-sexp-date                            ((,class (:foreground ,fg4))))
   `(org-table                                ((,class (:foreground ,fg2 :background ,bg3))))

   `(font-latex-bold-face                     ((,class (:foreground ,type))))
   `(font-latex-italic-face                   ((,class (:foreground ,key3 :italic t))))
   `(font-latex-string-face                   ((,class (:foreground ,str))))
   `(font-latex-match-reference-keywords      ((,class (:foreground ,const))))
   `(font-latex-match-variable-keywords       ((,class (:foreground ,var))))

   `(ido-only-match                           ((,class (:foreground ,keyword))))
   `(ido-subdir                               ((,class (:weight normal :foreground ,fg0))))
   `(ido-first-match                          ((,class (:foreground ,keyword :bold nil))))

   `(gnus-header-content                      ((,class (:foreground ,keyword))))
   `(gnus-header-from                         ((,class (:foreground ,var))))
   `(gnus-header-name                         ((,class (:foreground ,type))))
   `(gnus-header-subject                      ((,class (:foreground ,tk-fn-names :bold nil))))

   `(mu4e-view-url-number-face                ((,class (:foreground ,type))))
   `(mu4e-cited-1-face                        ((,class (:foreground ,fg2))))
   `(mu4e-cited-7-face                        ((,class (:foreground ,fg3))))
   `(mu4e-header-marks-face                   ((,class (:foreground ,type))))

   `(ffap                                     ((,class (:foreground ,fg4))))

   `(js2-private-function-call                ((,class (:foreground ,const))))
   `(js2-jsdoc-html-tag-delimiter             ((,class (:foreground ,str))))
   `(js2-jsdoc-html-tag-name                  ((,class (:foreground ,key2))))
   `(js2-external-variable                    ((,class (:foreground ,type  ))))
   `(js2-function-param                       ((,class (:foreground ,const))))
   `(js2-jsdoc-value                          ((,class (:foreground ,str))))
   `(js2-private-member                       ((,class (:foreground ,fg3))))
   `(js2-warning                              ((t (:underline ,warning))))
   `(js2-error                                ((t (:foreground ,warning :weight normal))))
   `(js2-jsdoc-tag                            ((t (:foreground ,var))))
   `(js2-jsdoc-type                           ((t (:foreground ,var))))
   `(js2-instance-member                      ((t (:foreground ,var))))
   `(js2-object-property                      ((t (:foreground ,tk-fn-names))))
   `(js2-magic-paren                          ((t (:foreground ,const))))
   `(js2-function-call                        ((t (:foreground ,const))))
   `(js2-keywords                             ((t (:foreground ,keyword))))
   `(js3-warning-face                         ((,class (:underline ,keyword))))
   `(js3-error-face                           ((,class (:underline ,warning))))
   `(js3-external-variable-face               ((,class (:foreground ,var))))
   `(js3-function-param-face                  ((,class (:foreground ,key3))))
   `(js3-jsdoc-tag-face                       ((,class (:foreground ,keyword))))
   `(js3-instance-member-face                 ((,class (:foreground ,const))))

   `(ac-completion-face                       ((,class (:underline t :foreground ,keyword))))
   `(info-quoted-name                         ((,class (:foreground ,tk-builtin))))
   `(info-string                              ((,class (:foreground ,str))))
   `(icompletep-determined                    ((,class :foreground ,tk-builtin)))

   `(slime-repl-inputed-output-face           ((,class (:foreground ,type))))
   `(trailing-whitespace                      ((,class :foreground unspecified :background ,warning)))

   `(rainbow-delimiters-depth-1-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-2-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-3-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-4-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-5-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-6-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-depth-7-face          ((,class :foreground "gold")))
   `(rainbow-delimiters-depth-8-face          ((,class :foreground "orchid")))
   `(rainbow-delimiters-depth-9-face          ((,class :foreground "LightSkyBlue")))
   `(rainbow-delimiters-unmatched-face        ((,class :foreground ,warning)))

;;   `(magit-item-highlight                     ((,class :background ,bg3)))
;;   `(magit-hunk-heading                       ((,class (:background ,bg3))))
;;   `(magit-hunk-heading-highlight             ((,class (:background ,bg3))))
;;   `(magit-bisect-bad                         ((t (:foreground ,ms-red))))
;;   `(magit-bisect-good                        ((t (:foreground ,ms-green))))
;;   `(magit-bisect-skip                        ((t (:foreground ,ms-orange))))
;;   `(magit-blame-date                         ((t (:foreground ,ms-red))))
;;   `(magit-blame-heading                      ((t (:foreground ,ms-orange :background ,bg3 :extend t))))
;;   `(magit-branch                             ((,class (:foreground ,ms-blue :weight normal))))
;;   `(magit-branch-current                     ((t (:foreground ,ms-blue))))
;;   `(magit-branch-local                       ((t (:foreground ,ms-bluegreen))))
;;   `(magit-branch-remote                      ((t (:foreground ,ms-green))))
;;   `(magit-cherry-equivalent                  ((t (:foreground ,ms-magenta))))
;;   `(magit-cherry-unmatched                   ((t (:foreground ,ms-bluegreen))))
;;   `(magit-diff-added                         ((t (:foreground ,fg2 :background ,ms-green-bg :extend t))))
;;   `(magit-diff-added-highlight               ((t (:foreground ,fg3 :background ,ms-green-bghl :extend t))))
;;   `(magit-diff-removed                       ((t (:foreground ,fg2 :background ,ms-red-bg :extend t))))
;;   `(magit-diff-removed-highlight             ((t (:foreground ,fg3 :background ,ms-red-bghl :extend t))))
;;   `(magit-diff-base                          ((t (:foreground ,bg1 :background ,ms-orange :extend t))))
;;   `(magit-diff-base-highlight                ((t (:foreground ,ms-orange :background ,bg3 :extend t))))
;;   `(magit-diff-context                       ((t (:foreground ,fg0 :extend t))))
;;   `(magit-diff-context-highlight             ((,class (:foreground ,fg1 :background ,bg2))))
;;   `(magit-diff-file-header                   ((,class (:foreground ,fg2 :background ,bg3))))
;;   `(magit-diff-file-heading                  ((t (:foreground ,fg1 :extend t))))
;;   `(magit-diff-file-heading-highlight        ((t (:background ,bg3 :extend t))))
;;   `(magit-diff-file-heading-selection        ((t (:foreground ,ms-orange :background ,bg3 :extend t))))
;;   `(magit-diff-hunk-heading                  ((t (:foreground ,fg1 :background ,bg3 :extend t))))
;;   `(magit-diff-hunk-heading-highlight        ((t (:background ,bg3 :extend t))))
;;   `(magit-diff-lines-heading                 ((t (:foreground ,ms-yellow :background ,ms-red :extend t))))
;;   `(magit-diffstat-added                     ((t (:foreground ,ms-green))))
;;   `(magit-diffstat-removed                   ((t (:foreground ,ms-orange))))
;;   `(magit-dimmed                             ((t (:foreground ,comment))))
;;   `(magit-filename                           ((t (:foreground ,ms-magenta))))
;;   `(magit-hash                               ((t (:foreground ,comment))))
;;   `(magit-header-line                        ((t (:inherit nil))))
;;   `(magit-log-author                         ((t (:foreground ,ms-orange))))
;;   `(magit-log-date                           ((t (:foreground ,ms-blue))))
;;   `(magit-log-graph                          ((t (:foreground ,comment))))
;;   `(magit-mode-line-process                  ((t (:foreground ,ms-orange))))
;;   `(magit-mode-line-process-error            ((t (:foreground ,ms-red))))
;;   `(magit-process-ok                         ((t (:inherit success))))
;;   `(magit-process-ng                         ((t (:inherit error))))
;;   `(magit-reflog-amend                       ((t (:foreground ,ms-magenta))))
;;   `(magit-reflog-checkout                    ((t (:foreground ,ms-blue))))
;;   `(magit-reflog-cherry-pick                 ((t (:foreground ,ms-green))))
;;   `(magit-reflog-commit                      ((t (:foreground ,ms-green))))
;;   `(magit-reflog-merge                       ((t (:foreground ,ms-green))))
;;   `(magit-reflog-other                       ((t (:foreground ,ms-bluegreen))))
;;   `(magit-reflog-rebase                      ((t (:foreground ,ms-magenta))))
;;   `(magit-reflog-remote                      ((t (:foreground ,ms-bluegreen))))
;;   `(magit-reflog-reset                       ((t (:inherit error))))
;;   `(magit-refname                            ((t (:foreground ,comment))))
;;   `(magit-section-heading                    ((t (:foreground ,ms-magenta))))
;;   `(magit-section-heading-selection          ((t (:foreground ,ms-orange :extend t))))
;;   `(magit-section-highlight                  ((t (:background ,bg3 :extend t))))
;;   `(magit-sequence-drop                      ((t (:foreground ,ms-red))))
;;   `(magit-sequence-head                      ((t (:foreground ,ms-blue))))
;;   `(magit-sequence-part                      ((t (:foreground ,ms-orange))))
;;   `(magit-sequence-stop                      ((t (:foreground ,ms-green))))
;;   `(magit-signature-bad                      ((t (:inherit error))))
;;   `(magit-signature-error                    ((t (:inherit error))))
;;   `(magit-signature-expired-key              ((t (:foreground ,ms-orange))))
;;   `(magit-signature-good                     ((t (:inherit success))))
;;   `(magit-signature-revoked                  ((t (:foreground ,ms-magenta))))
;;   `(magit-signature-untrusted                ((t (:foreground ,ms-bluegreen))))
;;   `(magit-tag                                ((t (:foreground ,ms-yellow))))

   `(git-commit-summary                       ((t (:inherit default)))) ; magit commit message face

   `(term                                     ((,class (:foreground ,fg1 :background ,bg1))))
   `(term-color-black                         ((,class (:foreground ,bg3 :background ,bg3))))
   `(term-color-blue                          ((,class (:foreground ,ms-blue :background ,tk-fn-names))))
   `(term-color-red                           ((,class (:foreground ,ms-red :background ,bg3))))
   `(term-color-green                         ((,class (:foreground ,ms-green :background ,bg3))))
   `(term-color-yellow                        ((,class (:foreground ,ms-yellow :background ,var))))
   `(term-color-magenta                       ((,class (:foreground ,ms-magenta :background ,tk-builtin))))
   `(term-color-cyan                          ((,class (:foreground ,ms-bluegreen :background ,str))))
   `(term-color-white                         ((,class (:foreground ,fg1 :background ,fg2))))

   `(diredfl-autofile-name                    ((t (:foreground ,fg0))))
   `(diredfl-compressed-file-name             ((t (:foreground ,ms-yellow))))
   `(diredfl-compressed-file-suffix           ((t (:foreground ,doc-alt))))
   `(diredfl-date-time                        ((t (:foreground ,ms-bluegreen))))
   `(diredfl-deletion                         ((t (:foreground ,ms-red :bold t))))
   `(diredfl-deletion-file-name               ((t (:foreground ,ms-red ))))
   `(diredfl-dir-heading                      ((t (:foreground ,ms-blue :bold t))))
   `(diredfl-dir-name                         ((t (:foreground ,ms-blue))))
   `(diredfl-dir-priv                         ((t (:foreground ,ms-blue))))
   `(diredfl-exec-priv                        ((t (:foreground ,ms-green))))
   `(diredfl-executable-tag                   ((t (:foreground ,ms-green))))
   `(diredfl-file-name                        ((t (:foreground ,fg1))))
   `(diredfl-file-suffix                      ((t (:foreground ,doc-alt))))
   `(diredfl-flag-mark                        ((t (:foreground ,ms-yellow :bold t))))
   `(diredfl-ignored-file-name                ((t (:foreground ,doc-alt))))
   `(diredfl-link-priv                        ((t (:foreground ,ms-magenta))))
   `(diredfl-no-priv                          ((t (:foreground ,fg1))))
   `(diredfl-number                           ((t (:foreground ,ms-orange))))
   `(diredfl-other-priv                       ((t (:foreground ,ms-magenta))))
   `(diredfl-rare-priv                        ((t (:foreground ,fg1))))
   `(diredfl-read-priv                        ((t (:foreground ,ms-yellow))))
   `(diredfl-symlink                          ((t (:foreground ,ms-magenta))))
   `(diredfl-tagged-autofile-name             ((t (:foreground ,fg0))))
   `(diredfl-write-priv                       ((t (:foreground ,ms-red))))

   `(helm-header                              ((,class (:foreground ,fg2 :background ,bg1 :underline nil :box nil))))
   `(helm-source-header                       ((,class (:foreground ,keyword :background ,bg1 :underline nil :weight normal))))
   `(helm-selection                           ((,class (:background ,bg-hl :underline nil :extend t))))
   `(helm-selection-line                      ((,class (:background ,bg-hl :extend t))))
   `(helm-visible-mark                        ((,class (:foreground ,bg1 :background ,bg3))))
   `(helm-candidate-number                    ((,class (:foreground ,bg1 :background ,fg1))))
   `(helm-separator                           ((,class (:foreground ,type :background ,bg1))))
   `(helm-time-zone-current                   ((,class (:foreground ,tk-builtin :background ,bg1))))
   `(helm-time-zone-home                      ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-not-saved                    ((,class (:foreground ,type :background ,bg1))))
   `(helm-buffer-process                      ((,class (:foreground ,tk-builtin :background ,bg1))))
   `(helm-buffer-saved-out                    ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-buffer-size                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-ff-directory                        ((,class (:foreground ,tk-fn-names :background ,bg1 :weight normal))))
   `(helm-ff-file                             ((,class (:foreground ,fg1 :background ,bg1 :weight normal))))
   `(helm-ff-executable                       ((,class (:foreground ,key2 :background ,bg1 :weight normal))))
   `(helm-ff-invalid-symlink                  ((,class (:foreground ,key3 :background ,bg1 :weight normal))))
   `(helm-ff-symlink                          ((,class (:foreground ,keyword :background ,bg1 :weight normal))))
   `(helm-ff-prefix                           ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
   `(helm-grep-cmd-line                       ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-file                           ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-finish                         ((,class (:foreground ,fg2 :background ,bg1))))
   `(helm-grep-lineno                         ((,class (:foreground ,fg1 :background ,bg1))))
   `(helm-grep-match                          ((,class (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running                        ((,class (:foreground ,tk-fn-names :background ,bg1))))
   `(helm-moccur-buffer                       ((,class (:foreground ,tk-fn-names :background ,bg1))))
   `(helm-source-go-package-godoc-description ((,class (:foreground ,str))))
   `(helm-bookmark-w3m                        ((,class (:foreground ,type))))

   `(web-mode-html-tag-bracket-face           ((,class (:foreground "#808080"))))
   `(web-mode-html-tag-face                   ((,class (:foreground ,keyword))))
   `(web-mode-html-attr-name-face             ((,class (:foreground ,var))))
   `(web-mode-html-attr-value-face            ((,class (:foreground ,str))))
   `(web-mode-html-attr-equal-face            ((,class (:foreground ,fg1))))
   `(web-mode-builtin-face                    ((,class (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                    ((,class (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                   ((,class (:inherit ,font-lock-constant-face))))
   `(web-mode-keyword-face                    ((,class (:foreground ,keyword))))
   `(web-mode-doctype-face                    ((,class (:inherit ,font-lock-doc-face))))
   `(web-mode-function-name-face              ((,class (:inherit ,font-lock-function-name-face))))
   `(web-mode-string-face                     ((,class (:foreground ,str))))
   `(web-mode-type-face                       ((,class (:inherit ,font-lock-type-face))))
   `(web-mode-warning-face                    ((,class (:inherit ,font-lock-warning-face))))
   `(web-mode-json-key-face                   ((,class (:foreground ,str))))
   `(web-mode-json-context-face               ((,class (:foreground ,str))))

   `(diff-header                              ((t (:foreground ,ms-bluegreen :background nil))))
   `(diff-file-header                         ((t (:foreground ,fg3 :background nil))))
   `(diff-hunk-header                         ((t (:foreground ,fg4 :background ,bg3))))
   `(diff-added                               ((t (:foreground ,fg2 :background ,ms-green-bg))))
   `(diff-removed                             ((t (:foreground ,fg2 :background ,ms-red-bg))))
   `(diff-changed                             ((t (:foreground ,fg2 :background ,ms-blue-bg))))
   `(diff-refine-added                        ((t (:foreground ,fg3 :background ,ms-green-bghl))))
   `(diff-refine-removed                      ((t (:foreground ,fg3 :background ,ms-red-bghl))))
   `(diff-refine-changed                      ((t (:foreground ,fg3 :background ,ms-blue-bghl))))

   `(ediff-fine-diff-Ancestor                 ((t (:background ,ms-red-bghl))))
   `(ediff-fine-diff-A                        ((t (:background ,ms-red-bghl))))
   `(ediff-fine-diff-B                        ((t (:background ,ms-green-bghl))))
   `(ediff-fine-diff-C                        ((t (:background ,ms-blue-bghl))))
   `(ediff-current-diff-Ancestor              ((t (:background ,ms-red-bg))))
   `(ediff-current-diff-A                     ((t (:background ,ms-red-bg))))
   `(ediff-current-diff-B                     ((t (:background ,ms-green-bg))))
   `(ediff-current-diff-C                     ((t (:background ,ms-blue-bg))))
   `(ediff-even-diff-Ancestor                 ((t (:background ,bg3))))
   `(ediff-even-diff-A                        ((t (:background ,bg3))))
   `(ediff-even-diff-B                        ((t (:background ,bg3))))
   `(ediff-even-diff-C                        ((t (:background ,bg3))))
   `(ediff-odd-diff-Ancestor                  ((t (:background ,bg3))))
   `(ediff-odd-diff-A                         ((t (:background ,bg3))))
   `(ediff-odd-diff-B                         ((t (:background ,bg3))))
   `(ediff-odd-diff-C                         ((t (:background ,bg3))))

   `(jde-java-font-lock-package-face          ((t (:foreground ,var))))
   `(jde-java-font-lock-public-face           ((t (:foreground ,keyword))))
   `(jde-java-font-lock-private-face          ((t (:foreground ,keyword))))
   `(jde-java-font-lock-constant-face         ((t (:foreground ,const))))
   `(jde-java-font-lock-modifier-face         ((t (:foreground ,key3))))
   `(jde-jave-font-lock-protected-face        ((t (:foreground ,keyword))))
   `(jde-java-font-lock-number-face           ((t (:foreground ,numeric))))

   `(centaur-tabs-default                     ((t (:background ,bg1 :foreground ,fg1))))
   `(centaur-tabs-selected                    ((t (:background ,bg1 :foreground ,fg3 :box nil))))
   `(centaur-tabs-unselected                  ((t (:background ,bg2 :foreground ,fg0 :box nil))))
   `(centaur-tabs-selected-modified           ((t (:background ,bg2 :foreground ,accent :box nil))))
   `(centaur-tabs-unselected-modified         ((t (:background ,bg2 :foreground ,fg4 :box nil))))
   `(centaur-tabs-active-bar-face             ((t (:background ,accent :box nil))))
   `(centaur-tabs-modified-marker-selected    ((t (:inherit 'centaur-tabs-selected-modified :foreground ,accent :box nil))))
   `(centaur-tabs-modified-marker-unselected  ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,accent :box nil))))

   `(solaire-default-face                     ((t (:inherit default :background ,bg2))))
   `(solaire-minibuffer-face                  ((t (:inherit default :background ,bg2))))
   `(solaire-hl-line-face                     ((t (:inherit hl-line :background ,bg3))))
   `(solaire-org-hide-face                    ((t (:inherit org-hide :background ,bg2))))

   `(ivy-confirm-face                         ((t (:inherit minibuffer-prompt :foreground ,keyword))))
   `(ivy-current-match                        ((t (:background ,bg-hl :extend t))))
   `(ivy-highlight-face                       ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face                  ((t (:inherit minibuffer-prompt :foreground ,warning))))
   `(ivy-minibuffer-match-face-1              ((t (:inherit isearch))))
   `(ivy-minibuffer-match-face-2              ((t (:inherit ivy-minibuffer-match-face-1))))
   `(ivy-minibuffer-match-face-3              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-face-4              ((t (:inherit ivy-minibuffer-match-face-2))))
   `(ivy-minibuffer-match-highlight           ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer                      ((t (:inherit default :foreground ,var))))
   `(ivy-virtual                              ((t (:inherit default :foreground ,doc-alt))))
   `(ivy-posframe                             ((t (:background "#252526"))))

   `(counsel-key-binding                      ((t (:foreground ,var))))

   `(swiper-match-face-1                      ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2                      ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3                      ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4                      ((t (:inherit ivy-minibuffer-match-face-4))))
   `(swiper-line-face                         ((t (:foreground ,fg0 :background ,bg4 :extend t))))

   `(git-gutter:added                         ((t (:foreground ,vc-g :weight normal))))
   `(git-gutter:deleted                       ((t (:foreground ,vc-r :weight normal))))
   `(git-gutter:modified                      ((t (:foreground ,vc-b :weight normal))))
   `(git-gutter-fr:added                      ((t (:foreground ,vc-g :weight normal))))
   `(git-gutter-fr:deleted                    ((t (:foreground ,vc-r :weight normal))))
   `(git-gutter-fr:modified                   ((t (:foreground ,vc-b :weight normal))))

   `(diff-hl-insert                           ((t (:background ,vc-g :foreground ,vc-g))))
   `(diff-hl-delete                           ((t (:background ,vc-r :foreground ,vc-r))))
   `(diff-hl-change                           ((t (:background ,vc-b :foreground ,vc-b))))

   `(neo-dir-link-face                        ((t (:foreground "#cccccc"))))
   `(neo-header-face                          ((t (:foreground "#cccccc"))))
   `(neo-banner-face                          ((t (:foreground "#cccccc"))))
   `(neo-root-dir-face                        ((t (:foreground "#cccccc"))))
   `(neo-file-link-face                       ((t (:foreground "#cccccc"))))
   `(neo-expand-btn-face                      ((t (:foreground "#cccccc"))))

   `(sml/global                               ((t (:foreground ,fg2 :weight normal))))
   `(sml/filename                             ((t (:foreground ,fg2 :weight normal))))
   `(sml/line-number                          ((t (:foreground ,fg2 :weight normal))))
   `(sml/prefix                               ((t (:foreground ,fg2 :weight normal))))
   `(sml/read-only                            ((t (:foreground ,fg2 :weight normal))))
   `(sml/modes                                ((t (:foreground ,fg2 :weight normal))))
   `(sml/modified                             ((t (:foreground ,accent :weight bold))))
   `(sml/charging                             ((t (:foreground ,ms-green :weight normal))))

   `(evil-ex-substitute-matches               ((t (:foreground ,warning :weight normal :strike-through t))))
   `(evil-ex-substitute-replacement           ((t (:foreground ,ms-bluegreen :weight normal))))

   `(hl-todo                                  ((t ,@(when vscode-tokyo-night-invert-hl-todo (list :inverse-video t)))))
   `(highlight-numbers-number                 ((t (:foreground ,numeric))))
   `(highlight-operators-face                 ((t (:inherit default))))
   `(highlight-symbol-face                    ((t (:background "#343a40"))))

   `(highlight-thing                          ((t ,(pcase vscode-tokyo-night-render-line-highlight
                                                     ('default `(:inherit region))
                                                     (_ `(:background ,bg3))))))

   `(window-divider                           ((t (:foreground "gray40"))))
   `(window-divider-last-pixel                ((t (:foreground "gray20"))))
   `(window-divider-first-pixel               ((t (:foreground "gray60"))))

   `(tree-sitter-hl-face:method.call          ((t (:inherit font-lock-function-name-face))))
   `(tree-sitter-hl-face:function.call        ((t (:inherit font-lock-function-name-face))))
   `(tree-sitter-hl-face:operator             ((t (:inherit default))))
   `(tree-sitter-hl-face:constant.builtin     ((t (:inherit font-lock-constant-face))))
   `(tree-sitter-hl-face:number               ((t (:inherit highlight-numbers-number))))
   `(tree-sitter-hl-face:variable.special     ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword              ((t (:foreground ,ms-magenta))))

   `(lsp-ui-doc-background                    ((t (:background ,bg2))))

   `(font-latex-bold-face                     ((t (:inherit bold))))
   `(font-latex-italic-face                   ((t (:inherit italic))))
   `(font-latex-math-face                     ((t (:foreground ,ms-blue))))
   `(font-latex-sectioning-0-face             ((t (:foreground ,ms-blue))))
   `(font-latex-sectioning-1-face             ((t (:foreground ,ms-magenta))))
   `(font-latex-sectioning-2-face             ((t (:foreground ,ms-lightorange))))
   `(font-latex-sectioning-3-face             ((t (:foreground ,ms-lightblue))))
   `(font-latex-sectioning-4-face             ((t (:foreground ,ms-lightred))))
   `(font-latex-sectioning-5-face             ((t (:foreground ,ms-lightgreen))))
   `(font-latex-script-char-face              ((t (:foreground ,ms-blue))))
   `(font-latex-string-face                   ((t (:inherit font-lock-string-face))))
   `(font-latex-warning-face                  ((t (:inherit font-lock-warning-face))))
   `(font-latex-verbatim-face                 ((t (:inherit org-verbatim))))
   `(TeX-error-description-error              ((t (:inherit error :bold t))))
   `(TeX-error-description-warning            ((t (:inherit warning :bold t))))
   `(TeX-error-description-tex-said           ((t (:inherit success :bold t))))

   `(tab-bar-tab-inactive                     ((t (:background "#2D2D2D" :foreground ,fg0))))
   `(tab-bar-tab                              ((t (:background ,bg1 :foreground ,accent))))
   `(tab-line                                 ((t (:background ,bg2))))
   `(tab-bar                                  ((t (:background ,bg1))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'vscode-tokyo-night)
(provide 'vscode-tokyo-night-theme)

;;; vscode-tokyo-night-theme.el ends here
