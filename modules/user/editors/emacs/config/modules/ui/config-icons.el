;;; -*- lexical-binding t; -*-

;; Install nerd icons
(use-package nerd-icons)

;; Use nerd icons in dired
(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))


;; Expose the module to the rest of the config
(provide 'config-icons)
