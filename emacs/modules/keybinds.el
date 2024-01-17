;;; keybinds.el -*- lexical-binding: t; -*-

(use-package evil
  :hook after-init
  :custom
  (evil-undo-system 'undo-redo)
  (evil-search-module 'isearch)
  (evil-want-C-u-scroll t)
  (evil-want-C-d-scroll t)
  (evil-split-window-below t)
  (evil-split-window-right t)
  (evil-want-keybinding nil))

(use-package general
  :after evil
  :config
  (general-evil-setup)
  (general-create-definer al/leader-keys
			  :states '(normal insert visual emacs)
			  :keymaps 'override
			  :prefix "SPC"
			  :global-prefix "M-SPC")
  (al/leader-keys
    "SPC" '(execute-extended-command :which-key "execute command")
    "<escape>" 'keyboard-escape-quit
    ";" '(eval-last-sexp :which-key "eval s-exp")

    "b" '(:ignore t :which-key "buffer")
    "bb" '(switch-to-buffer :which-key "switch buffer")
    "br" '(revert-buffer :which-key "reload from disk")
    "bk" '(kill-buffer :which-key "kill buffer")

    "f" '(:ignore t :which-key "file")
    "fs" '(save-buffer :which-key "save file")
    "fe" '(dired :which-key "explore")
    "ff" '(find-file :which-key "find file")
    "fp" '(project-find-file :whick-key "find file in project")

    "h" '(:ignore t :which-key "describe")
    "he" '(view-echo-area-messages :which-key "view messages")
    "hf" '(describe-function :which-key "describe function")
    "hv" '(describe-variable :which-key "describe variable")
    "hp" '(describe-package :which-key "describe package")

    "t" '(:ignore t :which-key "toggle")
    "tl" 'display-line-numbers-mode
    "tt" 'load-theme
    "t+" 'text-scale-increase
    "t-" 'text-scale-decrease
    "tf" 'choose-preferred-font
    "tw" 'toggle-word-wrap

    "w" '(:ignore t :which-key "window")
    "ww" '(other-window :which-key "switch window")
    "w0" '(delete-window :which-key "delete window")
    "w1" '(delete-other-windows :which-key "delete window")
    "ws" '(split-window-below :which-key "split horizontally")
    "wv" '(split-window-right :which-key "split vertically")
    "w=" '(balance-windows :which-key "balance windows")
    "wk" '(kill-buffer-and-window :which-key "kill buffer and window")

    "g" '(:ignore t :which-key "git")
    "gb" 'magit-blame
    "gg" 'magit-status
    "gG" 'magit-status-here
    "gl" 'magit-log

    "c" '(:ignore t :which-key "code")
    "cc" '(compile :which-key "compile")
    "ca" '(eglot-code-actions :which-key "code actions")
    "cD" '(flymake-show-project-diagnostics :which-key "project diagnostics")
    ))


(use-package evil-collection
  :after evil
  :custom
  (evil-collection-magit-use-z-for-folds nil)
  :init
  (evil-collection-init '(dired eglot markdown-mode)))

(use-package evil-surround
  :general
  (:states 'operator
	   "s" 'evil-surround-edit
	   "S" 'evil-Surround-edit)
  (:states 'visual
	   "S" 'evil-surround-region
	   "gS" 'evil-Surround-region))

(provide 'keybinds)
;;; keybinds.el ends here
