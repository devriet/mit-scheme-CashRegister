(define taxrate 0.065)
(define (roundToTwo val)
	(/ (inexact->exact (round (+ (* val 100) 0.01))) 100.00)
)
(define (cash total num)
	(display (string-append "Subtotal: $"
			(number->string
				(roundtotwo (+ total num))
			)
		"\n\nEnter value: $")
	)
	(let ((x (read)))
		(cond ((number? x)
			(cond
			((eq? x 0)
			(display (string-append
				(string-append "\nSubtotal: $"
					(number->string
						(roundtotwo (+ total num))
					)
				) (string-append "\nTax: $"
					(number->string
						(roundtotwo (* (+ total num) taxrate))
					)
				) (string-append "\nTotal: $" 
					(number->string 
						(roundToTwo (+ (+ total num) (* (+ total num) taxrate)))
					)
				) "\n\n\n"
			))#t)
			(else (cash (+ total num) x))
			))
			((display "Input not a valid number\n\n")(cash total num))
		)
	)
)
(define (main)
	(display "\nScheme Point-of-Sale
Start transaction (exit with 0):
-------------------------------------------\n\n"
	)(cash 0 0)
)
(main)
