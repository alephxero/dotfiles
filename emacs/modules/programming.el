;;; programming.el -*- lexical-binding: t; -*-

;; TODO: look into `dape' for debugging

(use-package display-line-numbers
  :straight (:type built-in)
  :hook prog-mode)

(use-package restclient
  :mode ("\\.http$" . restclient-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (magit-diff-refine-hunk 'all))

(use-package eglot
  :straight (:type built-in)
  :hook ((java-ts-mode
	  typescript-ts-mode
	  tsx-ts-mode
	  javascript-ts-mode)
	 . eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref nil)
  ;; Highlighting and formatting should not be part of the language server.
  ;; Dedicated formatting and highlighting tools are easier to use and more performant.
  (eglot-ignored-server-capabilities
   '(:documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider
     :foldingRangeProvider)))

;; Emacs doesn't understand how to go into a jar archive which is a problem
;; when jumping to Java dependencies. This package fixes that issue.
;; (use-package jararchive
;;   :after eglot
;;   :config
;;   (jararchive-setup))

(use-package eglot-java
  :after eglot
  :diminish
  :hook java-ts-mode)

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :custom
  (markdown-command "multimarkdown"))

(use-package treesitter
  :straight (:type built-in)
  :custom
  (major-mode-remap-alist
   '((bash-mode . bash-ts-mode)
     (css-mode . css-ts-mode)
     (elisp-mode . elisp-ts-mode)
     (js2-mode . javascript-ts-mode)
     (html-mode . html-ts-mode)
     (json-mode . json-ts-mode)
     (toml-mode . toml-ts-mode)
     (tsx-mode . tsx-ts-mode)
     (typescript-mode . typescript-ts-mode)
     (yaml-mode . yaml-ts-mode)
     (java-mode . java-ts-mode)))
  :config
   (setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (java "https://github.com/tree-sitter/tree-sitter-java")))
  (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist)))

;; OCaml tools installed via opam instead of use-package
(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (add-hook 'taureg-mode-hook 'merlin-mode t)
    (setq merlin-command 'opam)))

(provide 'programming)
;;; programming.el ends here
