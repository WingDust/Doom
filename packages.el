;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

;;; Code:
(package! vi-tilde-fringe :disable t)
(package! ws-butler :disable t)

(package! ob-deno)
(package! ob-rust)
(package! ox-hugo)
(package! evil-matchit)
(package! youdao-dictionary)
(package! valign)
(package! centered-window-mode)
(package! switch-buffer-functions)
(package! elfeed)
;;(package! nswbuff)
(package! alda-mode)
(package! ivy-posframe)
(package! mini-modeline)
(package! prescient)
(package! ivy-prescient)
(package! typescript-mode)
(package! org-kanban)
(package! kana)

;; (package! centaur-tabs)


(package! org-appear :recipe (:host github :repo "awth13/org-appear"))
;;(package! org-starless :recipe (:host github :repo "TonCherAmi/org-starless"))

(package! auto-save :recipe (:host github :repo "manateelazycat/auto-save"))
(package! nox :recipe (:host github :repo "manateelazycat/nox"))

;; rust development config
;; (package! rustic :recipe (:host github :repo "brotzeit/rustic"))
(package! eglot :recipe (:host github :repo "joaotavora/eglot"))

(package! request)
(package! netease-cloud-music :recipe (:host github :repo "SpringHan/netease-cloud-music.el"))

(package! zone-matrix :recipe (:host github :repo "ober/zone-matrix"))


;;(package! ob-powershell :recipe (:local-repo "~/.doom.d/local/ob-powershell.el"))
;;(add-load-path! "~/.doom.d/local/ob-powershell.el")
;;;

;;(provide 'packages)
;;; packages.el ends here
