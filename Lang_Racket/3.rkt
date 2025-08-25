#lang racket

(define (calculate-largest-prime-factor n)
  (define current-largest-primefactor 0)

  ; make list of prime numbers untill sqrt n
  (define threshold (inexact->exact (ceiling (sqrt n))))
  (define numbers-till-threshold-vector (build-vector (+ threshold 1) values)) ; vector for speed
  (define (vector->list-of-primes sieved-vector)
    (remove* '(0 #f) (remove 0 (vector->list sieved-vector))))
  (define list-of-prime-numbers
    (let sieve-of-eratosthenes ((current-prime 2)) ; first prime
      (let remove-multiples ((current-multiple 2)) ; first multiple
        (let ((to-remove (* current-prime current-multiple)))
          (cond ((> current-prime (/ threshold  2)) ; first multiple always doubles
                 (vector->list-of-primes numbers-till-threshold-vector))
                ((<= to-remove threshold)
                 (vector-set! numbers-till-threshold-vector to-remove #f)
                 (remove-multiples (+ current-multiple 1)))
                (else (sieve-of-eratosthenes (+ current-prime 1))))))))
  
  (define (find-smallest-prime-factor number)
    (let loop-prime-factors ((current-smallest 1))
      (let* ((new-smallest (cadr (member current-smallest list-of-prime-numbers))))
        (if (integer? (/ number new-smallest))
            new-smallest
            (loop-prime-factors new-smallest)))))

  (let calculate-prime-factors-with-trial-devision ((number n))
    (let* ((smallest-primefactor (find-smallest-prime-factor number))
           (remainder            (/ number smallest-primefactor)))
      (when (> smallest-primefactor current-largest-primefactor)
        (set! current-largest-primefactor smallest-primefactor))
      (if (> remainder 1)
          (calculate-prime-factors-with-trial-devision remainder)
          current-largest-primefactor))))

(calculate-largest-prime-factor 600851475143)