;;; early-init.el -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum)

;;; GCC Emacs optimization setting
(setq-default native-comp-speed 3)
(setq warning-minimum-level :error)

;; This config uses straight.el which is setup later
(setq package-enable-at-startup nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq frame-resize-pixelwise t)

(setq read-process-output-max (* 1024 1024))
(setq process-adaptive-read-buffering nil)
(setq inhibit-startup-message t)

;;; early-init.el ends here
