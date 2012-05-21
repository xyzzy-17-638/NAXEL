;;; -*- Mode: Lisp; Package: editor -*-
;;;
;;; tdict.l --- �ȈՎ���

;;; author
;;;	YAMAMOTO Taizo

;;; date
;;;	Last updated: "2003-05-03"

;;; description
;;;	���ږ��ƍ��ڐ������^�u�����ŋ�؂����t�@�C���������Ƃ���
;;;	�ȒP�Ȏ����̋@�\��񋟂��܂��B���ڐ������|�b�v�A�b�v�\������܂��B

;;; install
;;;	1.�𓀂��ďo����tdict.l���A$XYZZY/site-lisp/�ɃR�s�[���܂��B
;;;     2.~/.xyzzy��������$XYZZY/site-lisp/siteini.l�ɋL�q��ǉ����܂��B
;;;
;;;		--------------------------------
;;;		(require "tdict")
;;;		--------------------------------
;;;
;;;     3.��L�̐ݒ�𔽉f�����邽�߂ɁAxyzzy���ċN�����܂��B
;;;	  ��siteinit.l�ɋL�q�����ꍇ�ɂ͍ă_���v�����ĉ������B

;;; uninstall
;;;	1.$XYZZY/site-lisp/tdict/���폜���܂��B
;;;	2.~/.xyzzy��������$XYZZY/site-lisp/siteinit.l�̊֘A����ӏ����폜���܂��B
;;;	  ��siteinit.l�ɋL�q���Ă����Ȃ�΍ēx�_���v�������܂��B

;;; usage
;;;	1.�����ɂ������t�@�C����TSV�`����$XYZZY/etc/�Ɋi�[���܂��B
;;;
;;;		--------------------------------
;;;		defun	�֐�
;;;		defvar	�X�y�V�����ϐ�
;;;		--------------------------------
;;;
;;;	2.�K�v�ɉ�����tdict-mode�����s���܂��B
;;;
;;;		--------------------------------
;;;		M-x tdict-mode[RET]
;;;		--------------------------------
;;;
;;;	3.�L�[���[�h�t�@�C����ύX���������tdict-reload�����s���܂��B
;;;
;;;		--------------------------------
;;;		M-x tdict-reload[RET]
;;;		tdict file: C:/applications/xyzzy/site-lisp/tdict/tdict[RET]
;;;		--------------------------------

;;; note
;;;	�E�d���p�ɍ�����̂ő債���@�\�͂���܂���B
;;;	�����ڐ���1000���z�������ȍ\���̂�����Ȃ���΂Ȃ�Ȃ��A
;;;	�@���ڂ�c���ł��Ȃ��Ȃ����̂ō��܂����B
;;;	�E�����l���ĂȂ��̂ŉp�a���T�Ƃ��͂����܂Ȃ��悤�ɁB
;;;	�E�l�I�ȍ�ƂŌ����������悤�ȏꍇ�Ɏg�p���������B

;;; changes
;;;	Sat, 19 May 2012 15:07:54 +0900
;;;		�E�z�z�y�[�W��xyzzy�{�̂̔z�z�ɏ�����A�ƂȂ��Ă���̂�MIT/X�̃��C�Z���X����ǉ��B(mumurik765)
;;;	Sat, 03 May 2003 00:07:55 +0900
;;;		�ENetInstaller�Ή��i�����Y��j
;;;		�E�������̏C���i�����Y��j
;;;		�Etdict-mode��defvar-local�ɕύX
;;;	Sat, 17 Aug 2002 07:15:49 +0900
;;		�Egoal-column�ւ̔z���i���ӁA��v�ۂ���j
;;; 	Tue, 13 Aug 2002 14:30:01 +0900
;;;		�E�T�C�g�ɍڂ���悤�̍ق𐮂���
;;;	Thu, 20 Jun 2002 00:51:44 +0900
;;;		�E����
;;;
;;; License
#|
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
|#


(provide "tdict/tdict")

(in-package "editor")

;;; variable
(export '(tdict-mode tdict-reload))

(defvar-local tdict-mode nil
	      "tdict-mode")
(defvar *tdict-file* (merge-pathnames "tdict" (etc-path))
  "�ȈՎ����t�@�C���i�[�t�@�C����")
(defvar *tdict-attr* '(:underline t :bold t)
  "�ȈՎ��������\������")

; �����p
(defvar *tdict-list* nil
  "�ȈՎ����Ǘ����X�g")
(defvar *tdict-last-range-begin* nil
  "�ȈՎ��������\���J�n�ʒu")
(defvar *tdict-last-range-end* nil
  "�ȈՎ��������\���I���ʒu")
(defvar *tdict-last-buffer* nil
  "�ȈՎ����\���o�b�t�@")

;;; function
(defun tdict-mode (&optional (arg nil sv))
  "�ȈՎ������[�h"
  (interactive "p")
  (toggle-mode 'tdict-mode arg sv)
  (unless *tdict-list*
    (tdict-reload *tdict-file*)))

(defun tdict-reload (filename)
  "�ȈՎ����̍ēǂݍ���"
  (interactive "Ftdict file: " :default0 *tdict-file*)
  (unless (file-exist-p filename)
    (message "tdict: ~A not exits" filename)
    (return-from tdict-reload nil))
  (setq *tdict-file* filename)
  (setq *tdict-list*
	(mapcar #'(lambda (x) (split-string x "\t"))
		(make-list-from-keyword-table
		 (load-keyword-file *tdict-file*)))))

(defun tdict-popup ()
  "�ȈՎ����ɂ��|�b�v�A�b�v�\��"
  (when tdict-mode
    (and (eq *tdict-last-buffer* (selected-buffer))
	 *tdict-last-range-begin*
	 *tdict-last-range-end*
	 (<= *tdict-last-range-begin* (point))
	 (< (point) *tdict-last-range-end*)
	 (continue-popup)
	 (return-from tdict-popup nil))
    (let (beg end itm (goal (goal-column)))
      (when *tdict-last-buffer*
	(save-window-excursion
	  (when (minibuffer-window-p (selected-window))
	    (other-window))
	  (set-buffer *tdict-last-buffer*)
	  (delete-text-attributes 'tdict-attr)))
      (setq *tdict-last-buffer* nil
	    *tdict-last-range-begin* nil
	    *tdict-last-range-end* nil)
      (save-excursion
	(setq beg (progn (skip-syntax-spec-backward "jw_") (point))
	      end (progn (skip-syntax-spec-forward "jw_") (point))))
      (and (/= beg end)
	   (setq itm (assoc (buffer-substring beg end)
			    *tdict-list* :test 'string-equal))
	   (setq *tdict-last-buffer* (selected-buffer)
		 *tdict-last-range-begin* beg
		 *tdict-last-range-end* end)
	   (popup-string (cadr itm) end)
	   (apply 'set-text-attribute beg end 'tdict-attr *tdict-attr*))
      (set-goal-column goal))))

(pushnew '(tdict-mode . "Tdict") *minor-mode-alist* :key #'car)

;;; hook
(add-hook '*post-command-hook* 'tdict-popup)