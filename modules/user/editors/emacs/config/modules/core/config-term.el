;;; -*- lexical-binding t; -*-

;; Install EAT
(use-package eat
  :init
  (setq eat-term-maximum-scrollback 10000)

  (global-set-key (kbd "C-c t") #'eat)
  (global-set-key (kbd "C-c T") #'eat-other-window))


;; Expose the module to the rest of the config
(provide 'config-term)
