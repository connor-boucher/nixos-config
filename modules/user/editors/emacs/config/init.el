;;; -*- lexical-binding: t -*-

(defvar config-dir (file-name-directory load-file-name))
(defvar config-modules-dir (expand-file-name "modules" config-dir))

(add-to-list 'load-path config-modules-dir)

(require 'config-packages)
(require 'config-editor)
(require 'config-evil)
(require 'config-modeline)
(require 'config-which-key)
(require 'config-languages)
(require 'config-lsp)
(require 'config-term)
(require 'config-font)
(require 'config-icons)
