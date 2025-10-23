;; Load the dot-env package
;; (use-package dot-env
;;   :ensure t
;;   :config
;;   (dot-env-config)  ;; Automatically loads from .env file
;;   (when (file-exists-p "../.env")
;;     (dot-env-load "../.env")))  ;; Explicitly load the .env file

;; ;; Test that the environment variable is loaded
;; (message "API Key: %s" (getenv "GROQ_API_KEY"))

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

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

(map! :leader "s w" 'counsel-web-search :desc "Search the web")
(setq eww-auto-rename-buffer 'title)

(use-package! gptel)
(setq gptel-default-mode 'org-mode)
(setq gptel-model 'llama-3.3-70b-versatile
      gptel-backend
      (gptel-make-openai "Groq"
        :host "api.groq.com"
        :endpoint "/openai/v1/chat/completions"
        :stream t
        :key "GROQ"                   ;can be a function that returns the key
        :models '(llama-3.3-70b-versatile
                  llama-3.1-8b-instant
                  llama3-70b-8192
                  llama3-8b-8192
                  mixtral-8x7b-32768
                  gemma-7b-it))
