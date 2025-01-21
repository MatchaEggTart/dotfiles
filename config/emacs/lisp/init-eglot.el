;;; init-eglot.el --- the configurations for completion
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; need eglot-update
(use-package eglot
  ;; :hook (prog-mode . eglot-ensure)
  :hook ((
          elisp-mode
          c-mode
	  c-ts-mode
          c++-mode
	  c++-ts-mode
	  ;; bash-ts-mode
          ;; js-mode
	  js-ts-mode
          typescript-ts-mode
	  yaml-ts-mode
	  web-mode
          ) . eglot-ensure)
  :bind ("C-c e f" . eglot-format)
  :config
  (progn
    ;; (advice-add 'eglot-code-action-organize-imports :before #'eglot-format)
    ;; https://wiki.archlinux.org/title/Language_Server_Protocol

    ;; C
    ;; sudo pacman -S clang
    (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

    ;; JS
    ;; sudo npm install -g typescrip typescript-language-server
    ;; 别装最新版的 typescript-language-server
    ;; sudo npm install -D -g typescript typescript-language-server@4.0.0
    (add-to-list 'eglot-server-programs '(js-mode js-ts-mode typescript-ts-mode "typescript-language-server" "--stdio"))

    ;; HTML
    ;; npm i -g vscode-langservers-extracted
    (add-to-list 'eglot-server-programs '((html-mode web-mode) "vscode-html-language-server" "--stdio"))
    ;; Bash
    ;; sudo npm i -g bash-language-server
    ;; (add-to-list 'eglot-server-programs '(bash-ts-mode "bash-language-server" "start"))

    ;; YAML
    (add-to-list 'eglot-server-programs '((yaml-mode yaml-ts-mode) "yaml-language-server" "--stdio"))

    ;; json
    (add-to-list 'eglot-server-programs '((json-mode jsonc-mode) "vscode-json-language-server" "--stdio"))

    ;; html
    (add-to-list 'eglot-server-programs '((html-mode web-mode) "vscode-html-language-server" "--stdio"))

    ;; css
    (add-to-list 'eglot-server-programs '((css-mode) "vscode-css-language-server" "--stdio"))
    ;; 关闭 flymake
    ;; (setq eglot-stay-out-of '(flymake))
    )
  )

(provide 'init-eglot)
;;; init-eglot.el ends here
