;;; -*- lexical-binding: t; -*-

;;;###autoload
(defun hyphen-to-underline()
        "将当前行下的 - 转成 _"
        (interactive)
        
        (let ((pos (line-beginning-position)))
                (end-of-line)
                (set-mark pos))

        (let (
                (p1 (region-beginning))
                (p2 (region-end)))
        (save-restriction
          (narrow-to-region p1 p2)
          (goto-char (point-min))
          (while (search-forward "-" nil t)
            (replace-match "_" nil t)
            )
          )
        )
        )

(defun backslash-to-slash()
        "将当前行下的 \ 转成 /"
        (interactive)
        
        (let ((pos (line-beginning-position)))
                (end-of-line)
                (set-mark pos))

        (let (
                (p1 (region-beginning))
                (p2 (region-end)))
        (save-restriction
          (narrow-to-region p1 p2)
          (goto-char (point-min))
          (while (search-forward "\\" nil t)
            (replace-match "/" nil t)
            )
          )
        )
        )

(defun insert-singlearrow ()
  "在当前光标后面输入 ->"
  (interactive)
  (evil-append 0)
  (insert "->")
  )

(defun insert-ampersand ()
  "在当前光标下输入 &"
  (interactive)
  (insert "&")
  )

(defun insert-asterisk()
  "在当前光标下输入 *"
  (interactive)
  (insert "*")
  )

(defun insert-doublecolon()
  "在当前光标后面输入  ::"
  (interactive)
 (evil-append 0)
  (insert "::")
  )

(defun insert-String()
  "在当前光标后面输入  String"
  (interactive)
 (evil-append 0)
  (insert "String")
  )

;; (defvar iskeyword 2 "to make iskeyword")
(setq iskeyword 2)
(defun toggle-iskeyword ()
  (interactive)
  (cond
   (
    (= iskeyword  1)
        (modify-syntax-entry ?_ "_")
        (setq iskeyword 2)
    )
   (
    (= iskeyword  2)
        (modify-syntax-entry ?_ "w")
        (setq iskeyword 1)
    )
   )
  )

(defun create-scratch-buffer nil
   "create a scratch buffer"
   (interactive)
   (switch-to-buffer (get-buffer-create "*scratch*"))
   (lisp-interaction-mode))
