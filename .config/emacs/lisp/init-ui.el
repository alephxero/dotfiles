;;; -*- lexical-binding: t; -*-

(defun alwm/disable-active-themes ()
  "disable all active themes"
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
(defadvice load-theme (before disable-themes-first activate)
  "Disables all active themes before loading a new one"
  (alwm/disable-active-themes))

(use-package minimal-theme
  :defer nil
  :config
  (load-theme 'minimal-light t)
  (set-face-attribute 'font-lock-string-face nil :foreground "#3c5e2b")
  (set-face-attribute 'fringe nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)))

(use-package mood-line
  :defer nil
  :config
  (mood-line-mode 1)
  (display-time))

(use-package all-the-icons)
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(when (member "Iosevka Custom" (font-family-list))
  (set-face-attribute 'default nil :font "Iosevka Custom-12"))

(defun alwm/set-font-size (new-size)
  (interactive "nFont size: ")
  (set-face-attribute 'default nil :height (* 10 new-size)))

(provide 'init-ui)
