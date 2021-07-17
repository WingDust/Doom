(setq doom-font
      (font-spec :family "Source Code Variable"
                 :size 18
       )
      )

(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

 ;;transparent adjustment
 (set-frame-parameter (selected-frame)'alpha '(90 . 90))
 (add-to-list 'default-frame-alist'(alpha . (90 . 90)))

;;(map! :leader
;;  "0" 'winum-select-window-0-or-10
;;  "1" 'winum-select-window-1
;;  "2" 'winum-select-window-2
;;  "3" 'winum-select-window-3
;;  "4" 'winum-select-window-4
;;  "8" 'split-window-below
;;  "9" 'split-window-right
;;  )

;;(setq delete-by-moving-to-trash t)
