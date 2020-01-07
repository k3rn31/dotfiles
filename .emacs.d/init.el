;;; init.el -*- lexical-binding: t; -*-
;;; init.el --- Where all the magic begins
;;
;; This is the first thing that gets loaded
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-backends (quote (ascii html icalendar latex md odt confluence)))
 '(package-selected-packages
   (quote
    (diff-hl visual-fill-column feature-mode evil-magit yaml-mode markdown-mode clojure-mode-extra-font-locking cider clojure-mode paredit rainbow-delimiters magit evil-org evil-collection evil helm zenburn-theme auto-compile use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set a variable holding the current configuration directory
(setq config-dir (file-name-directory
                  (or load-file-name (buffer-file-name))))

;; Load the main configuration file
(org-babel-load-file (expand-file-name "configuration.org" config-dir))
