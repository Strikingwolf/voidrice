;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Faye Jackson"
      user-mail-address "justalittleepsilon@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;;
(setq
 projectile-project-search-path '("~/Documents/Homework" "~/Documents/Repos" "~/.dotfiles"))

(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;;(after! org-agenda
  ;; (add-to-list org-agenda-files "~/Documents/org/todo.org"))

(use-package! org
  :config
  (setq org-startup-with-latex-preview t
        org-old-format-latex-header org-format-latex-header
        org-format-latex-header (concat org-old-format-latex-header "\n\\input{$TEX_INPUT/includes.tex\n\\input{$TEX_INPUT/basicmath.tex}")))

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due Today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due Soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                   :tag "bo")))
  :config
  (org-super-agenda-mode))

(use-package! geiser
  :after scheme-mode)

(defun geiser-eval-region-paste (start end)
  (interactive "rP")
  (geiser-load-file (buffer-file-name (window-buffer (minibuffer-selected-window))))
  (insert (concat " ==> " (car (cdr (car (geiser-eval-region start end)))))))

(use-package! evil-snipe
  :after evil-mode
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due Today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due Soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                   :tag "bo")))
  :config
  (do
   (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
   (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S))
   (evil-snipe-override-mode 1))

(after! (magit evil-snipe)
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode))


;; Password Config

;;(require 'auth-source)
;;(customize-variable 'auth-sources)
;;(setq auth-sources '((:source "~/.config/gpg-pass/email/authinfo.gpg")))

;; MU4E configuration

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it)

(setq
  starttls-use-gnutls t
  smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
  smtpmail-default-smtp-server "smtp.gmail.com"
  smtpmail-smtp-server "smtp.gmail.com"
  smtpmail-smtp-service 587
  smtpmail-stream-type 'starttls
  smtpmail-debug-info t)

(defvar my-mu4e-account-alist
  '(("UMich"
    (mu4e-sent-folder "/UMich/[Gmail].Sent Mail")
    (mu4e-drafts-folder "/UMich/[Gmail].Drafts")
    (user-mail-address "alephnil@umich.edu")
    (smtpmail-smtp-user "alephnil@umich.edu"))
    ("Epsilon"
    (mu4e-sent-folder "/Epsilon/[Gmail].Sent Mail")
    (mu4e-drafts-folder "/Epsilon/[Gmail].Drafts")
    (user-mail-address "justalittleepsilon@gmail.com")
    (smtpmail-smtp-user "justalittleepsilon@gmail.com")
    )))

(defun my-mu4e-set-account ()
 "Set the account for composing a message."
 (let* ((account
         (if mu4e-compose-parent-message
             (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
               (string-match "/\\(.*?\\)/" maildir)
               (match-string 1 maildir))
           (completing-read (format "Compose with account: (%s) "
                                   (mapconcat #'(lambda (var) (car var))
                                               my-mu4e-account-alist "/"))
                           (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                           nil t nil nil (caar my-mu4e-account-alist))))
       (account-vars (cdr (assoc account my-mu4e-account-alist))))
   (if account-vars
       (mapc #'(lambda (var)
                 (set (car var) (cadr var)))
             account-vars)
     (error "No email account found"))))

(after! mu4e
  (setq mu4e-maildir (expand-file-name "~/Maildir"))

  (setq mu4e-drafts-folder "/UMich/[Gmail].Drafts")
  (setq mu4e-sent-folder   "/UMich/[Gmail].Sent Mail")
  (setq mu4e-trash-folder  "/UMich/[Gmail].Trash")

  ;; don't save message to Sent Messages, GMail/IMAP will take care of this
  (setq mu4e-sent-messages-behavior 'delete)

  ;; setup some handy shortcuts
  (setq mu4e-maildir-shortcuts
        '(("/UMich/INBOX"             . ?i)
          ("/UMich/[Gmail].Sent Mail" . ?s)
          ("/UMich/[Gmail].Trash"     . ?t)))

  ;; allow for updating mail using 'U' in the main view:
  (setq mu4e-get-mail-command "offlineimap")

  ;; something about ourselves
  ;; I don't use a signature...
  (setq
  user-mail-address "alephnil@umich.edu"
  user-full-name  "Faye Jackson"
  message-signature "")

  (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
  (add-hook 'mu4e-compose-mode-hook #'(lambda () (auto-save-mode -1)))
  (setq mu4e-sent-messages-behavior 'delete)
  (defun draft-auto-save-buffer-name-handler (operation &rest args)
    "for `make-auto-save-file-name' set '.' in front of the file name; do nothing for other operations"
    (if
        (and buffer-file-name (eq operation 'make-auto-save-file-name))
        (concat (file-name-directory buffer-file-name)
                "."
                (file-name-nondirectory buffer-file-name))
      (let ((inhibit-file-name-handlers
             (cons 'draft-auto-save-buffer-name-handler
                   (and (eq inhibit-file-name-operation operation)
                        inhibit-file-name-handlers)))
            (inhibit-file-name-operation operation))
        (apply operation args))))
  (add-to-list 'file-name-handler-alist '("/Epsilon/[Gmail].Drafts/cur/" . draft-auto-save-buffer-name-handler))
  (add-to-list 'file-name-handler-alist '("/UMich/[Gmail].Drafts/cur/" . draft-auto-save-buffer-name-handler)))

(add-hook 'mu4e-view-mode-hook
  (lambda()
    ;; try to emulate some of the eww key-bindings
    (local-set-key (kbd "<RET>") 'mu4e~view-browse-url-from-binding)
    (local-set-key (kbd "<tab>") 'shr-next-link)
    (local-set-key (kbd "<backtab>") 'shr-previous-link)))

;; Org Mode Configuration

(setq org-export-in-background t)

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  (setq org-todo-keywords  '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#7c7c75" :weight normal :underline t)
          ("WAITING" :foreground "#9f7efe" :weight normal :underline t)
          ("INPROGRESS" :foreground "#0098dd" :weight normal :underline t)
          ("DONE" :foreground "#50a14f" :weight normal :underline t)
          ("CANCELLED" :foreground "#ff6480" :weight normal :underline t))
        org-agenda-files (list "~/Documents/org/journal.org" "~/Documents/org/todo.org")
        )
   (add-hook 'org-mode-hook
             (lambda ()
               (add-hook 'after-save-hook (lambda () (org-latex-export-to-pdf t)) nil 'make-it-local))) ;
  )

(add-hook 'pdf-view-mode-hook 'auto-revert-mode)

;; Haskell Config

(add-hook 'dante-mode-hook
   '(lambda () (flycheck-add-next-checker 'haskell-dante
                                     '(warning . haskell-hlint))))

(map! :leader :desc "Org Brain" "v" #'org-brain-visualize)

;; Org-Brain

(after! org-brain
  :init
  ;; For Evil users
  (with-eval-after-load 'evil (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
  :config
  (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
  (setq org-id-track-globally t)
  ;; (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
  ;; (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12)
  (setq org-brain-include-file-entries nil
        org-brain-file-entries-use-title nil
        org-brain-headline-entry-name-format-string "%2$s"))

(require 'gdscript-mode)
