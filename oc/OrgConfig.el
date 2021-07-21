(setq org-hide-emphasis-markers t)

    (setq org-superstar-leading-bullet "  ")

    (setq org-cycle-separator-lines -1)

;;;'org-babel-execute:python
(setq python-shell-interpreter "e:\\python\\python3.8.1\\python.exe"
        org-babel-python-command "e:\\python\\python3.8.1\\python.exe"
        )

(require 'ob-js)

(with-eval-after-load 'org
    (org-babel-do-load-languages
    'org-babel-load-languages
    '(  (emacs-lisp . t)
        (python . t)
        (js . t)
        (rust . t)
        (deno . t)
        ;;(powershell . t)
    ))
)

 (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(after! org
  (setq org-tags-column -80)
   ;; ... other org configuration here
)
;; SPA-u C-c C-c

(setq org-ellipsis "⤵")

(require 'org-starless)
(add-hook 'org-mode-hook #'org-starless-mode)

(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)

;; (setq org-refile-targets '((nil :maxlevel . 9)
;;                            (org-agenda-files :maxlevel . 3)
;;                            (org-buffer-list :maxlevel . 2)))

(setq
    org-outline-path-complete-in-steps nil
    org-refile-allow-creating-parent-nodes 'confirm
    org-refile-use-outline-path 'file
    org-refile-targets '((nil :maxlevel . 5)
                           (org-agenda-files :maxlevel . 4))
    )
