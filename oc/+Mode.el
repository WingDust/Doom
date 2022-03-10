;;; -*- lexical-binding: t; -*-

(require 'auto-save)
(setq
 auto-save-idle 3
 )
(auto-save-enable)

(centered-window-mode t)
;; 增加centered-window-mode 最大宽度，以减少换行
(setq cwm-centered-window-width 120)

(with-current-buffer "*scratch*"
  (lisp-interaction-mode)
    )

;;(package! ws-butler :disable t)

;;(add-hook 'switch-buffer-functions
(add-hook 'windows-buffer-change-functions
          ;;(lambda (prev curr)
          (lambda (curr)
            (cl-assert (eq curr (current-buffer)))  ;; Always t
            (delete-trailing-whitespace)))
;; (save-excursion
;;   (save-restriction
;;     (narrow-to-region 1 (buffer-size switch-buffer-functions--last-buffer))
;;   )
;; )

;;(require 'netease-cloud-music)

(setq elfeed-feeds
      '(("https://mangatalk.net/feed" mangatalk)
        ))

(setq alda-binary-location "E:/alda/alda.exe")

;;(use-package prescient
;;  :after counsel
;;  :config
;;  (prescient-persist-mode 1))
;;
;;(use-package ivy-prescient
;;  :after counsel
;;  :config (ivy-prescient-mode 1)
;;  )

;;(use-package ivy-posframe
;;  :disabled
;;  :custom
;;  (ivy-posframe-width      115)
;;  (ivy-posframe-min-width  115)
;;  (ivy-posframe-height     10)
;;  (ivy-posframe-min-height 10)
;;  :config
;;  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;;  (setq ivy-posframe-parameters '((parent-frame . nil)
;;                                  (left-fringe . 8)
;;                                  (right-fringe . 8)))
;;  (ivy-posframe-mode 1))

;; (setq counsel--fzf-dir "C:/Users/Administrator/scoop/shims/")

;;(setq display-line-numbers-type nil)
(remove-hook! '(prog-mode-hook text-mode-hook conf-mode-hook)
              #'display-line-numbers-mode)

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(add-hook 'python-mode-hook (lambda ()
                                (require 'sphinx-doc)
                                (sphinx-doc-mode t)))

;; doom require =pip install pytest nose black=
;; 需要 npm i -g pyright


;; (require 'nox)

;; (setq nox-python-server "pyright")
;; (if (eq system-type 'windows-nt)
    ;; (setq nox-python-path "E:/python/python3.8.1/python.exe"))
;; (setq nox-autoshutdown t) ;; kill bufer 时自动关闭nox的服务。
;; (dolist (hook (list
               ;;'js-mode-hook
               ;;'rust-mode-hook
               ;; 'python-mode-hook
               ;;'ruby-mode-hook
               ;;'java-mode-hook
               ;;'sh-mode-hook
               ;;'php-mode-hook
               ;;'c-mode-common-hook
               ;;'c-mode-hook
               ;;'csharp-mode-hook
               ;;'c++-mode-hook
               ;;'haskell-mode-hook
               ;; ))
  ;; (add-hook hook '(lambda () (nox-ensure))))

;; rustup update
;; rustup component add rust-analysis rust-src
;; scoop install rust-analysis 
;; (setq rustic-lsp-server 'rust-analyzer)
(remove-hook 'rustic-mode-hook 'flycheck-mode)

(use-package! rustic
  :defer t
  :init
  (setq!
        lsp-rust-server 'rust-analyzer
        rustic-lsp-server 'rust-analyzer
        ;; rustic-lsp-client 'eglot
        lsp-rust-clippy-preference "on"
        
        )
  
  (remove-hook 'rustic-mode-hook 'flycheck-mode)
  )
(use-package! lsp-rust
  :config
  (setq!
         lsp-rust-analyzer-cargo-watch-enable t
         lsp-rust-analyzer-cargo-watch-command "clippy"
         lsp-rust-analyzer-proc-macro-enable t
         lsp-rust-analyzer-cargo-load-out-dirs-from-check t
         lsp-rust-analyzer-inlay-hints-mode t
         lsp-rust-analyzer-display-chaining-hints t
         lsp-rust-analyzer-display-parameter-hints t
         lsp-rust-analyzer-server-display-inlay-hints t
         )
  )

(after! rustic
  
      (map! :map rustic-mode-map
;;         "M-j" #'lsp-ui-imenu
        "<f12>" #'lsp-find-definition
        "M-<f12>" #'lsp-find-references
;;         "C-c C-c C-c" #'rustic-compile
;;         "C-c C-c l" #'flycheck-list-errors
;;         "C-c C-c a" #'lsp-execute-code-action
;;         "C-c C-c r" #'lsp-rename
;;         "C-c C-c q" #'lsp-workspace-restart
;;         "C-c C-c Q" #'lsp-workspace-shutdown
        "C-c C-c s" #'lsp-rust-analyzer-status
      )
  )

(after! lsp-ui
    (setq
     lsp-ui-doc-enable nil
     lsp-ui-doc-show-with-cursor nil
     lsp-ui-doc-show-with-mouse nil
     lsp-modeline-code-actions-enable nil
     lsp-modeline-diagnostics-enable nil
     )
                        )
(after! lsp-mode
  (setq
    lsp-headerline-breadcrumb-enable nil
    lsp-eldoc-enable-hover nil
     )
  )
;; (after! rustic
;;   ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;     (setq
;;         rustic-lsp-server 'rust-analyzer ; optional
;;             ;; rustic-lsp-client 'eglot
;;         rustic-format-on-save nil
;;         rustic-lsp-client 'lsp-mode
;;             )
;;   )
;; (after! lsp-mode
;;   ;; what to use when checking on-save. "check" is default, I prefer clippy
;;   ;; (lsp-rust-analyzer-cargo-watch-command "clippy")
;;   (set-popup-rule! "^\\*lsp-help*" :ignore nil :actions: nil :side 'bottom :width 0.5 :quit 'current :select t :vslot 2 :slot 0)
;;   (setq
   
;;       lsp-eldoc-render-all t
;;       lsp-rust-server 'rust-analyzer
;;       lsp-enable-file-watchers nil
;;       lsp-completion-enable t
;;       lsp-enable-imenu t
;;       lsp-rust-analyzer-cargo-watch-enable nil
;;       lsp-log-io t
;;       lsp-ui-doc-delay 0.7
;;       lsp-ui-doc-enable nil
;;       lsp-ui-sideline-code-actions-prefix " "
;;       lsp-ui-sideline-show-hover nil
;;       lsp-rust-analyzer-server-display-inlay-hints t
;;       lsp-headerline-breadcrumb-enable t
;;       lsp-ui-peek-fontify 'always)
;; )
;; (after! (lsp-ui)
;;   (setq lsp-eldoc-enable-hover t
;;         lsp-enable-symbol-highlighting t
;;         lsp-ui-peek-always-show t
;;         lsp-ui-sideline-show-hover t
;;         )
;;   ;; (lsp-ui-doc-enable nil)
;;   )
;; (after! rustic-flycheck
;;   (setq rustic-flycheck-clippy-params (concat rustic-flycheck-clippy-params " --target x86_64-pc-windows-gnu"))
;;   (add-to-list 'flycheck-checkers 'rustic-clippy)
;;   (delete 'rust-clippy flycheck-checkers)
;;   (delete 'rust-cargo flycheck-checkers)
;;   (delete 'rust flycheck-checkers))

;; Enabling only some features
;; (setq dap-auto-configure-features '(sessions locals controls tooltip))

(require 'zone-matrix)
;;(require 'zone-matrix-settings)
;;(require 'zone-settings)
(setq zone-programs [zone-matrix])

;;延时自动
;;(setq zone-timer (run-with-idle-timer 180 t 'zone))

;;任意字符

(map!
(:after kana :map kana-mode-map
  :nm "v" #'kana-validate
  :nm "s" #'kana-say-question
  :nm "p" #'kana-previous
  :nm "n" #'kana-next
  :nm "t" #'kana-toggle-kana
  :nm "r" #'kana-toggle-random
  :nm "l" #'kana-loop-toggle
  :nm "]" #'kana-loop-inc
  :nm "[" #'kana-loop-dec
  :nm "a" #'kana-first
  :nm "j" #'kana-jump
  :nm "q" #'kana-quit
  :nm "d" #'kana-details)
                )

(good-scroll-mode 1)

(require  'vlf-setup)
(custom-set-variables
 '(vlf-application 'dont-ask)
 )

(global-hide-mode-line-mode 1)
(require 'awesome-tray)
(awesome-tray-mode 1)
(setq
 awesome-tray-active-modules '("mode-name" "location" "buffer-name")
 awesome-tray-mode-line-active-color "White"
 )

(global-visual-line-mode t)

(require 'insert-translated-name)
(setq insert-translated-name-translate-engine "youdao")

(require 'company-english-helper)

;; 让 company 补全 yasnippet
(push 'company-yasnippet company-backends)

;; (dolist (relativenumber (list
;;                ;;'js-mode-hook
;;                ;;'rust-mode-hook
;;                ;;'python-mode-hook
;;                'rustic-mode-hook
;;                'org-mode-hook
;;                'emacs-lisp-mode-hook
;;                ;;'sh-mode-hook
;;                ;;'c-mode-common-hook
;;                ;;'c-mode-hook
;;                ;;'haskell-mode-hook
;;                ))
;;   (add-hook relativenumber  '(lambda ()
;;                                (menu-bar--display-line-numbers-mode-relative)
;;                                )))

(require 'eye-care)

(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

(require 'atomic-chrome)

;; (window-numbering-mode 1)

(midnight-delay-set 'midnight-delay "21:00pm")
(add-hook 'midnight-hook (lambda ()
                           (message "是时候休整清理一天中最后任务了")
                           ))

(require 'indium)

(setq-default gac-automatically-push-p 1)

;; (git-auto-commit-mode 1)
   (defun turn-on-auto-commit-push()
     (if
        (equal "true" (string-trim (shell-command-to-string "git rev-parse --is-inside-work-tree")))
         (git-auto-commit-mode 1)
         )
     ;; (let ((proc (start-process "git" "*is-git*" "git" "rev-parse" "--is-inside-work-tree")))
      ;; (set-process-sentinel proc 'gac-process-sentinel)
      ;; (set-process-filter proc 'gac-process-filter))
     )
   (add-hook 'find-file-hook 'turn-on-auto-commit-push)
