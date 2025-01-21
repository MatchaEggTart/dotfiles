;;; init-system.el --- the configurations for system
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(defconst *is-mac* (eq system-type 'darwin) "判断操作系统是Mac")
(defconst *is-linux* (eq system-type 'gnu/linux) "判断操作系统是Linux")
(defconst *is-windows* (memq system-type '(ms-dos windows-nt cygwin)) "判断操作系统是Windows")

;; 设置垃圾回收阈值，加速启动速度
(setq gc-cons-threshold most-positive-fixnum)

;; 文件即时同步刷新
(global-auto-revert-mode 1) ; 其实默认开启了

;; 避免 Package cl is deprecated
;; (require 'cl-lib)
;; (eval-when-compile (require 'cl-lib))

(provide 'init-system)

;;; init-system.el ends here
