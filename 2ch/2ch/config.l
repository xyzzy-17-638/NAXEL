; $Id: config.l 3 2003-01-25 20:35:51Z torihat $

(in-package "2ch")

;; �n���h���A���[���̏����l�ݒ�
;(setq *form-name* "����������")
;(setq *form-email* "sage")

;; ���C�ɓ���A�ǂ������X���̕\����
;(setq *favorits-name* "���C�ɓ���")
;(setq *tracking-name* "�ǂ������X��")

;; �X���ꗗ�͂���ȏ�ǂ܂Ȃ�
;(setq *board-max-lines* 100)

;; �X���ꗗ�ŃX���b�h��ǂ񂾂��Ƃ����邩�ǂ������}�[�N�\���B�i�\�����x���Ȃ�̂Œ��Ӂj
;(setq *thread-read-check* t)
;; �X���ꗗ�ōX�V������\���B�i�\�����x���Ȃ�̂Œ��Ӂj
;(setq *board-wtime-check* t)	; �X���ꗗ
;(setq *tracking-wtime-check* t)	; �ǂ������X���ꗗ
;(setq *search-wtime-check* t)	; �����ꗗ
;; �X���ꗗ�ōX�V���ꂽ�X���������\��
;(add-hook '*board-show-hook* 'board-update-emphasis)

;; gzip�]��
;(setq *http-accept-encoding* "gzip")

;; dolib.dll���g��
;(setq *2ch-use-dolib* t)

;(setq *dolib-name* "pikopikopo---n@tora3.net")
;(setq *dolib-pass* "detaramenahito")

;(setq *dolib-proxy* www::*www-proxy-host*)
;(setq *dolib-port* www::*www-proxy-port*)

;; read.cgi��rawmode���g���I���X�g
;(setq *read-cgi-hosts* '(
;			 "cheese.2ch.net"
;			 "choco.2ch.net"
;			 "cocoa.2ch.net"
;			 "curry.2ch.net"
;			 "ebi.2ch.net"
;			 "game.2ch.net"
;			 "kaba.2ch.net"
;			 "life.2ch.net"
;			 "mentai.2ch.net"
;			 "natto.2ch.net"
;			 "news.2ch.net"
;			 "okazu.bbspink.com"
;			 "pc.2ch.net"
;			 "piza2.2ch.net"
;			 "saki.2ch.net"
;			 "salad.2ch.net"
;			 "sports.2ch.net"
;			 "teri.2ch.net"
;			 "ton.2ch.net"
;			 "www2.bbspink.com"
;			 "yasai.2ch.net"
;			 ))

