(use-package! dotenv
  :config
  ;; Load .env from ~/code/github.com/dotfiles/.env on startup
  (dotenv-update-project-env "~/code/github.com/dotfiles/")

  (add-hook 'projectile-after-switch-project-hook
            (lambda ()
              "Loading project-specific .env..."
              (dotenv-update-project-env (projectile-project-root)))))

;; (getenv "GROQ_API_KEY")

(add-hook! 'java-mode #'lsp)
(add-hook! 'lsp-mode-hook #'lsp-lens-mode)
(add-hook! 'java-mode-hook #'lsp-java-boot-lens-mode)
(add-hook! 'java-mode-hook #'lsp-deferred)

(map! :leader "d t" #'dap-breakpoint-toggle :desc "Debugger toggle breakpoint")
(map! :leader "d s" #'dap-debug :desc "Debugger start")
(map! :leader "d r" #'dap-debug-restart :desc "Debugger restart")
(map! :leader "d j" #'dap-java-debug-test-class :desc "Debug JUnit test")
(map! :leader "d d" #'dap-disconnect :desc "Debugger disconnect")
(map! :leader "d n" #'dap-next :desc "Debugger next")
(map! :leader "d o" #'dap-step-out :desc "Debugger step over")
(map! :leader "d i" #'dap-step-in :desc "Debugger step in")
(map! :leader "d l" #'dap-locals :desc "Debugger locals")
(map! :leader "d e a" #'dap-ui-expressions-add :desc "Debugger Expression Add")
(map! :leader "d e l" #'dap-ui-expressions :desc "Debugger Expression list")
(map! :leader "d e r" #'dap-ui-expressions-remove :desc "Debugger Expression Remove")
(map! :leader "d b b" #'dap-ui-breakpoints-browse :desc "Debugger Breakpoints Browse")
(map! :leader "d b c" #'dap-breakpoint-delete-all :desc "Debugger Breakpoint Clear")

(defun java-eshell()
  (interactive)
  (let ((file buffer-file-name)
        (buf (get-buffer-create "*eshell-java*")))
    (pop-to-buffer buf)
    (unless (eq major-mode 'eshell-mode)
      (eshell-mode))
    ;; move to end before inserting
    (goto-char (point-max))
    (insert (format "java %s" file))
    (eshell-send-input)))

(map! :leader "j e" #'java-eshell :desc "[J]ava [e]xecute code")

(setenv "NVM_DIR" (expand-file-name "~/.nvm"))
(let ((node-path (concat (getenv "NVM_DIR") "/versions/node/v25.2.1/bin")))
  (setenv "PATH" (concat node-path ":" (getenv "PATH")))
  (setq exec-path (cons node-path exec-path)))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook! 'web-mode-hook #'lsp)

(add-hook! 'eshell-first-time-mode-hook
           (eshell/alias "jenv" "~/.jenv/bin/jenv $*"))

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(modify-frame-parameters nil '((undecorated . t) (skip-taskbar . t)))

(setq emacs-everywhere-frame-parameters
      '((width . 80)        ;; ~600px)
        (height . 15)       ;; 15 characters tall
        (undecorated . t)   ;; remove title bar
        (skip-taskbar . t)  ;; do not show in taskbar
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)))

(setq org-directory "~/org/")

;; Keymaps
(map! :leader (:prefix "t" :desc "[T]angle [O]rg file" "o" 'org-babel-tangle))

(use-package! anki-editor)

;; Keymaps
(map! :leader "n p" 'anki-editor-push-notes :desc "Push Anki notes" )

(eradio-play "https://somafm.com/bossa256.pls")

(map! :leader (:prefix ("r" . "eradio") :desc "Play a radio channel" "p" 'eradio-play))
(map! :leader (:prefix ("r" . "eradio") :desc "Stop the radio player" "s" 'eradio-stop))
(map! :leader (:prefix ("r" . "eradio") :desc "Toggle the radio player" "t" 'eradio-toggle))

(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")         ;; electronica with defcon-speaker bumpers
                        ("metal - soma fm"   . "https://somafm.com/metal130.pls")          ;; \m/
                        ("bossa beyond - soma fm"  . "https://somafm.com/bossa256.pls")    ;; bossa nova
                        ("ambient - soma fm"  . "https://somafm.com/groovesalad256.pls")   ;; ambient and chill
                        ("specials - soma fm"  . "https://somafm.com/nossl/specials.pls")   ;; Soma fm specials, mixed
                        ))

(map! :leader "s w" 'eww :desc "Search the web")
(setq eww-auto-rename-buffer 'title)
(setq eww-buffers-queryable nil)

(map! :leader "s d" 'devdocs-lookup :desc "Search offline docs")

(use-package! gptel)
(setq gptel-default-mode 'org-mode)
(setq gptel-model 'llama-3.3-70b-versatile
      gptel-backend
      (gptel-make-openai "Groq"
        :host "api.groq.com"
        :endpoint "/openai/v1/chat/completions"
        :stream t
        :key (getenv "GROQ_API_KEY") ;can be a function that returns the key
        :models '(llama-3.3-70b-versatile
                  llama-3.1-8b-instant
                  llama3-70b-8192
                  llama3-8b-8192
                  mixtral-8x7b-32768
                  gemma-7b-it)))

(setq elcord-editor-icon "emacs_material_icon")
(elcord-mode 1)
