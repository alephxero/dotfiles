;;; init.el -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

(require 'sane-defaults)
(require 'straight-package)
(require 'appearance)
(require 'keybinds)
(require 'completions)
(require 'programming)
(require 'utilities)

(provide 'init)
;;; init.el ends here
