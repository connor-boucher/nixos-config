;;; -*- lexical-binding t; -*-

;; Install vertico
(use-package vertico
  :init
  (vertico-mode 1))


;; Expose the module to the rest of the config
(provide 'config-vertico)
