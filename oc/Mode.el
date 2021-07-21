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
