(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'evil-leader)
(global-evil-leader-mode 1)

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(require 'evil-visualstar)
(global-evil-visualstar-mode 1)

(require 'evil-snipe)
(evil-snipe-mode 1)

(load-theme 'gruvbox t)
