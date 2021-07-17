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

(setq org-tags-column -77)

(setq org-ellipsis "⤵")

(require 'org-starless)
(add-hook 'org-mode-hook #'org-starless-mode)

(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)
