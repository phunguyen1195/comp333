#lang racket

;a function return function
;x -> ax^2 + bx + c
(define makePoly
  (lambda (a b c)
    (lambda (x) (+ (* a x x) (* b x) x))
    )
  )

(define f (makePoly 4 2 -1))
(f 5)

#|
(e1 e2 e3 e4 e5)
  | {     |     }
  |       |
  must evaluate to a procedure or function
          |
        these are arguments to e1
|#

;shorter way
((makePoly 4 2 -1) 5)

;assigning a function to a var to create a nested function
;greater? function from homework2

(define greater?
  (lambda (point1  point2)
    (let ( [ distOrigin (lambda( x y )  (sqrt ( + ( sqr x) ( sqr y)))) ] )
( > (distOrigin (car point1) ( cadr point2) ) (distOrigin ( car point2) (cadr point2)))
)))

#|
block static scope of scheme
translate to scheme from other languages
|#
