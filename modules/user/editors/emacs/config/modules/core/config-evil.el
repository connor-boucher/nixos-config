;;; -*- lexical-binding t; -*-

;; Install evil
(use-package evil
  :init
  (evil-mode 1)

  :config
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "wq" 'save-and-kill-this-buffer)
  (defun save-and-kill-this-buffer()(interactive)(save-buffer)(kill-current-buffer)))

;; Expose the module to the rest of the config
(provide 'config-evil)
