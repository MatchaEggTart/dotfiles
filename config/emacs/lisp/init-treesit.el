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
	   (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
	   (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
	   (bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
	   (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
	   (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
	   (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
	   (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
	   (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
	   (tsx	      . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	   (json	      . ("https://github.com/tree-sitter/tree-sitter-json"))
	   (org	      . ("https://github.com/milisims/tree-sitter-org"))
	   (yaml	      . ("https://github.com/ikatyang/tree-sitter-yaml"))
	   ))
  :mode
  (
    ("\\.go\\'" . go-ts-mode)
    ("/go\\.mod\\'" . go-mod-ts-mode)
    ("\\.rs\\'" . rust-ts-mode)
    ("\\.js\\'" . js-ts-mode)
    ("\\.ts\\'" . typescript-ts-mode)
	("\\.json\\'" . json-ts-mode)
	("\\.jsonc\\'" . json-ts-mode)
    ;; ("\\.tsx\\'" . typescript-ts-mode)
	("\\.tsx\\'" . tsx-ts-mode)
    ("\\.y[a]?ml\\'" . yaml-ts-mode)
    ("\\.com\\'" . nginx-mode)
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
  ;; 使用空格代替 Tab
  ;; (setq-default indent-tabs-mode nil)
  ;; 默认缩进
  (setq-default tab-width 4)

  ;; lisp
  (setq lisp-indent-offset 2)
  ;; c
  (setq c-ts-mode-indent-offset 4)
  ;; js ts
  ;; (setq js-ts-mode-indent-offset 2)
  (setq js-indent-level 2)
  (setq tsx-ts-mode-indent-offset 2)
  ;; json
  (setq json-ts-mode-indent-offset 2)
  ;; ts
  (setq typescript-ts-mode-indent-offset 2)
  (setq tsx-ts-mode-indent-offset 2)
  ;; nginx
  (with-eval-after-load 'nginx-mode
	(setq nginx-indent-level 4))
  )


(provide 'init-treesit)

;;; init-treesit.el ends here

