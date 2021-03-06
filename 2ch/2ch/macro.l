; $Id: macro.l 3 2003-01-25 20:35:51Z torihat $

(provide "2ch/macro")

(in-package "2ch")

(defmacro form-data-time (data)
  `(car ,data))
(defmacro form-data-board (data)
  `(nth 1 ,data))
(defmacro form-data-host (data)
  `(nth 2 ,data))
(defmacro form-data-path (data)
  `(nth 3 ,data))
(defmacro form-data-dat (data)
  `(nth 4 ,data))
(defmacro form-data-subject (data)
  `(nth 5 ,data))
(defmacro form-data-name (data)
  `(nth 6 ,data))
(defmacro form-data-addr (data)
  `(nth 7 ,data))
(defmacro form-data-body (data)
  `(nth 8 ,data))

(defmacro category-name (c)
  `(car ,c))
(defmacro category-menu (c)
  `(cadr ,c))
(defmacro category-open-p (c)
  `(caddr ,c))

(defmacro category-name-menu (name)
  `(assoc ,name *menu-list* :test 'equal))

(defmacro menu-list-name (menu)
  `(car ,menu))
(defmacro menu-list-host (menu)
  `(cadr ,menu))
(defmacro menu-list-path (menu)
  `(caddr ,menu))
(defmacro menu-list-tracking-p (menu)
  `(nth 3 ,menu))

(defmacro thread-line-name (line)
  `(car ,line))
(defmacro thread-line-addr (line)
  `(cadr ,line))
(defmacro thread-line-date (line)
  `(caddr ,line))
(defmacro thread-line-body (line)
  `(nth 3 ,line))
(defmacro thread-line-number (line)
  `(nth 4 ,line))
(defmacro thread-line-title (line)
  `(nth 4 ,line))

(defmacro addr-sage-p (addr)
  `(string-match "sage" ,addr))

(defmacro thread-kako2dat (dat)
  `(substitute-string ,dat "html" "dat"))
(defmacro thread-dat2kako (dat)
  `(substitute-string ,dat "dat" "html"))

(defmacro thread-dat-kako-p (dat)
  `(equal (pathname-type ,dat) "html"))
(defmacro thread-kako-new-p (dat)
  `(< 9 (length (pathname-name ,dat))))

(defmacro attr-beg (attr)
  `(car ,attr))
(defmacro attr-end (attr)
  `(nth 1 ,attr))
(defmacro attr-tag (attr)
  `(nth 2 ,attr))

(defmacro thread-history-point (history)
  `(car ,history))
(defmacro thread-history-buffer (history)
  `(cadr ,history))

(defmacro tbk-assoc (tbk key)
  `(assoc ,key ,tbk))
(defmacro tbk-value (tbk key)
  `(cdr (tbk-assoc ,tbk ,key)))
(defmacro tbk-point (tbk)
  `(tbk-value ,tbk 'point))
(defmacro tbk-aborn (tbk)
  `(tbk-value ,tbk 'aborn))
(defmacro tbk-name (tbk)
  `(tbk-value ,tbk 'name))
(defmacro tbk-addr (tbk)
  `(tbk-value ,tbk 'addr))

(defmacro tracking-list-name (track)
  `(car ,track))
(defmacro tracking-list-host (track)
  `(nth 1 ,track))
(defmacro tracking-list-path (track)
  `(nth 2 ,track))
(defmacro tracking-list-dat (track)
  `(nth 3 ,track))
(defmacro tracking-list-title (track)
  `(nth 4 ,track))
(defmacro tracking-list-num (track)
  `(nth 5 ,track))

(defmacro bookmark-category (bookmark)
  `(car ,bookmark))
(defmacro bookmark-board (bookmark)
  `(cadr ,bookmark))
(defmacro bookmark-host (bookmark)
  `(nth 2 ,bookmark))
(defmacro bookmark-path (bookmark)
  `(nth 3 ,bookmark))
(defmacro bookmark-title (bookmark)
  `(nth 4 ,bookmark))
(defmacro bookmark-dat (bookmark)
  `(nth 5 ,bookmark))
(defmacro bookmark-point (bookmark)
  `(nth 6 ,bookmark))

(defmacro popup-menu-list (mode)
  `(assoc ,mode *popup-menu-list*))
(defmacro popup-menu-mode (list)
  `(car ,list))
(defmacro popup-menu-func (list)
  `(cadr ,list))
(defmacro popup-menu-menu (list)
  `(caddr ,list))

(defmacro grep-line-board (line)
  `(car ,line))
(defmacro grep-line-host (line)
  `(nth 1 ,line))
(defmacro grep-line-path (line)
  `(nth 2 ,line))
(defmacro grep-line-dat (line)
  `(nth 3 ,line))
(defmacro grep-line-title (line)
  `(nth 4 ,line))
(defmacro grep-line-number (line)
  `(nth 5 ,line))
(defmacro grep-line-article (line)
  `(nth 6 ,line))

(defvar *board-redraw-func* nil)
(defvar *board-close-func* nil)

(defun board-redraw ()
  (let ((func (cdr (assoc buffer-mode *board-redraw-func*))))
    (when func
      (funcall func))))

(defun board-close ()
  (interactive)
  (let ((func (cdr (assoc buffer-mode *board-close-func*))))
    (when func
      (funcall func))))

(defun board-select ()
  (interactive)
  (let ((func (cdr (assoc buffer-mode *2ch-mouse-left-press*))))
    (when func
      (funcall func))))

(push '(2ch-board . board-quit) *board-close-func*)
(push '(2ch-board . board-refresh) *board-redraw-func*)

(push '(2ch-search . search-quit) *board-close-func*)
(push '(2ch-search . search-redraw) *board-redraw-func*)

(push '(2ch-tracking . tracking-quit) *board-close-func*)
(push '(2ch-tracking . tracking-reload) *board-redraw-func*)
