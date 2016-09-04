(require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Remove scroll/tool/menubars in terminal
;; Set these first so we don't see them flicker
(if (display-graphic-p)
	(progn
	  (menu-bar-mode t)
	  (if (fboundp #'tool-bar-mode) tool-bar-mode t)
	  (if (fboundp #'scroll-bar-mode) scroll-bar-mode 'right)
	  )
  (menu-bar-mode -1)
  (if (fboundp #'tool-bar-mode) tool-bar-mode nil)
  (if (fboundp #'scroll-bar-mode) scroll-bar-mode nil)
)


;; The normal default is fundamental-mode, which does basically nothing
;; Orgmode is also an option, but that's slow to load.
(setq-default major-mode #'text-mode)

;; Ask for y/n instead of "yes"/"no"
(defalias #'yes-or-no-p #'y-or-n-p)

 (use-package evil-leader
   :config
   (evil-leader/set-leader "<SPC>")
   (evil-leader/set-key
     "bb" 'list-buffers
     "fs" 'evil-save)

   :init
   (global-evil-leader-mode))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

  :config
  (evil-mode t))


(use-package projectile)

;; TODO: ag, ag-helm
(use-package helm
  :config (helm-mode 1))

(use-package smooth-scrolling
  :init (setq smooth-scroll-margin 1)
  :config (smooth-scrolling-mode))


(use-package powerline
  :config (powerline-center-evil-theme))

(load-theme 'gruvbox t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (powerline smooth-scrolling flycheck 0blayout evil-leader evil-magit evil-org evil-snipe evil-surround evil-tabs evil-visualstar helm-projectile projectile use-package gruvbox-theme evil ac-helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
