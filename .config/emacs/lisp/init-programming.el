;;; -*- lexical-binding: t; -*-

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package ada-ts-mode
  :custom
  (ada-ts-mode-grammar-install 'auto)
  (ada-ts-mode-indent-backend 'lsp))
(use-package gpr-ts-mode
  :custom
  (gpr-ts-mode-grammar-install 'auto))

(use-package eglot
  :ensure nil
  :hook ((ada-ts-mode gpr-ts-mode typescript-ts-mode) . eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-ignored-server-capabilities
   '(:documentHighlighProvider
     :colorProvider
     :foldingRangeProvider)))

(defun alwm/prog-mode-hook ()
  "custom settings for prog mode"
  (display-line-numbers-mode))
(add-hook 'prog-mode-hook 'alwm/prog-mode-hook)

(setopt project-vc-extra-root-markers
        '("alire.toml" ".gpr" "package.json"))

(provide 'init-programming)
