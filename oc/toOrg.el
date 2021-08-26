;;; -*- lexical-binding: t; -*-

(defun doom-ischange ()
  (interactive)
    (let
        (
        (default-directory "e:/spacemacs/emacs26-3/.doom.d/")
        (explicit-shell-file-name "E:/PowerShell/7/pwsh.exe"))
        ;;(message (shell-command-to-string "git status -s"))
        (shell-command-to-string "git status -s")
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
                

(add-hook 'kill-emacs-hook (lambda ()
                            (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/toOrg.org")
                            (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/keybinding.org")
                            (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/OrgConfig.org")
                            (compile-Org-to-elisp "e:/spacemacs/emacs26-3/.doom.d/oc/Mode.org")
                            (byte-recompile-directory "e:/spacemacs/emacs26-3/.doom.d/oc/")
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
