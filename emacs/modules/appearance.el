;;; appearance.el -*- lexical-binding: t; -*-

(setq-default cursor-in-none-selected-windows nil)

;; This font setup is goofy but I have many different machines and I don't always copy over
;; all my fonts so this picks the first from a list of ones I probably have on the machine.
;; It also let's me quickly change the priority based on my mood.
(defun font-available-p (font-name)
  "Returns the font if found"
  (find-font (font-spec :name font-name)))
(setq preferred-font (cl-find-if 'font-available-p
				 '(
				   "PragmataPro Mono"
				   "BQN386 Unicode"
				   "JuliaMono"
				   "Berkeley Mono"
				   )))
;; I might not have installed any fonts yet (e.g. setting up a new machine) so if none of
;; my preferred fonts were found just go with the default.
(if preferred-font
    (set-face-attribute 'default nil :font preferred-font :height 130 :weight 'normal))

(use-package uniquify
  :straight (:type built-in)
  :custom
  (uniquify-buffer-name-style 'forward))

(add-hook 'dired-mode-hook
	  (lambda () dired-hide-details-mode))

(setq-default compilation-scroll-output t)

;; By default emacs will enable multiple themes at the same time leading to
;; odd results when trying out new themes. Here we ask Emacs to disable any
;; enabled themes before activating a new one.
(defun disable-all-themes ()
  "disable all active themes"
  (dolist (i custom-enabled-themes)
    (disable-theme i))) 
(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(use-package minimal-theme
  :defer nil
  :config
  (load-theme 'minimal-light t))

(use-package which-key
  :diminish
  :hook after-init
  :custom
  (which-key-idle-delay 1.0)
  (which-key-add-column-padding 3))

(use-package mood-line
  :init
  (mood-line-mode t))

(defun al/unenlarge-org-headers ()
    "Disable the enlargening of headers in org-mode"
  (dolist (face '(org-level-1
                  org-level-2
                  org-level-3
                  org-level-4
                  org-level-5))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0)))
(add-hook 'org-mode-hook #'al/unenlarge-org-headers)

(provide 'appearance)
;;; appearance.el ends here
