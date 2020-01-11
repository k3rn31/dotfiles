;;; init.el -*- lexical-binding: t; -*-
;;; init.el --- Where all the magic begins
;;
;; This is the first thing that gets loaded
;;

;; Set a variable holding the current configuration directory
(setq config-dir (file-name-directory
                  (or load-file-name (buffer-file-name))))

;; Load the main configuration file
(org-babel-load-file (expand-file-name "configuration.org" config-dir))
