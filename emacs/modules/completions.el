;;; completions.el -*- lexical-binding: t; -*-

(use-package vertico
  :hook after-init
  :custom
  (vertico-cycle nil)
  (vertico-count 10)
  (read-buffer-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :general
  (:keymaps 'vertico-map
	    "<tab>" #'vertico-insert
	    "<escape>" #'minibuffer-keyboard-quit
	    "C-M-n" #'vertico-next-group
	    "C-M-p" #'vertico-previous-group))

(use-package marginalia
  :after vertico
  :hook after-init)

(use-package orderless
  :commands (orderless-filter)
  :custom
  (completion-styles '(orderless))
  (orderless-matching-styles
   '(orderless-literal
     orderless-prefixes
     orderless-flex
     orderless-regexp)))

(use-package corfu
  :hook (prog-mode shell-mode org-mode)
  :bind (:map corfu-map
	      ("C-n" . #'corfu-next)
	      ("C-p" . #'corfu-previous)
	      ("C-e" . #'corfu-quit)
	      ("<tab>" . #'corfu-insert)
	      ("<RET>" . nil)
	      ("C-o" . #'corfu-info-documentation)
	      ("M-n" . #'corfu-popupinfo-scroll-down)
	      ("M-p" . #'corfu-popupinfo-scroll-up))
  :config
  (corfu-popupinfo-mode t)
  :custom
  (corfu-cycle nil)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.25))

(use-package cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))
 

(provide 'completions)
;;; completions.el ends here
