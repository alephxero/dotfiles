;;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setopt custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'init-core)
(require 'init-os)
(require 'init-ui)
(require 'init-completion)
(require 'init-programming)

(provide 'init)
(put 'upcase-region 'disabled nil)
