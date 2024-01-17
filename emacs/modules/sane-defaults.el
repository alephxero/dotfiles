;;; sane-defaults.el -*- lexical-binding: t; -*-

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; disable the 'tism antagonizer
(setq ring-bell-function 'ignore)
;; (electric-pair-mode 1)
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq use-short-answers t)
(setq load-prefer-newer t)

;; misc modes
(savehist-mode t)
(recentf-mode t)
(global-auto-revert-mode t)
(pixel-scroll-mode t)

(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Only show commands applicable in the current mode for M-x
(setq read-extended-command-predicate
      #'command-completion-default-include-p)

;; Handle Emacs clutter files
(setq create-lockfiles nil)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq backup-directory-alist
      `(("." . ,temporary-file-directory)))
(setq backup-by-copying t          ;; more reliable imo
      delete-by-moving-to-trash t
      delete-old-versions t)

(provide 'sane-defaults)
;;; sane-defaults.el ends here
