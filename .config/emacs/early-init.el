;;; -*- lexical-binding: t; -*-

(setopt gc-cons-threshold (* 128 1024 1024))

(setopt read-process-output-mac (* 1024 1024))

(setopt process-adaptive-read-buffering nil)

(provide 'early-init)
