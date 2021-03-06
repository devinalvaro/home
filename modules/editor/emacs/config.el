;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Devin Alvaro"
      user-mail-address "devin.alvaro@gmail.com")

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
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Notes/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)


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

;; Global Configurations

(setq +emacs-lisp-disable-flycheck-in-dirs '("~/.emacs.d"
                                             "~/.config/doom"
                                             "~/Codes/home/modules/editor/emacs"))

(defadvice! fix-lookup-handlers (ret)
  :filter-return '(+lsp-lookup-references-handler +lsp-lookup-definition-handler)
  (when ret 'deferred))

(setq +format-on-save-enabled-modes
      '(go-mode
        rustic-mode))

(setq projectile-auto-discover t)
(setq projectile-project-search-path '("~/Codes/"))
(setq projectile-track-known-projects-automatically nil)

(map! :leader
      "o a" nil
      "o A" nil)

(map! :mnv "-" #'dired-jump
      :mnv "+" #'magit-status
      :i "C-d" #'delete-char)

;; Package Configurations

;; Evil-snipe
(use-package! evil-snipe
  :config
  (setq evil-snipe-scope 'visible))

;; Org-roam
(use-package! org-roam
  :config
  (setq org-roam-capture-templates
        '(("d" "default" plain #'org-roam-capture--get-point "%?"
           :file-name "${slug}"
           :head "#+title: ${title}\n"
           :unnarrowed t)))
  (setq org-roam-directory "~/Dropbox/Notes/org-roam/")
  (setq +org-roam-open-buffer-on-find-file nil))

;; Major Mode Hooks

;; Org
(map! :after org
      :map org-mode-map
      :localleader
      "n" nil)

;; Minor Mode Hooks

;; LSP
(add-hook! lsp-mode
  (setq lsp-enable-symbol-highlighting nil)
  (lsp-register-custom-settings
   '(("gopls.experimentalWorkspaceModule" t t))))
