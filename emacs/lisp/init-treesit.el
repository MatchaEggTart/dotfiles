;;; init-treesit.el --- the configurations for treesit
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; (use-package tree-sitter
;;   :config
;;   ;; (global-tree-sitter-mode)
;;   (tree-sitter-require 'c)
;;   (tree-sitter-require 'typescript)
;;   
;;   )
;;  
;; (use-package tree-sitter-langs
;;   )

(use-package treesit-auto
  :demand t
  :init
  (setq treesit-language-source-alist
	'(
	  (c          . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-c"))
	  (cpp        . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-cpp"))
	  (bash       . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-bash"))
	  (elisp      . ("https://gh-proxy.com/https://github.com/Wilfred/tree-sitter-elisp"))
	  (html       . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-html"))
	  (css        . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-css"))
	  (javascript . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-javascript"))
	  (typescript . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
	  (tsx        . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	  (json       . ("https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-json"))
	  (org        . ("https://gh-proxy.com/https://github.com/milisims/tree-sitter-org"))
	  (yaml       . ("https://gh-proxy.com/https://github.com/ikatyang/tree-sitter-yaml"))
	  ))
  :mode
  (
   ("\\.go\\'" . go-ts-mode)
   ("/go\\.mod\\'" . go-mod-ts-mode)
   ("\\.rs\\'" . rust-ts-mode)
   ("\\.js\\'" . js-ts-mode)
   ("\\.ts\\'" . typescript-ts-mode)
   ("\\.y[a]?ml\\'" . yaml-ts-mode)
   ;; ("\\.html\\'" . tsx-ts-mode)
   ;; ("\\.sh\\'" . bash-ts-mode)
   )
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode)
  (add-to-list 'treesit-extra-load-path "~/.config/emacs/tree-sitter/tree-sitter-module")
  
  ;; (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  ;; 更多高亮
  (setq treesit-font-lock-level 4)

  ;; 缩进
  (setq c-ts-mode-indent-offset 4)
  ;; js ts
  ;; (setq js-ts-mode-indent-offset 2)
  (setq js-indent-level 2)
  (setq typescript-ts-mode-indent-offset 2)

  )


(provide 'init-treesit)

;;; init-treesit.el ends here

