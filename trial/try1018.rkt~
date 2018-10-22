#lang racket
(define h
  (lambda (u a)
    (cond
      ((< u a) 0 )
      ((= u a) 0.5)
      ((> u a) 1)
    )
   )
 )

(h 0 0 )

(define v 2)
(let ([x (+ v 1)] [y 5])
  (+ (* x x) (* y y))
  )

(let ([f +])
  (f 3 4 5)
  )

(let ([f (lambda (x) (+ 1 (* 2 x)))])
  (f 6)
  )

(define qs
  (lambda (a b c)
    (if (= a 0)

    (let* ([get (/ (- c) b)])  (list get))
        
    (let* ([disc (- (* b b) (* 4 a c))]
       [root1 (/ (+(- b )(sqrt disc)) (* 2 a))]
       [root2 (/ (-(- b )(sqrt disc)) (* 2 a))])
      (list root1 root2)
    )
  )
  )
)

(define qs2
  (lambda (a b c)
    (if (= a 0)

    ((list (/ (- c) b)))
        
    (let* ([disc (- (* b b) (* 4 a c))]
       [root1 (/ (+(- b )(sqrt disc)) (* 2 a))]
       [root2 (/ (-(- b )(sqrt disc)) (* 2 a))])
      (list root1 root2)
    )
  )
  )
)
(qs 2.0 1.0 -6.0)
(qs 0.0 1.0 -6.0)


(define factorial (lambda (n) (if (= n 0) 1 (* n (factorial (- n 1)))) ))
(factorial 4)

(define fib (lambda (n)
              (cond
                ((< n 0) "error: n must be > 0")
                ((= n 0) 0)
                ((= n 1) 1)
                (else (+ (fib (- n 1)) (fib (- n 2)) ) )
                )
         ))
(fib  3)