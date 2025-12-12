;;; -*- lexical-binding t; -*-

;; Disable ugly default UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Respect exact pixel sizes
(setq frame-resize-pixelwise t)

;; Use y or n prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable confirmation when closing with running processes
(setq confirm-kill-processes nil)

;; Disable GUI popups
(setq use-dialog-box nil)

;; Disable bell sound
(setq ring-bell-function 'ignore)

;; Enable relative line numbers
(defun config-enable-line-numbers ()
  (setq display-line-numbers-type 'relative)
  (display-line-numbers-mode 1))

(add-hook 'prog-mode-hook #'config-enable-line-numbers)

;; Autocomplete paired brackets
(electric-pair-mode 1)

;; Disable lockfiles
(setq create-lockfiles nil)

;; Disable backup files
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Define custom registers
(set-register ?e (cons 'file "~/nixos-config/modules/user/editors/emacs/config"))
(set-register ?m (cons 'file "~/nixos-config/modules/"))
(set-register ?n (cons 'file "~/nixos-config"))
(set-register ?s (cons 'file "~/sauce"))

;; Startup screens
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")


;; Expose the module to the rest of the config
(provide 'config-editor)
