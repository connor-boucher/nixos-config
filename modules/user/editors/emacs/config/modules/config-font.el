;;; -*- lexical-binding t; -*-

;; Setup custom font (defaults to JetBrains Mono
(when (member "JetBrainsMono Nerd Font" (font-family-list))
  (set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 120)
  (set-face-attribute 'fixed-pitch nil :family "JetBrainsMono Nerd Font" :height 1.0)
  (set-face-attribute 'variable-pitch nil :family "JetBrainsMono Nerd Font" :height 1.0))


;; Expose the module to the rest of the config
(provide 'config-font)
