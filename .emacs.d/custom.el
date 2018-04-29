(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-title-format "MyEmacs" t)
 '(ivy-dynamic-exhibit-delay-ms 200)
 '(ivy-height 10)
 '(ivy-initial-inputs-alist nil t)
 '(ivy-magic-tilde nil)
 '(ivy-re-builders-alist (quote ((t . ivy--regex-ignore-order))) t)
 '(ivy-use-virtual-buffers t)
 '(ivy-wrap t)
 '(org-src-fontify-natively t)
 '(org-src-preserve-indentation t)
 '(org-src-strip-leading-and-trailing-blank-lines t t)
 '(org-src-tab-acts-natively t)
 '(org-src-window-setup (quote current-window))
 '(org-use-speed-commands t)
 '(package-selected-packages
   (quote
    (neotree dired-x smartparens duplicate-thing nlinum helm-describe-modes helm-descbinds org-ac diminish yasnippet-snippets zerodark-theme which-key use-package undo-tree try sudo-edit spaceline selected rainbow-mode rainbow-delimiters projectile pretty-mode phi-search-mc org-bullets indent-guide helm fancy-battery expand-region dashboard counsel autopair auto-complete-c-headers ace-window ace-mc))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:height 160 :foreground "#FF4500" :weight bold))))
 '(aw-mode-line-face ((t (:height 160 :background "orange" :foreground "black"))))
 '(cursor ((t (:background "red" :foreground "#272822" :inverse-video t))))
 '(mode-line ((t (:background "#38394c" :foreground "#61afef" :box (:line-width 6 :color "#38394c") :height 1.0))))
 '(mode-line-inactive ((t (:background "#22252c" :foreground "#abb2bf" :box (:line-width 6 :color "#22252c") :height 0.9))))
 '(powerline-active0 ((t (:inherit mode-line))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#FF0000"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#32cd32"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#FFFF00"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#0000FF"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#FF4500"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#008b8b")))))
