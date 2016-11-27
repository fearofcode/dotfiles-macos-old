(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; taken from http://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(ensure-package-installed 'evil
			  'projectile
			  'magit
			  'relative-line-numbers
			  'solarized-theme)
(package-initialize)

;; https://github.com/Fanael/relative-line-numbers
(global-relative-line-numbers-mode)

;; turn off tool bar and scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; vi key bindings
(require 'evil)
(evil-mode t)

(load-theme 'solarized-dark)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (solarized-theme evil-visual-mark-mode)))
 '(tool-bar-mode nil))

;; set default font to Menlo on OS X
(when (eq system-type 'darwin)
      ;; default Latin font (e.g. Menlo)
      (set-face-attribute 'default nil :family "Menlo")
      ;; default font size (point * 10)
      ;;
      ;; WARNING!  Depending on the default font,
      ;; if the size is not supported very well, the frame will be clipped
      ;; so that the beginning of the buffer may not be visible correctly. 
      (set-face-attribute 'default nil :height 140)

      ;; use specific font for Korean charset.
      ;; if you want to use different font size for specific charset,
      ;; add :size POINT-SIZE in the font-spec.
      (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

      ;; you may want to add different for other charset in this way.
      )
