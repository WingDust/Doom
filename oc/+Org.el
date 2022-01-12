;;; -*- lexical-binding: t; -*-

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

(after! org-superstar
    (setq org-superstar-headline-bullets-list '("⬡" "◉" "›" "▷" "○");;◆
        org-superstar-prettify-item-bullets t )
        (setq org-superstar-item-bullet-alist '((?* . ?•)
                                                (?+ . ?•)
                                                (?- . ?•)))
    )

;;(require 'org-starless)
;;(add-hook 'org-mode-hook #'org-starless-mode)

(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)

(add-hook 'org-mode-hook #'org-num-mode)

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

(add-hook 'org-mode-hook 'org-appear-mode)
(setq org-appear-autolinks t)

(defun nm/add-newline-between-headlines ()
  ""
  (when (equal major-mode 'org-mode)
    (unless (org-at-heading-p)
      (org-back-to-heading))
    (nm/org-end-of-headline)
    (if (not (org--line-empty-p 1))
        (newline))))
(defun nm/org-end-of-headline()
  "Move to end of current headline"
  (interactive)
  (outline-next-heading)
  (forward-char -1))
(defun nm/newlines-between-headlines ()
  "Uses the org-map-entries function to scan through a buffer's
   contents and ensure newlines are inserted between headlines"
  (interactive)
  (org-map-entries #'nm/add-newline-between-headlines t 'file))

(defun org-show-current-heading-tidily ()
  (interactive)  ;Inteactive
  "Show next entry, keeping other entries closed."
  (if (save-excursion (end-of-line) (outline-invisible-p))
      ;;(progn (org-show-entry) (show-children))
      (progn (org-show-entry) (outline-show-children))
    (outline-back-to-heading)
    ;;(unless (and (bolp) (org-on-heading-p))
    (unless (and (bolp) (org-at-heading-p))
      (org-up-heading-safe)
      ;;(hide-subtree)
      (outline-hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    ;;(show-children)))
    (outline-show-children)))

;; (add-hook 'org-mode-hook
;;     (setq line-spacing 0.1)
;;     (setq header-line-format " ")
;;     (lambda () (progn
;;         (setq left-margin-width 2)
;;         (setq right-margin-width 2)
;;         (set-window-buffer nil (current-buffer))))
;;           )

;; (setq header-line-format " ")

;; (lambda () (progn
;;   (setq left-margin-width 2)
;;   (setq right-margin-width 2)
;;   (set-window-buffer nil (current-buffer))))

(setq x-underline-at-descent-line t)

(setq org-agenda-files (list
                        ;;"H:/Work/framework/Site/org/Trivia.org"
                        "H:/Work/framework/Site/org/Daily.org"
                        ))
(after! org
        ;; 设置状态序列
        (setq org-todo-keywords
        '((sequence
                "TODO(t)"
                "IDEA"
                "Destory"
                "INBOX(i)"
                "NEXT(n)"
                "LATER(l)"
                "WAIT/FORWARD(w)"
                "MAYBE/FUTURE(m)"
                "|"
                "CANCEL(c)"
                "DONE(d)" )))

        ;; set color for keywords
        (setq org-todo-keyword-faces
        '(
                ("IDEA" . (:foreground "azure" :weight bold))
                ("Destory" . (:foreground "LightPink"))
                ("INBOX" . (:foreground "blue" :weight bold))
                ("NEXT"  .  org-warning)
                ("LATER" . "yellow")
                ("WAIT/FORWARD" . "blue")
                ("MAYBE/FUTURE" . "purple")
                ("DONE" . "green")
                ("CANCEL" ."grey")
                )
        )
                )
