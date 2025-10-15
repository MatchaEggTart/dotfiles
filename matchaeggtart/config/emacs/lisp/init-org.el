;;; init-org.el --- the configurations for org
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-

(with-eval-after-load 'org
  )

;; Org Mode
(use-package org
  :init
  (add-hook 'org-mode-hook
            (defun init-org-mode ()
	      ;; 禁用左尖括号补全，org 模式必须
	      (setq-local electric-pair-inhibit-predicate
                          `(lambda (c) (if (char-equal c ?<) t
					 (,electric-pair-inhibit-predicate c))))
	      )
	    )

  ;; 这特么要自己建个 org-bars.el 然后把代码复制上去才有效果
  
  
  ;; (add-hook 'org-mode-hook #'org-bars-mode)
  :hook (org-mode . org-bars-mode)

  :config
  (require 'org-bars)
  
  ;; 快捷键 <s TAB 创建代码块
  (require 'org-tempo) ; 开启 easy template

  (setq org-hide-leading-stars t
  	org-hide-emphasis-markers t
	;; 隐藏标题栏里的一堆星号
  	org-startup-indented t
	)

  ;; TODO
  ;; 按 C-c C-t 可以直接选 TODO 状态
  (setq org-todo-keywords
	(quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
		(sequence "WAITING(w@/!)" "SOMEDAY(S)" "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

  ;; 先使用 * 创建标题，后面接上 [%] =>
  ;; * 项目名 [%]
  ;; M-x org-set-property 添加一个 RESET_CHECK_BOXES，选 t
  ;; 例子 
  ;; * 项目名 [50%]
  ;; :PROPERTIES:
  ;; :RESET_CHECK_BOXES: T
  ;; :END:
  ;; - [ ] a1
  ;;   - [ ] b1
  ;; - [X] a2
  ;;   - [X] b2

  ;; RESET_CHECK_BOXES 值设为 t
  (require 'org-checklist)
  ;; need repeat task and properties
  (setq org-log-done t)
  (setq org-log-into-drawer t)

  ;; org 日历
  ;; C-c C-s schedule
  ;; C-c C-d deadline
  ;; C-c a 查看日历需要完成的事务
  (global-set-key (kbd "C-c a") 'org-agenda)
  ;; touch ~/Workspace/gtd.org
  ;; 需要在 ~/Workspace/gtd.org 里面写计划
  (setq org-agenda-files '("~/Workspace/GTD/gtd.org"))
  ;; 在 agenda 按 w 变成一周 按 d 变成 day
  (setq org-agenda-span 'day)
  
  ;; (require 'org-bullets)
  ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; (setq org-bullets-bullet-list '(" " " " " " " ")) ;;将 Headlines 的符号变成其它符号
  ;; (setq org-hide-emphasis-markers t) ;;直接显示语法样式
  
  
  )

;; 非官方工具，引入 checklist
(use-package org-contrib
  :pin nongnu
  :after org
  )


;; 截图神器
(use-package org-download
  :after org
  :bind
  ("C-S-y" . org-download-screenshot)
  :config
  (add-hook 'dired-mode-hook 'org-download-enable)
  
  ;; windows 专用
  ;; (setq org-download-screenshot-method "powershell -c Add-Type -AssemblyName System.Windows.Forms;$image = [Windows.Forms.Clipboard]::GetImage();$image.Save('%s', [System.Drawing.Imaging.ImageFormat]::Png)")
  
  ;; archlinux kde use wl-clipboard
  ;; install command: sudo pacman -S wl-clipboard
  (setq org-download-screenshot-method "wl-paste -t image/png > '%s'")
  ;; 关闭默认图片尺寸
  (setq org-image-actual-width nil)
  
  (defun org-download-annotate-default (link)
    "Annotate LINK with the time of download."
    (make-string 0 ?\s))

  (setq-default
   org-download-heading-lvl nil
   org-download-image-dir "./img"
   ;; org-download-screenshot-method "screencapture -i %s"
   org-download-screenshot-file (expand-file-name "screenshot.jpg" temporary-file-directory)
   )
  )


;; (use-package org-modern
;;   :after org
;;   :config
;;   (add-hook 'org-mode-hook #'org-modern-mode)
;;   )

;; (use-package org-roam
;;  :custom
;;  (org-roam-directory (file-truename "~/Workspace/org-files/"))
;;  :bind (("C-c n l" . org-roam-buffer-toggle)
;;	   ("C-c n f" . org-roam-node-find)
;;	   ("C-c n g" . org-roam-graph)
;;	   ("C-c n i" . org-roam-node-insert)
;;	   ("C-c n c" . org-roam-capture)
;;	   ;; Dailies
;;	   ("C-c n j" . org-roam-dailies-capture-today))
;;  :config
;;  ;; If you're using a vertical completion framework, you might want a more informative completion interface
;;  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;  (org-roam-db-autosync-mode)
;;  ;; If using org-roam-protocol
;;  (require 'org-roam-protocol))


(provide 'init-org)
;;; init-org.el ends here
