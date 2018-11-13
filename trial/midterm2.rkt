#lang racket
(/ (+ 300 5) (* (- (* 4 12) 70) 1001))

(- 12 (/ (sqrt(- (* 12 12) (* 4 2 5))) (* 2 2)))

(define maxmin
  (lambda (a b c d)
    (- (max a b c d) (min a b c d))
    )
  )

(maxmin 1 2 3 5)

(define Sumlist
  (lambda (lst)
    (if (null? lst)
    0
    (+ (car lst) (Sumlist (cdr lst)))
    )
    )
  )

(Sumlist (range 2 5))