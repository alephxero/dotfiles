;;; -*- lexical-binding: t; -*-

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setopt use-package-always-ensure t)
(setopt use-package-always-defer t)

(setopt inhibit-startup-message t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(setopt use-short-answers t)

(setopt x-underline-at-descent-line t)
(setopt indent-tabs-mode nil)
(setopt tab-width 2)
(setopt indent-line-functon 'insert-tab)

(setopt delete-by-moving-to-trash t)
(setopt create-lock-files nil)
(setopt backup-directory-alist
        `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setopt backup-by-copying t)
(setopt delete-old-versions t)
(setopt kept-new-versions 6)
(setopt kept-old-versions 2)
(setopt version-control t)

(global-auto-revert-mode)
(recentf-mode)

(setopt whitespace-style
        '(face empty spaces tabs newline trailing space-mark tab-mark))
(setopt whitespace-display-mappings
        '(
          (space-mark 32 [183] [46])
          (newline-mark ?\n [172 ?\n] [36 ?\n])
          (newline-mark ?\r [182] [35])
          (tab-mark ?\t [187 ?\t] [62 ?\t])))

(provide 'init-core)
