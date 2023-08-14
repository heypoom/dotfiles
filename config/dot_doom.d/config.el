;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Phoomparin Mano"
      user-mail-address "phoomparin@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes")
(setq org-roam-directory "~/notes")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! projectile
  (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up)))

; Maximize window upon start
; (add-hook 'window-setup-hook #'toggle-frame-maximized)

; (custom-set-faces
;   '(mode-line ((t (:family "JetBrainsMono Nerd Font" :height 150))))
;   '(mode-line-inactive ((t (:family "JetBrainsMono Nerd Font" :height 150)))))

; (add-hook 'clojure-mode-hook #'paredit-mode)

; (add-hook 'clojure-mode-hook
;           (lambda () (local-set-key (kbd "M-RET") #'cider-eval-region)))

; More generous line spacing
; (setq line-spacing 5)

; Use UTF-8 bullets (https://github.com/sabof/org-bullets) in org-mode
; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

; Remove company's completion delay
;(setq company-minimum-prefix-length 1
;      company-idle-delay 0.0)

; Show project errors on modeline.
;(with-eval-after-load 'lsp-mode
;  ;; :project/:workspace/:file
;  (setq lsp-modeline-diagnostics-scope :project))

; Add icons to company-mode autocompletion (https://github.com/sebastiencs/company-box)
; (add-hook 'company-mode-hook 'company-box-mode)

; Set max-width of company auto-completion tooltip to 50px
; (setq company-tooltip-maximum-width 50)

; Use retina resolutions for LaTeX previews in org-mode
; (setq org-latex-create-formula-image-program 'dvisvgm)
; (setq org-preview-latex-default-process 'dvisvgm)
; (setq org-preview-latex-image-directory "./tex.preview/")
; (setq org-format-latex-options '(:scale 3.0 :foreground default :background default))

; Enable markdown extension for org-roam
; (use-package! md-roam
;   :config (setq md-roam-file-extension-single "md"))

; (setq md-roam-use-markdown-file-links nil) ; default is nil

; "md"
; (setq org-roam-file-extensions '("org"))
; (setq org-roam-tag-sources '(prop md-frontmatter))
; (setq org-roam-title-sources '((mdtitle title mdheadline headline) (mdalias alias)))
