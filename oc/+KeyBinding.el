;;; -*- lexical-binding: t; -*-

;;(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
;;(map! :ie "C-h" #'backward-delete-char-untabify)
(map! :ie "C-h" #'backward-delete-char)
(define-key input-decode-map (kbd "C-h") (kbd "DEL"))
(global-set-key (kbd "C-h") 'delete-backward-char)

(map! :n "SPC f j" #'dired-jump)

(global-set-key "\C-s" 'swiper)

(global-set-key (kbd"C-c C-d")
        (lambda () (interactive)
          (setq debug-on-error (if debug-on-error nil t))
          (message (format"debug-on-error : %s" debug-on-error))))

(global-set-key (kbd "C-;") 'comment-line)

(global-evil-matchit-mode 1)
;; 在 org mode 中没用 
(defun +tab-match-head-and-end()
  "gg Tab 首尾切换来做 到行首与到行尾"
  (interactive)
(if (= (point) 1)
        (goto-char (point-max))
        (evil-jump-item)
    )
  )
;;(evil-define-key 'normal 'global (kbd "<tab>")  'evil-jump-item)
(evil-define-key 'normal 'global (kbd "<tab>")  '+tab-match-head-and-end)

(map! :n "SPC o y" #'youdao-dictionary-search-at-point+)

(map! :i "C-p" #'previous-line)

(map! :i "C-n" #'next-line)

(map! :v "v" #'evil-visual-line)
