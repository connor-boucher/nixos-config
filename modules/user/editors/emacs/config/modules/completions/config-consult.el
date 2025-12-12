;;; -*- lexical-binding t; -*-

;; Install consult
(use-package consult
  :bind
  ("C-x b" . consult-buffer))


;; Expose the module to the rest of the config
(provide 'config-consult)
