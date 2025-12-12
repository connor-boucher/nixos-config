;;; -*- lexical-binding t; -*-

;; Install marginalia
(use-package marginalia
  :init
  (marginalia-mode 1))


;; Expose the module to the rest of the config
(provide 'config-marginalia)
