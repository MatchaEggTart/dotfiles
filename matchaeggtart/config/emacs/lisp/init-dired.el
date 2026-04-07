;; (use-package hydra
;;   :ensure t
;;   :config
;;   ;; 将定义包裹在 config 内部，属于真正的组件化
;;   (defhydra hydra-dired-helper (:color blue :hint nil)
;;     "
;;   Dired 快捷操作:
;;   _m_ 标记      _u_ 取消      _C_ 复制      _R_ 重命名    _D_ 删除
;;   _o_ 别窗打开  _+_ 建目录    _g_ 刷新      _s_ 排序      _q_ 退出
;;   _A_ 正则搜索  _Q_ 正则替换  _w_ 存路径    _!_ 运行命令  _?_ 全部
;;   "
;;     ("m" dired-mark)
;;     ("u" dired-unmark)
;;     ("C" dired-do-copy)
;;     ("R" dired-do-rename)
;;     ("D" dired-do-delete)
;;     ("o" dired-find-file-other-window)
;;     ("+" dired-create-directory)
;;     ("g" revert-buffer)
;;     ("s" dired-sort-toggle-or-edit)
;;     ("w" dired-copy-filename-as-kill)
;;     ("A" dired-do-find-regexp)
;;     ("Q" dired-do-find-regexp-and-replace)
;;     ("!" dired-do-shell-command)
;;     ("q" nil)
;;     ("?" which-key-show-full-keymap)))
;; 
;; (use-package dired
;;   :ensure nil  ; Dired 是内置的
;;   :defer t     ; 只有打开文件夹才加载
;;   :config
;;   ;; 确保 dired-x 加载，因为你需要它的排序和扩展功能
;;   (require 'dired-x)
;;   ;; 在 Dired 的配置区绑定键位
;;   (define-key dired-mode-map (kbd "?") #'hydra-dired-helper/body))

;; (use-package dirvish
;;   :config
;;   (dirvish-override-dired-mode) ; Force the use of dirvish instead of dired
;;   (setq dirvish-attributes
;;     '(vc-state subtree-state all-the-icons file-time file-size))
;;   (setq dired-auto-revert-buffer t)
;;   :bind
;;   (("C-c C-d" . dirvish-side)
;;     :map
;;     dirvish-mode-map
;;     ("a" . dirvish-quick-access)
;;     ("f" . dirvish-file-info-menu)
;;     ("y" . dirvish-yank-menu)
;;     ("N" . dirvish-narrow)
;;     ("^" . dirvish-history-last)
;;     ("h" . dirvish-history-jump) ; remapped `describe-mode'
;;     ;;  ("s" . dirvish-quicksort) ; remapped `dired-sort-toggle-or-edit'
;;     ("v" . dirvish-vc-menu) ; remapped `dired-view-file'
;;     ("TAB" . dirvish-subtree-toggle)
;;     ("C-c p" . dirvish-peek-mode)
;;     ("M-f" . dirvish-history-go-forward)
;;     ("M-b" . dirvish-history-go-backward)
;;     ("M-l" . dirvish-ls-switches-menu)
;;     ("M-m" . dirvish-mark-menu)
;;     ("M-t" . dirvish-layout-toggle)
;;     ("M-s" . dirvish-setup-menu)
;;     ("M-e" . dirvish-emerge-menu)
;;     ("M-j" . dirvish-fd-jump)))


(provide 'init-dired)
