#lang racket

(define (calculate-sum-of-multiples n)
  (define sum-of-multiples 0)
  (let loop ((i (- n 1)))
    (when (or (eq? 0 (remainder i 3)) (eq? 0 (remainder i 5)))
      (displayln i)
      (set! sum-of-multiples (+ sum-of-multiples i)))
    (unless (eq? i 0) (loop (- i 1))))
  sum-of-multiples)

(calculate-sum-of-multiples 1000)