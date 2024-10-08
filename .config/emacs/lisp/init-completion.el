;;; -*- lexical-binding: t; -*-

(use-package orderless
  :preface
  (defun alwm/icomplete-styles ()
    (setq-local completion-styles '(orderless flex)))
  :config
  (add-hook 'icomplete-minibuffer-setup-hook 'alwm/icomplete-styles)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil))

(use-package marginalia
  :init
  (marginalia-mode))

(fido-vertical-mode 1)

(provide 'init-completion)
