#lang racket

#|
Phu Nguyen
Homework2
tue-thu, 11-12.30
|#


#| problem 1 |#
( define average
   ( lambda ( a b c )
      (/ (+ a b c) 3)
   )
)

(average 4 7 4) ;5

#| problem 2 |#
( define evalPoly
   (lambda (a b c x)
     (+ (* a (* x x)) (* b x) c)
     )
)

(evalPoly 1 2 3 5) ;38

#| problem 3 |#
( define gcd
   (lambda ( a b )
     (cond
       ( (and (= a 0) (= b 0) ) "No greatest common divisor")
       ( (= b 0) a )
       ( (= a 0) b )
       ( (>= a b) (gcd (- a b) b))
       ( else (gcd a (- b a)))
     )
   )
)

(gcd 34 12) ;2

#| problem 4 |#
( define f
      ( lambda ( lst)
          (  +
                ( * ( car (car lst)) ( car ( cadr lst) ) )
                 (* (cadr (car lst) )  ( cadr ( cadr lst) ) )
           )))

(f '( (3 5) (6 9))) ;63
#| function f gets multiply 2 numbers inside the 2 parentheses of a list
    ,then add them together|#

(f '( (3 5) (6 9) (2 3))) ;63
#| f function never reaches the third group of number
, therefore the output is the same|#

;(f '( (3 5) ))
#| cadr: contract violation
  expected: (cons/c any/c pair?)
  given: '((3 5)) |#
#| f function requires 2 groups of 2 numbers
(it looks for 2nd group using cadr) |#

#| problem 5 |#
( define g
      ( lambda ( lst)
           (let  ( [first ( car lst) ]  
                    [second (cadr lst ) ] )
                    ( +
                           (* (car first) (car second) )
                           ( * (cadr first) (cadr second) )
                            (* (caddr first) (caddr second) )
                     )
)))

( g  '(  (3 5  2)  ( 6 9  5) )  )  ;73

#| problem 6 |#
(define middle
  ( lambda (lst)
     (let* ( [a (car lst)]
             [b (cadr lst)]
             [c (caddr lst)]
             [x (- a b)]
             [y (- b c)]
             [z (- a c)]
            )
       (cond
         ((> (* x y) 0) b)
         ((> (* x z) 0) c)
         (else a)
       ) 
     )
  )
)

(middle  '(7  2  4) ) ;4

#| problem 7 |#
(define greater
  (lambda ( pt1 pt2 )
    ( let* (
           [a (car pt1)]
           [b (cadr pt1)]
           [c (car pt2)]
           [d (cadr pt2)]
           [x (sqrt (+ (* a a) (* b b)))]
           [y (sqrt (+ (* c c) (* d d)))]
           )
    ( cond
       ((> x y) true)
       ((< x y) false)
       (else false)
    )
  )
)
)

( greater '(10  6)  '( 2  3) ) ;true

#| outputs:

5
38
2
63
63
73
4
#t

|#