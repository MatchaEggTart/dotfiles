;;; init-env.el --- the configurations for completion
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; 寻找路径的工具
;; Settings for exec-path-from-shell
;; fix the PATH environment variable issue

(defun my-exec-path-from-shell-initialize ()
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package exec-path-from-shell
  :ensure t
  :demand t

  :config
  (setq exec-path-from-shell-warn-duration-millis 2000)
  (add-hook 'after-init-hook 'my-exec-path-from-shell-initialize)
  )

(provide 'init-env)
;;; init-env.el ends here
