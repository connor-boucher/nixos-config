;;; -*- lexical-binding t; -*-

;; Install and enable which-key
(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.5))


;; Expose the module to the rest of the config
(provide 'config-which-key)
