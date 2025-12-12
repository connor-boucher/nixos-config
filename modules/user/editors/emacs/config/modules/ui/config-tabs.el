;;; -*- lexical-binding t; -*-

;; Install centaur tabs
(use-package centaur-tabs
  :hook (after-init . centaur-tabs-mode)

  :config
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-bar 'left)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-icon-type 'nerd-icons)
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-modified-marker t)
  (add-hook 'dired-mode-hook 'centaur-tabs-local-mode)
  (add-hook 'magit-mode-hook 'centaur-tabs-local-mode)

  :bind
  ("C-<tab>" . centaur-tabs-forward-tab)
  ("C-<iso-lefttab>" . centaur-tabs-backward-tab))


;; Expose the module to the rest of the config
(provide 'config-tabs)
