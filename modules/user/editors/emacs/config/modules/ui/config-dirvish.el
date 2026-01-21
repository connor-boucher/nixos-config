;;; -*- lexical-binding t; -*-

;; Install dirvish
(use-package dirvish
  :init
  (dirvish-override-dired-mode))


;; Expose the module to the rest of the config
(provide 'config-dirvish)
