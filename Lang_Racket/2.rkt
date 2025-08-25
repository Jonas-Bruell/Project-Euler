#lang racket

(define (calculate-even-fibonacci-numbers n)
  (define result 0)
  (let calculate-even-fibs ((2nd-to-last 1) (last 1)) 
    (let ((current (+ 2nd-to-last last)))
      (when (even? current)
        (set! result (+ result current))) 
      (if (< current n)
        (calculate-even-fibs last current)
        result))))

(calculate-even-fibonacci-numbers 4000000)