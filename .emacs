(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Theme (Monokai) https://github.com/oneKelvinSmith/monokai-emacs
(load-theme 'monokai t)

;; Font (Liberation Mono Regular)
(set-default-font "Liberation Mono-10")

;; Disable bell
(setq ring-bell-function 'ignore)

;; Show line numbers
(global-linum-mode t)

;; Cursor type
(setq-default cursor-type 'bar)

;; Highlight current line
(global-hl-line-mode t)

;; Cut, copy, paste, undo <normal> shortcuts
(cua-mode t)

;; Auto-insert brackets pairs
(electric-pair-mode t)

;; Don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; Make scroll play nicer
(setq scroll-margin 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)

;; Show whitespace
(require 'whitespace)
(setq whitespace-style '(face trailing tabs spaces lines-fail newline empty indentation::tab indentation::space space-after-tab::tab space-after-tab::space space-after-tab space-before-tab::tab space-before-tab::space space-mark tab-mark))

(autoload 'smart-tabs-mode "smart-tabs-mode")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")
(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python 'ruby 'nxml)

(custom-set-faces
 '(whitespace-empty ((t (:background "gray30" :foreground "nil"))))
 '(whitespace-hspace ((t (:foreground "gray30" :background "nil"))))
 '(whitespace-indentation ((t (:foreground "gray30" :background "nil"))))
 '(whitespace-space ((t (:bold t :foreground "gray30"))))
 '(whitespace-space-after-tab ((t (:foreground "nil" :background "gray30"))))
 '(whitespace-space-before-tab ((t (:foreground "gray30" :background "red"))))
 '(whitespace-tab ((t (:foreground "gray30" :background "nil"))))
 '(whitespace-trailing ((t (:foreground "red" :background "gray30")))))

(global-whitespace-mode t)

;; Hide welcome screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Save/restore opened files and windows size/position
(desktop-save-mode 1)

;; Close the scratch and Messages buffers (useless!)
(setq initial-scratch-message "")
(defun remove-scratch-buffer ()
	(if (get-buffer "*scratch*")
		(kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

(setq-default message-log-max nil)
(kill-buffer "*Messages*")

(add-hook 'minibuffer-exit-hook
	'(lambda ()
		(let ((buffer "*Completions*"))
			(and (get-buffer buffer)
				(kill-buffer buffer)
			)
		)
	)
)

;; Don't show buffer list when opening multiple files at the same time
(setq inhibit-startup-buffer-menu t)

;; mode line
(setq-default mode-line-format
	(list
	
		"["
			'(:eval (propertize
				(format"%s " buffer-file-coding-system)
				'face 'mode-line-default-face
				'help-echo (format"%s" buffer-file-coding-system)))
		"] "
	
		;; the buffer name; the file name as a tool tip
		'(:eval
			(propertize "%b " 'face 'font-lock-keyword-face
				'help-echo (buffer-file-name)
			)
		)

		;; line and column
		"("
			(propertize "%02l" 'face 'font-lock-type-face)
			","
			(propertize "%02c" 'face 'font-lock-type-face)
		") "

		;; relative position, size of file
		"["
		(propertize "%p" 'face 'font-lock-constant-face) ;; % above top
		"/"
		(propertize "%I" 'face 'font-lock-constant-face) ;; size
		"] "

		;; the current major mode for the buffer.
		"["
		'(:eval (propertize "%m" 'face 'font-lock-string-face
			'help-echo buffer-file-coding-system))
		"] "

		;; i don't want to see minor-modes; but if you want, uncomment this:
		;; minor-mode-alist
		
		"% " ;; fill with '-'

		"[" ;; insert vs overwrite mode
			'(:eval (propertize 
				(if overwrite-mode "Overwrite" "Insert")
				'face 'font-lock-preprocessor-face
				'help-echo (concat "Buffer is in "
					(if overwrite-mode "overwrite" "insert") " mode"
				)
			))

			;; was this buffer modified since the last save?
			'(:eval (when (buffer-modified-p)
				(concat ","  (propertize "Modified"
					'face 'font-lock-warning-face
					'help-echo "Buffer has been modified"))
			))

			;; is this buffer read-only?
			'(:eval (when buffer-read-only
				(concat "," (propertize "RO"
					'face 'font-lock-type-face
					'help-echo "Buffer is read-only"))
			))
		"] "
	)
)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(save-place t nil (saveplace)))

