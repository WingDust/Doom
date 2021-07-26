(require 'auto-save)
(auto-save-enable)

(centered-window-mode t)

(with-current-buffer "*scratch*"
  (lisp-interaction-mode)
    )

;;(package! ws-butler :disable t)

(add-hook 'switch-buffer-functions
          (lambda (prev curr)
            (cl-assert (eq curr (current-buffer)))  ;; Always t
            (delete-trailing-whitespace)))
;; (save-excursion
;;   (save-restriction
;;     (narrow-to-region 1 (buffer-size switch-buffer-functions--last-buffer))
;;   )
;; )

(require 'netease-cloud-music)

(setq elfeed-feeds
      '(("https://mangatalk.net/feed" mangatalk)
        ))

(setq alda-binary-location "E:/alda/alda.exe")

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
