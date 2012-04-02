;;; -*- Lisp; syntax: Common-Lisp -*-
;;; Yet Another tex-mode for xyzzy - //�Ԓ�//
;;; katex.l, v 1.67.1.7
;;; fixed by Maeda Manabu
;;; Last fixed  "Mon Aug 18 2003 20:37:22 +0900"

; toolbar���g�p����ꍇ�́A~/.xyzzy��������sitinit.l�Ɉ�
; ����ǉ����Ă��������B
;    (setq *KaTeX-use-toolbar* t)
;
; toolbar�̊G��ύX����ꍇ�́A~/.xyzzy��������sitinit.l�Ɉ�
; ����ǉ����Ă��������B
;    (setq *KaTeX-toolbar-bitmap* [filename])
; [filename] �́A�G�������Ă���t�@�C���̃t�@�C����
; position 0 ��typeset�̊G�ɁA
; position 1 ��preview�̊G�ɂȂ�悤�ɂ��Ă��������B

(in-package "elisp")

(defvar *KaTeX-use-toolbar* nil)
(defvar *KaTeX-toolbar-bitmap* (merge-pathnames "site-lisp/katex/KaTeX-toolbar.bmp" (si:system-root)))

(defun KaTeX-check-KaTeX-mode-p ()
  (eq buffer-mode 'katex-mode))

(defun KaTeX-typeset-menu-after-mode-check (arg &optional char)
  (when (KaTeX-check-KaTeX-mode-p)
    (KaTeX-typeset-menu arg char)))

(defun KaTeX-tool-bar ()
  (create-tool-bar
   'KaTeX-tool-bar
   *KaTeX-toolbar-bitmap*
   '(("LaTeX" 0 (lambda () (interactive) (KaTeX-typeset-menu-after-mode-check nil #\j)))
     ("Preview" 1 (lambda () (interactive) (KaTeX-typeset-menu-after-mode-check nil #\p)))
    )))

(defun KaTeX-delete-tool-bar ()
  (interactive)
  (when (find-command-bar 'elisp::KaTeX-tool-bar)
    (delete-command-bar 'elisp::KaTeX-tool-bar)))

(unless (find-command-bar 'elisp::KaTeX-tool-bar)
  (if *KaTeX-use-toolbar*
      (define-command-bar 'elisp::KaTeX-tool-bar "���Ă�(&K)")))