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
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("C-<iso-lefttab>" . centaur-tabs-backward))


;; Expose the module to the rest of the config
(provide 'config-tabs)
