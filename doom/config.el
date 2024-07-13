;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "zefiru"
       user-mail-address "zefiru@protonmail.com")


;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-big-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/code/github.com/zet")
(setq org-roam-directory "~/code/github.com/zet")
(setq org-roam-dailies-directory "~/code/github.com/zet")


(setq projectile-project-search-path '("~/code/github.com/"))


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
;; (use-package! eaf
;;   :load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework"
;;   :init
;;   :custom
;;   (eaf-browser-continue-where-left-off t)
;;   (eaf-browser-enable-adblocker t)
;;   (browse-url-browser-function 'eaf-open-browser) ;; Make EAF Browser my default browser
;;   :config
;;   (defalias 'browse-web #'eaf-open-browser)
;;   (require 'eaf-file-manager)
;;   (require 'eaf-music-player)
;;   (require 'eaf-image-viewer)
;;   (require 'eaf-camera)
;;   (require 'eaf-demo)
;;   (require 'eaf-airshare)
;;   (require 'eaf-terminal)
;;   (require 'eaf-markdown-previewer)
;;   (require 'eaf-video-player)
;;   (require 'eaf-vue-demo)
;;   (require 'eaf-file-sender)
;;   (require 'eaf-pdf-viewer)
;;   (require 'eaf-mindmap)
;;   (require 'eaf-netease-cloud-music)
;;   (require 'eaf-jupyter)
;;   (require 'eaf-org-previewer)
;;   (require 'eaf-system-monitor)
;;   (require 'eaf-rss-reader)
;;   (require 'eaf-file-browser)
;;   (require 'eaf-browser)
;;   (require 'eaf-org)
;;   (require 'eaf-mail)

;;   (define-key key-translation-map (kbd "SPC")
;;     (lambda (prompt)
;;       (if (derived-mode-p 'eaf-mode)
;;           (pcase eaf--buffer-app-name
;;             ("browser" (if  (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
;;                            (kbd "SPC")
;;                          (kbd eaf-evil-leader-key)))
;;             ("pdf-viewer" (kbd eaf-evil-leader-key))
;;             ("image-viewer" (kbd eaf-evil-leader-key))
;;             (_  (kbd "SPC")))
;;         (kbd "SPC")))))

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; Radio shortcuts
(map! :leader (:prefix ("r" . "eradio") :desc "Play a radio channel" "p" 'eradio-play))
(map! :leader (:prefix ("r" . "eradio") :desc "Stop the radio player" "s" 'eradio-stop))
(map! :leader (:prefix ("r" . "eradio") :desc "Toggle the radio player" "t" 'eradio-toggle))

(setq eradio-player '("mpv" "--no-video"))
(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")          ;; electronica with defcon-speaker bumpers
                        ("cyberia - lainon"  . "https://lainon.life/radio/cyberia.ogg.m3u") ;; cyberpunk-esque electronica
                        ("cafe - lainon"     . "https://lainon.life/radio/cafe.ogg.m3u")))  ;; boring ambient, but with lain

(eradio-play "https://somafm.com/defcon256.pls")

;; Search the web
(map! :leader "s w" 'eww :desc "Search the web")

;; Phind
(defun start-conversation-with-phind-llm()
 (interactive)
 (evil-window-vsplit)
 (evil-window-move-far-right)
 (call-interactively '+vterm/here)
 (vterm-send-string "tgpt -i\n"))

(map! :leader "s g" #'start-conversation-with-phind-llm :desc "Search with Phind")

(defun tgpt-code-generate (prompt)
  "Generate code using tgpt based on the given PROMPT and insert it at point.
If there's an active selection, it's included in the prompt."
  (interactive
   (list
    (let ((selection (if (use-region-p)
                         (buffer-substring-no-properties (region-beginning) (region-end))
                       "")))
      (read-string (format "Enter prompt for code generation%s: "
                           (if (string-empty-p selection)
                               ""
                             " (selection will be included)"))))))
  (let ((full-prompt (if (use-region-p)
                         (format "Consider this selection: %s\n\nNow, %s"
                                 (buffer-substring-no-properties (region-beginning) (region-end))
                                 prompt)
                       prompt))
        (output-buffer (generate-new-buffer "*tgpt-output*")))
    (unwind-protect
        (progn
          (call-process "tgpt" nil output-buffer nil "-c" full-prompt)
          (with-current-buffer output-buffer
            (goto-char (point-min))
            (let ((generated-code (buffer-substring-no-properties (point-min) (point-max))))
              ;; Remove markdown code block syntax
              (setq generated-code
                    (replace-regexp-in-string "^`{3}[a-zA-Z0-9]*\n" "" generated-code))
              (setq generated-code
                    (replace-regexp-in-string "\n`{3}$" "" generated-code))
              (with-current-buffer (window-buffer (selected-window))
                (if (use-region-p)
                    (delete-region (region-beginning) (region-end)))
                (insert generated-code)))))
      (kill-buffer output-buffer))))

(map! :leader "s c" #'tgpt-code-generate :desc "Generate code with Phind")

(setq browse-url-browser-function 'eww-browse-url)
(defun my-browse-url-with-eww (url &rest args)
  "Browse URL with EWW in a new buffer."
  (interactive "sURL: ")
  (let ((buffer (generate-new-buffer "*eww*")))
    (with-current-buffer buffer
      (eww-mode)
      (eww url))
    (switch-to-buffer buffer)))

(global-set-key (kbd "RET") 'my-browse-url-with-eww)

;; Coding
;; (use-package! lsp-mode
;;   :ensure t
;;   :hook ((web-mode . lsp-deferred)
;;          (css-mode . lsp-deferred)
;;          (js-mode . lsp-deferred))
;;   :commands lsp)

;; (use-package lsp-tailwindcss
;;   :ensure t
;;   :custom
;;   (lsp-tailwindcss-add-on-mode t))

;; (setq lsp-tailwindcss-suggestions t)
;; (setq lsp-tailwindcss-major-modes '(web-mode css-mode js-mode typescript-mode typescript-tsx-mode))
;; (setq lsp-tailwindcss-server-version "0.0.0")
;; (setq company-backends '(company-capf company-files (company-dabbrev-code company-keywords) company-dabbrev))

;; Indent and new line on RET in web mode
(global-set-key (kbd "RET") 'newline-and-indent)

;; Detailed lsp logging
(setq lsp-log-io t)


;; ERC (Emacs IRC)
(require 'erc)

(setq erc-join-buffer 'buffer)
(setq erc-kill-buffer-on-part nil)
(setq erc-kill-queries-on-quit nil)
(setq erc-kill-server-buffer-on-quit nil)

(defun my-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.libera.chat:6667") ;; ERC already active?
      (erc-track-switch-buffer 1) ;; yes: switch to last active
    (erc :server "irc.libera.chat" :port 6667 :nick "Zero"))) ;; no: start ERC

(global-set-key (kbd "C-c e") 'my-erc-start-or-switch)

;; Anki
(use-package! anki-editor)
