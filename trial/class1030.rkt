#lang racket
(require racket/trace)
; Map function
(map sqr '(2 5 7 3 2))

(map (lambda (x) (if (< x 0) (+ 1 x) (- x 1))) '(9 5 -7 8 -12 10))

;Find the  second item of each of the list
(define z '( ("Tim" 45 10) ("Lyn" 13 12) ("Terry" 14 11)))

(map (lambda (x) (car (cdr x))) z)

;sum the second items in the list z
;sumList is going to be on the midterm
;(sumList (map (lambda (x) (car (cdr x))) z))


;multiplication on list element
(define multiNumber
  (lambda (k lst)
    (map (lambda (x) (* x k)) lst)
    )
  )
(trace multiNumber)
(multiNumber 4 '(10 20 30))

;map with 2 lists of the same length
(map (lambda (x y) (+ x y)) '(3 4 7) '(8 2 10))

;filter function
(filter even? '(2 3 4 5 6 7 8 9))

(filter (lambda (x) (not (= x 5)) ) '(5 10 5 100))

;count number of items that is less than k
(define count<
  (lambda (lst k)
    (length
     (filter (lambda (x) (< x k)) lst)
     )
    )
  )

(trace count<)
(count< '(3 6 7 4 2 9 1 -4 -3 5 6) 5)

(define count2<
  (lambda (lst a b)
    (length
     (filter (lambda (x) (and (>= x a) (<= x b))) lst)
     )
    )
  )

(count2< '(3 6 7 4 2 9 1 -4 -3 5 6) 5 9)

;combining map and filter
;find number that is divided by 3 in range and ^2 them
(map sqr (filter (lambda (u) (= 0 (remainder u 3))) (range 2 20)))

(require math)
(length (filter prime? (range 2 100)))

;andmap function
(andmap positive? '(3 4 5 -7))
(andmap positive? '(3 4 5 7))
;(andmap (lambda (x) (= x 5)) '( (+ 4 1) (- 6 1) 5))

;ormap function
(ormap positive? '(3 4 5 -7))
(ormap positive? '(-3 -4 -5 -7))

;check if "apple" is in list
(ormap (lambda (s) (string=? s "apple")) '("apple" "orange" "apple" "grape"))

#|
;dotproduct
(define dotproduct
  (lambda (a b)
    (sumList (map (lambda (x y) (* x y)) '(5 8 3) '(4 9 6)))
    )
  )
|#

;user defined func

;(intervalSum f a b)
;(intervalSum sqr 2 5)