;;bbstable2.html����ꗗ��ǂ�
;(setq *menu-file-name* "bbstable2.html")
;(setf (symbol-function 'menu-parse) #'menu-parse-bbstable2)

;;2channel.brd����ꗗ��ǂ�(".2ch/2channel.brd"�ɒu��)
;(setq *menu-file-name* "2channel.brd")
;(setf (symbol-function 'menu-parse) #'menu-parse-2channel-brd)
;(add-hook '*init-variables-hook*
;	  #'(lambda ()
;	      (setq *menu-url* *menu-file*)))

;; �N�����ɃI�����C�����[�h�ɂ���
;(setq *online* t)

;; �N�����ɃX���I���^�u�o�[��\��
;(setq *thread-bar-show* t)

; �N�����ɑO��Ō�ɓǂ񂾃X�����J��
;(add-hook '*2ch-start-hook* 'history-current-show)

;; �ǂ������X���ŏ��񂵂Ȃ��O���[�v�̃��X�g�i���K�\���j
;(setq *tracking-round-ignore-list* '("��.*"
;				     "���̑�"))

; �ǂ������X�������A�X�V���ɕ��ёւ���
;(add-hook '*tracking-update-list-hook* 'tracking-sort-by-update)

; �ǂ������X���O���[�v�������A�X�V���ꂽ�X��������ɊJ��
;(add-hook '*tracking-update-all-hook* 'tracking-next-updated)

; �ǂ������X���S�����A�X�V���ꂽ�X���̃��X�g��\��
;(add-hook '*tracking-update-full-hook* 'tracking-show-updated)
; �ǂ������X���S�����A�X�V���ꂽ�X��������ɊJ���i���Ƃǂ��炩�ɂ��āj
;(add-hook '*tracking-update-full-hook* 'menu-tracking-uplist-next)

; ���C�ɓ���X�V���Ƀo�b�N�A�b�v
;(setq *favorits-file-backup* t)

; �ǂ������X���X�V���Ƀo�b�N�A�b�v
;(setq *tracking-file-backup* t)
; �ǂ������X���O���[�v�폜���ɏ������Ƀt�@�C������ύX
;(setq *tracking-delete-file* nil)
; �ǂ������X���O���[�v�폜���ɃS�~���ֈڂ��ixyzzy-0.2.1.190�ȍ~�̂݁j
;(setq *tracking-delete-file-recycle* t)

; �X���f�[�^�폜���ɃS�~���ֈڂ��ixyzzy-0.2.1.190�ȍ~�̂݁j
;(setq *thread-delete-dat-recycle* t)
; �X���u�b�N�}�[�N�폜���ɃS�~���ֈڂ��ixyzzy-0.2.1.190�ȍ~�̂݁j
;(setq *thread-delete-tbk-recycle* t)

;;�X�����ɕ\�����Ȃ�
;(setq *thread-show-preview* nil)

;; ���[�����̃l�^�΂�h�~
;(setq *thread-hide-addr* t)

;;�X���͈�x�ɂ���ȏ�擾���Ȃ�
;(setq *thread-max-lines* 100)

;; �����N�͏�Ƀu���E�U�ŊJ��
;(setq *thread-open-2ch-url* nil)

;; "www.hogehoge...." �݂����Ȃ̂������N�ɂ���
;(add-hook '*thread-show-hook* 'thread-convert-link-like)

;; "&#???" �݂����Ȃ̂�ϊ�����B
;(add-hook '*thread-show-pre-hook* 'thread-convert-unicode-chars)
;; "&hearts;" �Ƃ���ϊ�����
;(add-hook '*thread-show-pre-hook* 'thread-convert-special-chars)

;; ���N���b�N�̓_�u���N���b�N��
;(setq *2ch-mouse-single-click* nil)

;; �ꗗ���j���[���inil�Ȃ番�����Ȃ��j
;(setq *menu-width* 20)
;; �X���ꗗ�̍����inil�Ȃ番�����Ȃ��j
;(setq *board-height* 5)
;; �����t�H�[���ɕ������鎞�ɃX���\���Ɏc�������it�Ȃ甼���ɁAnil�Ȃ番�����Ȃ��j
;(setq *form-height* 10)

;; �X���ꗗ�̃X���^�C�g���̕�
;(setq *board-title-width* 60)
;; �X���ꗗ�̍X�V�����\���`��
;(setq *board-date-format* "%Y/%m/%d(%v) %H:%M")

;; ���j���[�̔z�F
;(setq *menu-fgcolor* 0)
;(setq *category-fgcolor-open* 2)
;(setq *category-fgcolor-close* 10)

;(setq *menu-bgcolor* 0)
;(setq *category-bgcolor-open* 0)
;(setq *category-bgcolor-close* 0)

;; �X���ꗗ�̔z�F
;(setq *board-fgcolor-number* 1)
;(setq *board-fgcolor-tracking* 5)
;(setq *board-fgcolor-kako* 6)
;(setq *board-fgcolor-mark* 7)
;(setq *board-fgcolor-title* 2)
;(setq *board-fgcolor-num* 4)
;(setq *board-fgcolor-name* 0)
;(setq *board-fgcolor-wtime* 0)
;(setq *board-fgcolor-read* 0)

;(setq *board-bgcolor-number* 0)
;(setq *board-bgcolor-tracking* 0)
;(setq *board-bgcolor-kako* 0)
;(setq *board-bgcolor-mark* 0)
;(setq *board-bgcolor-title* 0)
;(setq *board-bgcolor-num* 0)
;(setq *board-bgcolor-name* 0)
;(setq *board-bgcolor-wtime* 0)
;(setq *board-bgcolor-read* 0)

;; �X���\���̔z�F
;(setq *thread-fgcolor-number* 1)
;(setq *thread-fgcolor-date* 2)
;(setq *thread-fgcolor-name* 3)
;(setq *thread-fgcolor-addr* 4)
;(setq *thread-fgcolor-body* 0)
;(setq *thread-fgcolor-name-sage* 5)
;(setq *thread-fgcolor-addr-sage* 6)
;(setq *thread-fgcolor-cite* 15)

;; �����t�H�[���̔z�F
;(setq *form-color-title* 1)
;(setq *form-color-header* 2)
;(setq *form-color-name* 3)
;(setq *form-color-email* 4)

;; �u�b�N�}�[�N�ꗗ�̔z�F
;(setq *bookmark-fgcolor-category* *board-fgcolor-name*)
;(setq *bookmark-bgcolor-category* *board-bgcolor-name*)
;(setq *bookmark-fgcolor-board* *board-fgcolor-tracking*)
;(setq *bookmark-bgcolor-board* *board-bgcolor-tracking*)
;(setq *bookmark-fgcolor-mark* *board-fgcolor-read*)
;(setq *bookmark-bgcolor-mark* *board-bgcolor-read*)
;(setq *bookmark-fgcolor-title* *board-fgcolor-title*)
;(setq *bookmark-bgcolor-title* *board-bgcolor-title*)
;(setq *bookmark-fgcolor-point* *board-fgcolor-num*)
;(setq *bookmark-bgcolor-point* *board-bgcolor-num*)

;; �������Ń}�b�`����������̔z�F
;(setq *grep-match-fgcolor* 1)
;(setq *grep-match-bgcolor* 0)

;; �폜�E�A�[�J�C�u
; �J���Ȃ����������i�f�t�H���g��30���j
;(setq *thread-clean-days* 10)
; �u�b�N�}�[�N�t�@�C��������
;(setq *thread-clean-tbk* t)
; �ǂ������X��������
;(setq *thread-clean-tracking* t)
; �폜����O�ɃA�[�J�C�u����
;(setq *thread-clean-archive* t)
; �폜���鎞�ɃS�~���ֈڂ�
;(setq *thread-clean-recycle* t)
; �A�[�J�C�u�t�@�C�����i�v�Ή�DLL�j
;(setq *thread-archive-file-name* "archive.lzh")
;;(setq *thread-archive-file-name* "archive.zip")

;; �o������������߂���
;; ~/.xyzzy�Ɂ��̂悤�ɂ��Ă����Ƃ�������
;; (autoload '2ch-toggle "2ch/main" t)
;; (global-set-key #\S-F1 '2ch-toggle)
;(define-key *board-map* #\S-F1 'toggle)
;(define-key *form-map* #\S-F1 'toggle)
;(define-key *thread-map* #\S-F1 'toggle)
;(define-key *menu-map* #\S-F1 'toggle)
;(define-key *tracking-map* #\S-F1 'toggle)

;; xyzzycli����Ă΂�Ȃ��悤�ɂ���
;(add-hook '*2ch-start-hook* 'stop-xyzzy-server)
