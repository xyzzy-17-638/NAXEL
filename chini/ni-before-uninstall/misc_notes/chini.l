;;; -*- Mode: Lisp; Package: user -*-
;;; chini.l --- chini.l �� uninstall �p���W���[��

;; Copyright (C) 2001-2005 OHKUBO Hiroshi <ohkubo@s53.xrea.com>

;; Author: OHKUBO Hiroshi <ohkubo@s53.xrea.com>
;; Time-stamp: <2005/10/08 10:58:56 +0900>

;; Description:
;;
;;     chini.l �� uninstall �p���W���[��
;;

(require "chini")
(ed::chini-uninstall)

;; �A�b�v�f�[�g�� history ���ێ����邽��
(setq lisp::*modules*
      (delete "chini" lisp::*modules* :test 'string-equal))

;;; chini.l ends here