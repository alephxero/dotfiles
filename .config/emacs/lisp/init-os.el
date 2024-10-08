;;; -*- lexical-binding: t; -*-

(when (eq system-type 'darwin)
  (use-package exec-path-from-shell
    :config
    (setopt exec-path-from-shell-arguments '("-l"))
    (exec-path-from-shell-initialize)))

(provide 'init-os)
