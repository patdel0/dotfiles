;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-tokyo-night)
;; (setq catppuccin-flavor 'frappe) ;; or 'latte, 'macchiato, or 'mocha

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/code/github.com/me")
(setq org-roam-directory "~/code/github.com/me")


(setq projectile-project-search-path '("~/code/github.com/" "~/code/github.com/dxw/"))
(setq projectile-globally-ignored-directories '("~/"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(nerd-icons-install-fonts)
(require 'elcord)
(elcord-mode)

(defvar elcord-timer nil "Timer to check user activity for elcord activation/deactivation.")

(defun check-inactivity-and-deactivate-elcord ()
  (when (and elcord-mode
             (>= (float-time (or (current-idle-time) '(0 0 0))) 1200))
    (elcord-mode -1)))

(defun activate-elcord-on-activity ()
  (unless elcord-mode
    (elcord-mode 1)))

(defun setup-elcord-timer ()
  (setq elcord-timer
        (run-with-timer 0 30 'check-inactivity-and-deactivate-elcord)))

(defun cancel-elcord-timer ()
  (when elcord-timer
    (cancel-timer elcord-timer)
    (setq elcord-timer nil)))

(add-hook 'post-command-hook 'activate-elcord-on-activity)
(setup-elcord-timer)

;; Radio shortcuts
(map! :leader (:prefix ("r" . "eradio") :desc "Play a radio channel" "p" 'eradio-play))
(map! :leader (:prefix ("r" . "eradio") :desc "Stop the radio player" "s" 'eradio-stop))
(map! :leader (:prefix ("r" . "eradio") :desc "Toggle the radio player" "t" 'eradio-toggle))

(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")          ;; electronica with defcon-speaker bumpers
                        ("metal - soma fm"   . "https://somafm.com/metal130.pls")           ;; \m/
                        ("cyberia - lainon"  . "https://lainon.life/radio/cyberia.ogg.m3u") ;; cyberpunk-esque electronica
                        ("cafe - lainon"     . "https://lainon.life/radio/cafe.ogg.m3u")))  ;; boring ambient, but with lain

;; Search the web
(map! :leader "s w" 'eww :desc "Search the web")

;; Phind
(defun start-conversation-with-phind-llm()
 (interactive)
 (evil-window-vsplit)
 (evil-window-move-far-right)
 (call-interactively '+vterm/here)
 (vterm-send-string "tgpt -i\n"))

(map! :leader "s g" #'start-conversation-with-phind-llm :desc "Search with GPT")
