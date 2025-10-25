(use-package! dotenv
  :config
  ;; Load .env from ~/code/github.com/dotfiles/.env on startup
  (dotenv-update-project-env "~/code/github.com/dotfiles/")

  (add-hook 'projectile-after-switch-project-hook
            (lambda ()
              "Loading project-specific .env..."
              (dotenv-update-project-env (projectile-project-root)))))

;; (getenv "GROQ_API_KEY")

(eshell/alias "jenv" "~/.jenv/bin/jenv")

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq emacseverywhere-save-temporary-file nil)

(setq org-directory "~/org/")

(eradio-play "https://somafm.com/groovesalad256.pls")

(map! :leader (:prefix ("r" . "eradio") :desc "Play a radio channel" "p" 'eradio-play))
(map! :leader (:prefix ("r" . "eradio") :desc "Stop the radio player" "s" 'eradio-stop))
(map! :leader (:prefix ("r" . "eradio") :desc "Toggle the radio player" "t" 'eradio-toggle))

(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")         ;; electronica with defcon-speaker bumpers
                        ("metal - soma fm"   . "https://somafm.com/metal130.pls")          ;; \m/
                        ("bossa beyond - soma fm"  . "https://somafm.com/bossa256.pls")    ;; bossa nova
                        ("ambient - soma fm"  . "https://somafm.com/groovesalad256.pls")   ;; ambient and chill
                        ))

(map! :leader "s w" 'eww :desc "Search the web")
(setq eww-auto-rename-buffer 'title)
(setq eww-buffers-queryable nil)

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
