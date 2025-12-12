;;; -*- lexical-binding t; -*-

;; Install dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-navigator t)
  (setq dashboard-items '((registers . 5))))


;; Expose the module to the rest of the config
(provide 'config-dashboard)
