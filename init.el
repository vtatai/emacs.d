(require 'package)
;; Using MELPA not stable because of evil
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(haskell-mode-hook (quote (haskell-indentation-mode interactive-haskell-mode)))
 '(package-selected-packages
   (quote
    (markdown-mode cider clojure-mode projectile pretty-mode haskell-mode evil undo-tree ## neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Fixing path and exec-path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized") 
(load-theme 'solarized t)

;; NeoTree
(global-set-key [f8] 'neotree-toggle)
;; Make neotree switch to projectile root 
(setq projectile-switch-project-action 'neotree-projectile-action)
;; Evil mode neotree hooks
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

;; EVILLLL
(require 'evil)
(evil-mode 1)

;; Allow moving across windows
(windmove-default-keybindings)

;; Saves and restore the session
;; Mostly using projectile now, so not used that often
(desktop-save-mode 1)

;; Pretty mode
(require 'pretty-mode)
(global-pretty-mode t)

;; Auto-save when switching buffer / window / frame
;; http://stackoverflow.com/questions/1413837/emacs-auto-save-on-switch-buffer
(defadvice switch-to-buffer (before save-buffer-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-window (before other-window-now activate)
  (when buffer-file-name (save-buffer)))
(defadvice other-frame (before other-frame-now activate)
  (when buffer-file-name (save-buffer)))

;; Haskell mode
(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

