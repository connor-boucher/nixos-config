;;; -*- lexical-binding: t -*-

(defvar config-dir (file-name-directory load-file-name))
(defvar config-modules-dir (expand-file-name "modules" config-dir))

(add-to-list 'load-path config-modules-dir)

;; Core
(add-to-list 'load-path (expand-file-name "core" config-modules-dir))
(require 'config-packages)
(require 'config-editor)
(require 'config-evil)
(require 'config-flycheck)
(require 'config-term)
(require 'config-which-key)

;; UI
(add-to-list 'load-path (expand-file-name "ui" config-modules-dir))
(require 'config-font)
(require 'config-icons)
(require 'config-dashboard)
(require 'config-dirvish)
(require 'config-modeline)
(require 'config-tabs)
(require 'config-treemacs)

;; LSP
(add-to-list 'load-path (expand-file-name "lsp" config-modules-dir))
(require 'config-lsp)

;; Languages
(add-to-list 'load-path (expand-file-name "languages" config-modules-dir))
(require 'config-languages)

;; Completions
(add-to-list 'load-path (expand-file-name "completions" config-modules-dir))
(require 'config-consult)
(require 'config-marginalia)
(require 'config-vertico)
