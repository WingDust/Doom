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
