;;; -*- lexical-binding: t; -*-

(require 'auto-save)
;;(load! auto-save)
(auto-save-enable)

(centered-window-mode t)

(with-current-buffer "*scratch*"
  (lisp-interaction-mode)
    )

;;(package! ws-butler :disable t)

(add-hook 'switch-buffer-functions
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

;; (setq alda-binary-location "E:/alda/alda.exe")

(use-package prescient
  :after counsel
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :after counsel
  :config (ivy-prescient-mode 1)
  )

(use-package ivy-posframe
  :disabled
  :custom
  (ivy-posframe-width      115)
  (ivy-posframe-min-width  115)
  (ivy-posframe-height     10)
  (ivy-posframe-min-height 10)
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((parent-frame . nil)
                                  (left-fringe . 8)
                                  (right-fringe . 8)))
  (ivy-posframe-mode 1))

;;(setq display-line-numbers-type nil)
(remove-hook! '(prog-mode-hook text-mode-hook conf-mode-hook)
              #'display-line-numbers-mode)

;; doom require =pip install pytest nose black=
;; 需要 npm i -g pyright

;; (require 'nox)

;; (setq nox-python-server "pyright")
;; (if (eq system-type 'windows-nt)
;;     (setq nox-python-path "E:/python/python3.8.1/python.exe"))
;; (setq nox-autoshutdown t) ;; kill bufer 时自动关闭nox的服务。
;; (dolist (hook (list
;;                ;;'js-mode-hook
;;                ;;'rust-mode-hook
;;                'python-mode-hook
;;                ;;'ruby-mode-hook
;;                ;;'java-mode-hook
;;                ;;'sh-mode-hook
;;                ;;'php-mode-hook
;;                ;;'c-mode-common-hook
;;                ;;'c-mode-hook
;;                ;;'csharp-mode-hook
;;                ;;'c++-mode-hook
;;                ;;'haskell-mode-hook
;;                ))
;;   (add-hook hook '(lambda () (nox-ensure))))

;; rustup update
;; rustup component add rust-analysis rust-src
;; scoop install rust-analysis 
;; (setq rustic-lsp-server 'rust-analyzer)
;; (remove-hook 'rustic-mode-hook 'flycheck-mode)
;; (after! rustic
;;   (setq rustic-lsp-server 'rust-analyzer ; optional
;;         rustic-lsp-client 'eglot))

;; (require 'zone-matrix)
;;(require 'zone-matrix-settings)
;;(require 'zone-settings)
;; (setq zone-programs [zone-matrix])

;;延时自动
;;(setq zone-timer (run-with-idle-timer 180 t 'zone))

;;任意字符
