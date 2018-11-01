#lang racket
#|
Phu Nguyen
Homework 3
Comp 333 11AM class
|#

(require racket/trace)
;problem 1

(define palindrome?
  ( lambda (s)
     ( let* ([s1 (string->list s)] [s2 (reverse (string->list s))])
         (equal? s1 s2)
      )
   )
 )

(palindrome? "aaabccbaaa")
(palindrome? "kayak")
(palindrome? "red der")
(palindrome? "a")
(palindrome? "1234567654321")
(palindrome? "algorithm")
(palindrome? "")

;problem 2


(define removeDups
     ( lambda ( lst)
         (cond
;case  where  lst is empty
           ((null? lst) '())


; case where   (car lst) is a member of ( cdr lst) .Use member .
           ((member (car lst) (cdr lst)) (removeDups (cdr lst)))

; else   Need a cons here
           (else (cons (car lst) (removeDups (cdr lst))))
          )
   )
)
(removeDups '(  3  5  6  5  7  5  8  9  3  3  9) )
(removeDups '(  ( 4  6)   (  1  2)   ( 3   1)   (  1  2)   ( 4  6)  (  7  8)  )  )

;problem 3
(define pairwiseSum
  (lambda (lst1 lst2)
     (cond
       ((and (null? lst1) (null? lst2)) '())
       ; case list is empty
       ((not (= (length lst1) (length lst2))) "lists are not the same length")
       ;case list is not empty
       (else (cons  (+  ( car lst1) (car lst2))  (pairwiseSum ( cdr lst1) (cdr lst2) )))
   )
)
)
(pairwiseSum  '(3 4 5 6)  '(10 20 32 40)  )
(pairwiseSum  '()  '()  )
(pairwiseSum  '( 4 5) '( 1 2 3)  )

;problem 4
( define makelist
   (lambda (n item)
   (
      if (= n 0)
             '()
      (cons item (makelist (- n 1) item))
       
    )
   )
   )
(makelist 5 "red")
(makelist 8 "blue")
(makelist 6  '(0 0))

;problem 5

(define rotate
  (lambda (lst)
    (cond
      ((not (list? lst)) "not a list")
      ((null? lst) '())
      (else (append (cdr lst) (list (car lst)) ))
     )
    )
 )

(rotate  '( a b c d e) )
(rotate  '( "red"   "blue")  )
(rotate  '( ) )
( rotate  "abc" )

;problem 6
(define nrotations
  (lambda (lst n)
    ( let* ([rlst (rotate lst)])
    ( if (= n 0)
         '()
         (cons rlst (nrotations rlst (- n 1)))
     )
    )
    )
  )

(nrotations   '( 1 2 3 )    3)
(nrotations   '(  s  t  o  p )   5)
(nrotations  '( 1 2 3 )  0 )

;problem 7
(define greenlist?
  (lambda (lst)
    (if
     (and
      (list? lst)
      (andmap (lambda (x)
               (and (list? x)
                    (= 2 (length x))
                    (= 1 (- (cadr x) (car x))))
               )
             lst)
          (not (null? lst))
          )
        #t
        #f
     )
  )
)

(greenlist? '(  ( 4  7)  ( 9  10 )  )  )
(greenlist?   '(  ( 4.5  5.5) (  7  8) ) )
(greenlist?   '( ) )
(greenlist?   '(  ( 2 4 6)  ( 5 6) ( 1 2) ) )
(greenlist?   '(  3 4 5 6 ) )
(greenlist?  "green apples")

#|

problem 1
#t
#t
#t
#t
#t
#f
#t

problem 2
'(6 7 5 8 3 9)
'((3 1) (1 2) (4 6) (7 8))

problem 3
'(13 24 37 46)
'()
"lists are not the same length"

problem 4
'("red" "red" "red" "red" "red")
'("blue" "blue" "blue" "blue" "blue" "blue" "blue" "blue")
'((0 0) (0 0) (0 0) (0 0) (0 0) (0 0))

problem 5
'(b c d e a)
'("blue" "red")
'()
"not a list"

problem 6
'((2 3 1) (3 1 2) (1 2 3))
'((t o p s) (o p s t) (p s t o) (s t o p) (t o p s))
'()

problem 7
#f
#t
#f
#f
#f
#f

|#