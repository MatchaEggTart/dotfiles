;;; init-elpa.el --- the configurations for install packages
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

;; 配置源
;; (message package-archives)
(use-package package
  :config
  (add-to-list 'package-archives '("melpa"         . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
  (add-to-list 'package-archives '("melpa-stable"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/"))
  (add-to-list 'package-archives '("gnu"           . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
  (add-to-list 'package-archives '("gnu-devel"     . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu-devel/"))
  (add-to-list 'package-archives '("nongnu"        . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/"))
  (add-to-list 'package-archives '("nongnu-devel"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu-devel/"))
  (add-to-list 'package-archives '("org"           . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/"))
  (unless (bound-and-true-p package--initialized)
    (package-initialize))
  (progn
    ;; 不检查签名，国内镜像如果正在同步，会导致安装签名失败
    (setq package-check-signature nil
	  load-prefer-newer t)
    ;; 防止反复调用 package-refresh-contents 会影响加载速度
    (when (not package-archive-contents)
      (package-refresh-contents)))
  )

;; 配置 use-package 默认设置
(require 'use-package-ensure)
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

;; 默认使用 melpa-stable
(setq use-package-always-pin "melpa-stable")

;; 装完插件的重启工具
(use-package restart-emacs)

(provide 'init-elpa)

;;; init-elpa.el ends here
