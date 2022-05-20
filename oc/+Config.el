;;; -*- lexical-binding: t; -*-

(defun doom-ischange ()
  (interactive)
    (let
        (
        ;; (default-directory "e:/spacemacs/emacs26-3/.doom.d/")
        ;; (explicit-shell-file-name "E:/PowerShell/7/pwsh.exe"))
        ;;(message (shell-command-to-string "git status -s"))
        ;; (shell-command-to-string "git status -s")
    )
  )
)

    

(setq start-org-doom-changelog (doom-ischange))

;; git -C e:/spacemacs/emacs26-3/.doom.d/ status -s 非在 git 目录下也可查看状态

(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6
      file-name-handler-alist nil)

;; ... your whole emacs config here ...

;; after startup, it is important you reset this to some reasonable default. A large 
;; gc-cons-threshold will cause freezing and stuttering during long-term 
;; interactive use. I find these are nice defaults:
(add-hook! 'emacs-startup-hook
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1
        file-name-handler-alist last-file-name-handler-alist))

(defun compile-Org-to-elisp (file)
  (let ((tan (concat
             (file-name-sans-extension file) ".el")
            ))
    (org-babel-tangle-file file tan "emacs-lisp\\|elisp")
    (byte-compile-file tan)
    )
)

(defun compile-my-config()
  (interactive)
  
(cl-case system-type
  ('windows-nt
  (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Config.org")
  (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+KeyBinding.org")
  (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Org.org")
  (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Mode.org")
  (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Tweaks.org")
  (byte-recompile-directory "e:/spacemacs/emacs26-3/.doom.d/oc/")
   )
  ('gnu/linux
  (compile-Org-to-elisp "~/.doom.d/oc/+Config.org")
  (compile-Org-to-elisp "~/.doom.d/oc/+KeyBinding.org")
  (compile-Org-to-elisp "~/.doom.d/oc/+Org.org")
  (compile-Org-to-elisp "~/.doom.d/oc/+Mode.org")
  (compile-Org-to-elisp "~/.doom.d/oc/+Tweaks.org")
  (byte-recompile-directory "~/.doom.d/oc/")
   )
  )
)


(add-hook 'kill-emacs-hook (lambda ()
                             (compile-my-config)
                            ;; (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Config.org")
                            ;; (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+KeyBinding.org")
                            ;; (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Org.org")
                            ;; (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Mode.org")
                            ;; (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/+Tweaks.org")
                            ;; (byte-recompile-directory "e:/spacemacs/emacs26-3/.doom.d/oc/")
                             ;; (let ((last-org-doom-changelog (doom-ischange)))
                             ;;     ;;(f-write-text  last-org-doom-changelog 'utf-8
                             ;;     ;;            "E:\\spacemacs\\emacs26-3\\.doom.d\\t.txt")
                             ;;     ;;(f-write-text  start-org-doom-changelog 'utf-8
                             ;;     ;;            "E:\\spacemacs\\emacs26-3\\.doom.d\\s.txt")
                             ;;    (if (not (string= last-org-doom-changelog start-org-doom-changelog))
                             ;;        (progn
                             ;;        (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/toOrg.org")
                             ;;        (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/keybinding.org")
                             ;;        (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/OrgConfig.org")
                             ;;        (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/Mode.org")
                             ;;        (byte-recompile-directory "e:/spacemacs/emacs26-3/.doom.d/oc/")
                             ;;        )
                             ;;     )
                             ;;   )
                             ))

(when (boundp 'read-process-output-max)
  ;; 1MB in bytes, default 4096 bytes
  (setq read-process-output-max 1048576))

(setq doom-font
      ;;(font-spec :family "Source Code Variable"
      ;;(font-spec :family "Sarasa Mono TC Light"
      (font-spec :family "Cascadia Mono"
                 :size 18
       )
      )

(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

 ;;transparent adjustment
 (set-frame-parameter (selected-frame)'alpha '(90 . 90))
 (add-to-list 'default-frame-alist'(alpha . (90 . 90)))

;;(map! :leader
;;  "0" 'winum-select-window-0-or-10
;;  "1" 'winum-select-window-1
;;  "2" 'winum-select-window-2
;;  "3" 'winum-select-window-3
;;  "4" 'winum-select-window-4
;;  "8" 'split-window-below
;;  "9" 'split-window-right
;;  )

;;(setq delete-by-moving-to-trash t)

;;(setq delete-by-moving-to-trash t)

;;(setq fancy-splash-image "~/.doom.d/banner/hack.png")

;; (add-hook 'after-change-major-mode-hook
;; (add-hook 'makrdown-mode-hook
;;           (lambda ()
;;                 (setq line-spacing 0.1)
;;                 ;; (setq header-line-format " ")
;;                 (setq left-margin-width 2)
;;                 (setq right-margin-width 2)
;;             )
;;           )
(setq-default line-spacing 0.2)                ;行间距
(setq-default left-margin-width 1 right-margin-width 1)

(defun my-linespacing ()
  (unless (minibufferp)
    (setq-local line-spacing 0.3)))
(add-hook 'buffer-list-update-hook #'my-linespacing)

(set-window-buffer nil (current-buffer))

;; (set-face-foreground 'vertical-border "#282c34")
(set-face-foreground 'vertical-border "black")

;; 修复从 clipboard 粘贴中文为 \324 
(if (eq system-type 'windows-nt)
    (progn
      (set-clipboard-coding-system 'utf-16-le)
      (set-selection-coding-system 'utf-16-le))
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8-unix)
;;将utf-8放到编码顺序表的最开始，即先从utf-8开始识别编码，此命令可以多次使用，后指定的编码先探测

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))) 

;; (set-buffer-file-coding-system 'utf-8-unix)
;;指定当前buffer的写入编码，只对当前buffer有效，即此命令写在配置文件中无效，只能通过M-x来执行
;; (setq default-buffer-file-coding-system 'utf-8-unix)
;;指定新建buffer的默认编码为utf-8-unix，换行符为unix的方式

(advice-add 'straight-vc-git--encode-url :around #'noalias-set-github-mirror)
(defun noalias-set-github-mirror (oldfunc &rest args)
   (let ((url (apply oldfunc args)))
      (replace-regexp-in-string (rx (group "github.com"))
                                "mirror.ghproxy.com" url nil nil 1)))
