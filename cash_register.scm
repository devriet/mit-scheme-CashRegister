(define taxrate 0.065)
(define (roundToTwo val)
	(let ((x
	(/ (inexact->exact (round (+ (* val 100) 0.01))) 100.00)
	))
	(cond
	((eq? x 0)
	0.0
	) (else x)
	))
)
(define (right-pad number len)
	(let* ((nstr (number->string number))
         	(diff (- len (string-length nstr)))
         	(pads (if (> diff 0) (make-string diff #\0) "")))
		(string-append nstr pads)
	)
)
(define (showDollars val)
	(let ((x (number->string (* val 1.0))))
	(right-pad val (+ (string-length x) (- 2 (- (string-length x) (string-search-backward "." x)))))
	)
)
(define (cash total num)
	(display (string-append "Subtotal: $"
			(showdollars
				(* 1.00 (roundtotwo (+ total num)))
			)
		"\n\nEnter value: $")
	)
	(let ((x (read)))
		(cond ((number? x)
			(cond
			((eq? x 0)
			(display (string-append
				(string-append "\nSubtotal: $"
					(showdollars
						(roundtotwo (+ total num))
					)
				) (string-append "\nTax: $"
					(showdollars
						(roundtotwo (* (+ total num) taxrate))
					)
				) (string-append "\nTotal: $" 
					(showdollars 
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
	)(cash 0.0 0.0)
)
(main)
