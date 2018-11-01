#lang racket
(require racket/trace)

;count items function
(define count
   (lambda (item lst)
     (cond
       ((null? lst) 0)
       ((equal? item (car lst)) (+ 1 (count item (cdr lst))))
       (else (+ 0 (count item (cdr lst))))
       )
     )
  )

(trace count)
(count 1 '( 1 2 3 4 5 1))

;return the last element of a non-empty list
(define last
  (lambda (lst)
    (cond
      ((null? lst) "error - empty list")
      ;if list has 1 ele -> return first ele
      ((= 1 (length lst)) (car lst))
      ;if list has more than 1 eles -> recurring on last elements
      (else (last (cdr lst)))
      )
    )
  )

(trace last)
(last '(1 2 3 4 5 6))

;double value of list
(define double
  (lambda (lst)
    ( if (null? lst)
         '()
         (cons (* 2 (car lst)) (double (cdr lst)))
    )
  )
  )

(trace double)
(double '(4 6 3 5))

;append 2 lists
(define myappend
  (lambda (lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1) (myappend (cdr lst1) lst2))
     )
   )
  )

(trace myappend)
(myappend '(a b c) '(1 2 3))

;sorting
(sort '(1 4 56 2) =)
(sort '("pink" "blue" "white") string>?)
;sorting tuples of numbers
(sort '( (3 5) (9 2) (4 5) (6 9)) (lambda (x y) (> (cadr x) (cadr y))))

;find median
(define median
  (lambda (lst)
    (let ([midindex (floor(/ (length lst) 2))])
      (list-ref lst midindex)
      )
   )
  )

(median '(1 2 3))