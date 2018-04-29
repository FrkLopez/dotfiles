(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
  (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
  (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This is all kinds of necessary
(require 'package)
(setq package-enable-at-startup nil)

;;; remove SC if you are not using sunrise commander and org if you like outdated packages
(setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-verbose t)
(setq use-package-expand-minimally nil)

(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(setq custom-file
      (expand-file-name "~/.emacs.d/custom.el"))
(load custom-file)
(load "server")
(unless (server-running-p) (server-start))

;;; Keymaps
(define-key input-decode-map [?\C-m] [C-m])

(eval-and-compile
  (mapc #'(lambda (entry)
            (define-prefix-command (cdr entry))
            (bind-key (car entry) (cdr entry)))
        '(("C-h e" . my-ctrl-h-e-map)
	  ("C-h D" . my-ctrl-h-D-map)
	  ("C-h a" . my-ctrl-h-a-map)
	  ("C-h c" . my-ctrl-h-c-map)
	  ("C-h f" . my-ctrl-h-f-map)
	  ("C-h p" . my-ctrl-h-p-map)
	  ("C-h o" . my-ctrl-h-o-map)
	  ("C-c V" . my-ctrl-c-V-map)
	  ("C-c h" . my-helm-map)
	  ("C-."   . my-ctrl-dot-map)
	  ("C-,"   . my-ctrl-comma-map)
	  )))

(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
(bind-key "C-x f" 'ido-dired)
(bind-key "<f5>" 'revert-buffer)

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(bind-keys :prefix-map my-ctrl-h-e-map
	   :prefix "C-h e"
	   ("E" . eval-buffer)
	   ("e" . view-echo-area-messages)
	   ("t" . try)
	   ("d" . duplicate-thing)
	   ("r" . config-reload))
