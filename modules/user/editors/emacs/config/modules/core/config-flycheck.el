;;; -*- lexical-binding t; -*-

;; Install and enable flycheck
(use-package flycheck
  :config (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flyover
  :hook ((flycheck-mode . flyover-mode)
	 (flymake-mode . flyover-mode)))


;; Expose the module to the rest of the config
(provide 'config-flycheck)
