;;; utilities.el -*- lexical-binding: t; -*-

;; (defvar font-size-alist
;;   '(("BQN386 Unicode" . 120)
;;     ("JuliaMono" . 120)
;;     ("PragmataPro Mono" . 130)
;;     ("Berkeley Mono" . 110)))

;; (let ((assoc-index 0))
;;   (mapcar (lambda (font-size-assoc)
;; 	    (cl-incf assoc-index)
;; 	    (cons assoc-index (car font-size-assoc)))
;; 	font-size-alist))

(defvar preferred-fonts-alist
  '((?1 "BQN386 Unicode" (lambda() (set-face-attribute 'default nil :font "BQN386 Unicode" :height 120 :weight 'normal)))
    (?2 "JuliaMono" (lambda() (set-face-attribute 'default nil :font "JuliaMono" :height 120 :weight 'normal)))
    (?3 "PragmataPro Mono" (lambda() (set-face-attribute 'default nil :font "PragmataPro Mono" :height 130 :weight 'normal)))
    (?4 "Berkeley Mono" (lambda() (set-face-attribute 'default nil :font "Berkeley Mono" :height 110 :weight 'normal))))
  "Preferred fonts to font setting fn association list")

(defun choose-preferred-font ()
  "Choose a preferred font"
  (interactive)
  (let ((choice (read-char-choice (concat
				   (mapconcat
				    (lambda (item) (format "%c %s" (car item) (cadr item))) preferred-fonts-alist "\n" )
				   "\n")
				  (mapcar #'car preferred-fonts-alist))))
    (funcall (nth 2 (assoc choice preferred-fonts-alist)))))


(provide 'utilities)
;;; utilities.el ends here
