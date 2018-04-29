
(setq user-full-name "Frank Lopez Olivares")
(setq user-mail-address "franklopezolivares@gmail.com")
  (use-package zerodark-theme
    :ensure t
    :init
    (load-theme 'zerodark t))

(set-default-font "monaco 14")
(add-to-list 'default-frame-alist
	     '(font . "monaco 14"))

  (let ((class '((class color) (min-colors 89)))
        (default (if (true-color-p) "#abb2bf" "#afafaf"))
        (light (if (true-color-p) "#ccd4e3" "#d7d7d7"))
        (background (if (true-color-p) "#282c34" "#333333"))
        (background-dark (if (true-color-p) "#24282f" "#222222"))
        (background-darker (if (true-color-p) "#22252c" "#222222"))
        (mode-line-inactive (if "#1c2129" "#222222"))
        (mode-line-active (if (true-color-p) "#6f337e" "#875f87"))
        (background-lighter (if (true-color-p) "#3a3f4b" "#5f5f5f"))
        (background-red (if (true-color-p) "#4c3840" "#5f5f5f"))
        (bright-background-red (if (true-color-p) "#744a5b" "#744a5b"))
        (background-purple (if (true-color-p) "#48384c" "#5f5f5f"))
        (background-blue (if (true-color-p) "#38394c" "#444444"))
        (bright-background-blue (if (true-color-p) "#4e5079" "#4e5079"))
        (background-green (if (true-color-p) "#3d4a41" "#5f5f5f"))
        (bright-background-green (if (true-color-p) "#3f6d54" "#3f6d54"))
        (background-orange (if (true-color-p) "#4a473d" "#5f5f5f"))
        (hl-line (if (true-color-p) "#2c323b" "#333333"))
        (grey (if (true-color-p) "#cccccc" "#cccccc"))
        (grey-dark (if (true-color-p) "#666666" "#666666"))
        (highlight (if (true-color-p) "#3e4451" "#5f5f5f"))
        (comment (if (true-color-p) "#687080" "#707070"))
        (orange (if (true-color-p) "#da8548" "#d7875f"))
        (orange-light (if (true-color-p) "#ddbd78" "#d7af87"))
        (red (if (true-color-p) "#ff6c6b" "#ff5f5f"))
        (purple (if (true-color-p) "#c678dd" "#d787d7"))
        (purple-dark (if (true-color-p) "#64446d" "#5f5f5f"))
        (blue (if (true-color-p) "#61afef" "#5fafff"))
        (blue-dark (if (true-color-p) "#1f5582" "#005f87"))
        (green (if (true-color-p) "#98be65" "#87af5f"))
        (green-light (if (true-color-p) "#9eac8c" "#afaf87"))
        (peach "PeachPuff3")
        (diff-added-background (if (true-color-p) "#284437" "#284437"))
        (diff-added-refined-background (if (true-color-p) "#1e8967" "#1e8967"))
        (diff-removed-background (if (true-color-p) "#583333" "#580000"))
        (diff-removed-refined-background (if (true-color-p) "#b33c49" "#b33c49"))
        (diff-current-background (if (true-color-p) "#29457b" "#29457b"))
        (diff-current-refined-background (if (true-color-p) "#4174ae" "#4174ae"))))

(setq inhibit-startup-message t)
(setq kill-do-not-save-duplicates t)
(setq history-delete-duplicates t)
(setq show-paren-delay 0)

;; Disable menus and scrollbars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(windmove-default-keybindings)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(blink-cursor-mode -1)

;;  Disable bell
(setq ring-bell-function 'ignore)

;; Set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Highlight current-line
(when window-system (add-hook 'prog-mode-hook 'hl-line-mode))

;; Cursor position
(setq line-number-mode t)
(setq column-number-mode t)

;; Clock
(setq display-time-24hr-format t)
(setq display-time-format "%H:%M - %d %B %Y")
(display-time-mode 1)

  (use-package fancy-battery
    :ensure t
    :config
    (setq fancy-battery-show-percentage t)
    (setq battery-update-interval 15)
    (if window-system
        (fancy-battery-mode)
      (display-battery-mode))
    )

  (when window-system
    (use-package pretty-mode
      :ensure t
      :config
      (global-pretty-mode t)))

  (use-package spaceline
    :ensure t
    :config
    (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

  (setq make-backup-files nil)
  (setq auto-save-default nil)

  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox")

;;(use-package org-bullets
;;  :ensure t
;;  :hook
;;  (org-mode . org-bullets-mode)
;;  :config
;;  (setq org-bullets-bullet-list '("◉" "◎" "⚫" "○" "►" "◇")))

 (org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)
    (C . t)
    (calc . t)
    (latex . t)
    (java . t)
    (lisp . t)
    (scheme . t)
    (sh . t)
    (js . t)
    (dot . t)
    (makefile . t)
    (org . t)
    )
)

(defun my-org-confirm-babel-evaluate (lang body)
    "Do not confirm evaluation for these languages."
    (not (or (string= lang "C")
	     (string= lang "C++")
             (string= lang "java")
             (string= lang "python")
             (string= lang "sh")
             (string= lang "emacs-lisp")
             (string= lang "org")
             (string= lang "latex"))))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq org-use-speed-commands t
      ;;org-catch-invisible-edits '(show)
      org-src-fontify-natively t
      ;;org-src-strip-leading-and-trailing-blank-lines t
      org-src-tab-acts-natively t
      )



(bind-keys :map org-mode-map
	   ("\C-cl" . org-store-link)
	   ("\C-cv" . org-babel-tangle)
	   ("\C-cc" . org-capture)
	   ("\C-ca" . org-agenda))

(use-package abbrev
  :diminish)

(use-package ace-jump-mode
  :ensure t
  :defer t
  :diminish
  :bind
  ("M-*" . ace-jump-mode)
  ("M-," . ace-jump-char-mode)
  ("M-l" . ace-jump-line-mode)
)

(use-package ace-mc
  :ensure t
  :bind (("<C-m> h"   . ace-mc-add-multiple-cursors)
	 ("<C-m> M-h" . ace-mc-add-single-cursor)))

(use-package ace-window
  :ensure t
  :defer t
  :config
  (setq aw-keys '(?q ?w ?s ?x ?Q ?W ?S ?X))
  (setq aw-background nil)
  (ace-window-display-mode)
  :bind ("M-p" . ace-window)
  :diminish)

(use-package all-the-icons
  :ensure t
  :config
  (setq neo-theme 'icons)
  ;;(all-the-icons-insert-icons-for 'alltheicon)
  )

  (use-package auto-complete
    :ensure t
    :config
    (ac-config-default)
    ;;(global-auto-complete-mode 1)
    (add-hook 'prog-mode-hook 'auto-complete-mode)
)

  (defun my:ac-c-header-init ()
    "Add header to c programs."
    (use-package auto-complete-c-headers
      :ensure t)
      (add-to-list 'ac-sources 'ac-source-c-headers)
      (add-to-list 'achead:include-directories '"/usr/include/c++/7.3.1/")
      (add-to-list 'achead:include-directories '"/usr/include/")
  )
  ;; Calling this function from c/c++ hooks
  (add-hook 'c++-mode-hook 'my:ac-c-header-init)
  (add-hook 'c-mode-hook 'my:ac-c-header-init)

(use-package autopair
  :ensure t
  :diminish
  :config
  (autopair-global-mode))

(use-package diminish
  :ensure t)

(use-package dired
  :diminish dired-omit-mode
  :config
  (add-hook 'dired-mode-hook (lambda ()
			       (dired-hide-details-mode -1)))
  (setq dired-listing-switches "-alh")
  (put 'dired-find-alternate-file 'disabled nil)
)

  (use-package dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "~/.emacs.d/img/logo_emacs.png")
    (setq dashboard-items '((recents . 5)
                            (projects . 5)))
    (setq dashboard-banner-logo-title "")
    )

(use-package duplicate-thing
  :ensure t
  :defer t)

  (use-package dmenu
    :ensure t
    :disabled
    :bind
    ("S-SPC" . 'dmenu))

(use-package expand-region
  :ensure t
  :defer t
  :bind
  ("C-=" . er/expand-region)
  ("C-c C-: i" . er/mark-inside-quotes)
  ("C-c C-: o" . er/mark-outside-quotes)
  ("C-c  C-: C-o" . er/mark-outside-pairs)
  ("C-c C-: C-i" . er/mark-inside-pairs)
  ("C-c C-: w" . er/mark-word)
  ("C-c C-: s" . er/mark-sentence)
  ("C-c C-: p" . er/mark-paragraph)
  ("C-c  C-: y" . er/mark-symbol)
  ("C-c  C-: u" . er/mark-url)
  ("C-c  C-: d" . er/mark-defun)
  ("C-c  C-: c" . er/mark-comment)
  ("C-c  C-: C-p" . er/mark-org-parent)
  ("C-c  C-: r" . er/contract-region)
  ("C-c  C-: C-s" . er/c-mark-statement)
)

  (use-package flycheck
    :ensure t
    :commands (flycheck-mode
               flycheck-next-error
               flycheck-previous-error)
    :hook
    ((emacs-lisp-mode . flycheck-mode)
     (c++-mode . flycheck-mode)
     (c-mode . flycheck-mode)
     (python-mode . flycheck-mode))
    :init
    (dolist (where '((emacs-lisp-mode-hook . emacs-lisp-mode-map)
                     (c++-mode-hook . c++-mode-map)
                     (c-mode-common-hook . c-mode-base-map)
                     (python-mode-hook . python-mode-map)))
      (add-hook (car where)
                `(lambda ()
                   (bind-key "M-n" #'flycheck-next-error ,(cdr where))
                   (bind-key "M-<escape> M-n" #'flycheck-previous-error ,(cdr where)))
                t))
    :config
    (defalias 'show-error-at-point-soon
      'flycheck-show-error-at-point)
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
    (defun my-flycheck-c++-mode ()
      (setq flycheck-c/c++-gcc-executable "/usr/bin/g++")
      ;;(setq flycheck-c/c++-clang-executable "/usr/bin/clang++")
      (setq flycheck-gcc-language-standard "c++11")
      (setq flycheck-disabled-checkers '(c/c++-clang)))
    (defun my-flycheck-c-mode ()
      (setq flycheck-c/c++-gcc-executable "/usr/bin/gcc")
      (setq flycheck-c/c++-clang-executable "/usr/bin/clang"))
    (add-hook 'c++-mode-hook 'my-flycheck-c++-mode)
    (add-hook 'c-mode-hook 'my-flycheck-c-mode)
  )

  (use-package helm
    :ensure t
    :init
    (helm-mode 1)
    :diminish helm-mode
    :bind
    (("M-x" . helm-M-x)
     ("M-y" . helm-show-kill-ring)
     ("C-x C-f" . helm-find-files)
     ("C-x c o" . helm-occur)
     ("C-x r j" . jump-to-register)
     ("C-x r x" . helm-register)
     ("C-x c l" . helm-locate)
     ("C-c r" . helm-recentf)
     ("C-x b" . helm-buffers-list)
     )
    :bind ((:map helm-map
                ("<tab>" . helm-execute-persistent-action)
                ("C-i" . helm-execute-persistent-action)
                ("C-z" . helm-select-action)
                ("A-v" . helm-previous-page))
           (:map minibuffer-local-map
                 ("M-p" . helm-minibuffer-history)
                 ("M-n" . helm-minibuffer-history)
                 ))
    :config
    (helm-autoresize-mode 1)
    (setq helm-split-window-inside-p              t
          helm-candidate-number-limit             50
          helm-org-headings-fontify               t
          helm-move-to-line-cycle-in-source       t
          helm-find-files-sort-directories        t 
          helm-ff-file-name-history-use-recentf   t
          helm-ff-search-library-in-sexp          t
          helm-ff-skip-boring-files               t
          helm-buffer-skip-remote-checking        t
          helm-echo-input-in-header-line          t
          helm-mode-fuzzy-match                   t
          helm-buffers-fuzzy-matching             t
          helm-semantic-fuzzy-match               t
          helm-M-x-fuzzy-match                    t
          helm-imenu-fuzzy-match                  t
          helm-lisp-fuzzy-completion              t
          helm-buffer-skip-remote-checking        t
          helm-locate-fuzzy-match                 t
          helm-display-header-line                nil
          )
    )

(use-package helm-descbinds
  :ensure t
  :bind
  ("C-h b" . helm-descbinds))

(use-package helm-describe-modes
  :ensure t
  :after helm
  :bind ("C-h m" . helm-describe-modes))

(use-package indent-guide
  :ensure t
  :diminish
  :hook (prog-mode . indent-guide-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :config
  (setq projectile-completion-system 'helm)
)

(use-package multiple-cursors
  :ensure t
  :after phi-search
  :defer 5
  :bind (("<C-m> ^"     . mc/edit-beginnings-of-lines)
         ("<C-m> `"     . mc/edit-beginnings-of-lines)
         ("<C-m> $"     . mc/edit-ends-of-lines)
         ("<C-m> '"     . mc/edit-ends-of-lines)
         ("<C-m> R"     . mc/reverse-regions)
         ("<C-m> S"     . mc/sort-regions)
         ("<C-m> W"     . mc/mark-all-words-like-this)
         ("<C-m> Y"     . mc/mark-all-symbols-like-this)
         ("<C-m> a"     . mc/mark-all-like-this-dwim)
         ("<C-m> c"     . mc/mark-all-dwim)
         ("<C-m> l"     . mc/insert-letters)
         ("<C-m> n"     . mc/insert-numbers)
         ("<C-m> r"     . mc/mark-all-in-region)
         ("<C-m> s"     . set-rectangular-region-anchor)
         ("<C-m> %"     . mc/mark-all-in-region-regexp)
         ("<C-m> t"     . mc/mark-sgml-tag-pair)
         ("<C-m> w"     . mc/mark-next-like-this-word)
         ("<C-m> x"     . mc/mark-more-like-this-extended)
         ("<C-m> y"     . mc/mark-next-like-this-symbol)
         ("<C-m> C-x"   . reactivate-mark)
         ("<C-m> C-SPC" . mc/mark-pop)
         ("<C-m> ("     . mc/mark-all-symbols-like-this-in-defun)
         ("<C-m> C-("   . mc/mark-all-words-like-this-in-defun)
         ("<C-m> M-("   . mc/mark-all-like-this-in-defun)
         ("<C-m> ["     . mc/vertical-align-with-space)
         ("<C-m> {"     . mc/vertical-align)
	 ("C-S-n"         . mc/mark-next-like-this)    
	 ("C-S-p"         . mc/mark-previous-like-this))
  :bind (:map selected-keymap
              ("c"   . mc/edit-lines)
              ("."   . mc/mark-next-like-this)
              ("<"   . mc/unmark-next-like-this)
              ("C->" . mc/skip-to-next-like-this)
              (","   . mc/mark-previous-like-this)
              (">"   . mc/unmark-previous-like-this)
              ("C-<" . mc/skip-to-previous-like-this)
              ("y"   . mc/mark-next-symbol-like-this)
              ("Y"   . mc/mark-previous-symbol-like-this)
              ("w"   . mc/mark-next-word-like-this)
              ("W"   . mc/mark-previous-word-like-this))

  :preface
  (defun reactivate-mark ()
    (interactive)
    (activate-mark))
  )

(use-package neotree
  :ensure t
  :bind
  (([f8] . neotree-toggle)
   :map neotree-mode-map
   ("v" . neotree-enter-vertical-split)
   ("h" . neotree-enter-horizontal-split)
   ("d" . neotree-dir)
   )
  :config
  (setq neo-window-fixed-size nil)
  (setq noe-smart-open 1)
  (setq neo-toggle-window-keep-p t)
  (setq neo-force-change-root t)
  (setq neo-autorefresh t))

(use-package nlinum
  :ensure t
  :hook
  (prog-mode . nlinum-mode))

(use-package phi-search
  :ensure t
  :defer 5)

(use-package phi-search-mc
  :ensure t
  :after (phi-search multiple-cursors)
  :config
  (phi-search-mc/setup-keys)
  (add-hook 'isearch-mode-mode #'phi-search-from-isearch-mc/setup-keys))

(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)
	 (org-mode . rainbow-delimiters-mode))
  )

(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode)

  (use-package selected
    :ensure t
    :defer 5
    :diminish selected-minor-mode
    :bind (:map selected-keymap
                ("[" . align-code)
                ("f" . fill-region)
                ("U" . unfill-region)
                ("d" . downcase-region)
                ("u" . upcase-region)
                ("r" . reverse-region)
                ("s" . sort-lines))
    :config
    (selected-global-mode 1))

(use-package smartparens
  :ensure t
  :disabled
  :diminish
  :hook (prog-mode . smartparens-mode))

  (use-package sudo-edit
    :ensure t
    :defer t)

  (use-package swiper
    :ensure t
    :bind (("C-:" . swiper)
           ("C-*" . swiper-all)
           ("C-$" . swiper-multi)
           :map swiper-map
               ("M-y" . yank)
               ("M-%" . swiper-query-replace)
               ("C-." . swiper-avy)
               ("M-c" . swiper-mc))
    :bind (:map isearch-mode-map
               ("C-o" . swiper-from-isearch))
    :config
    (setq swiper-include-line-number-in-search 1))

  (use-package symon
    :ensure t
    :defer t)

(use-package try
  :ensure t
  :defer t
)

  (use-package undo-tree
    :ensure t
    :init
    (global-undo-tree-mode)
    :diminish
    :config
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    )

  (use-package yasnippet
    :ensure t
    :init
    (yas-global-mode 1)
    :diminish yas-minor-mode
    :bind (("C-c y d" . yas-load-directory)
           ("C-c y i" . yas-insert-snippet)    
           ("C-c y f" . yas-visit-snippet-file)
           ("C-c y n" . yas-new-snippet)       
           ("C-c y t" . yas-tryout-snippet)    
           ("C-c y l" . yas-describe-tables)   
           ("C-c y g" . yas/global-mode)       
           ("C-c y m" . yas/minor-mode)        
           ("C-c y a" . yas-reload-all)        
           ("C-c y x" . yas-expand))
    :bind (:map yas-keymap
                ("C-i" . yas-next-field-or-maybe-expand))
    :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
    :config
    (yas-load-directory "~/.emacs.d/snippets")
  )

(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.5)
)
