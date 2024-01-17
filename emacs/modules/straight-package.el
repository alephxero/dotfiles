;;; straight-package.el --- Sets up straight as the package manager -*- lexical-binding: t -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq-default straight-cache-autoloads t
	      straight-check-for-modifivcations nil
	      straight-use-package-by-default t
	      use-package-always-defer t
	      use-package-expand-minimally t)

;; TODO: mood-line hides minor modes so do I need this?
(use-package diminish)

(provide 'straight-package)
;;; straight-package.el ends here
