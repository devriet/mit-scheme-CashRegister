# Cash Register
## Background
This is a very simple cash register project using mit-scheme.
The project was created for an assignment in CIS343 - Structures in Programming Languages at Grand Valley State University.
## Usage
The project begins with a running total set to `$0`.
It then repeatedly asks the user for the value of the next item and adds that value to the running total.
The program checks user input for non-number values entered.
Negative values are intentionally allowed to accomodate for discounts, returns, etc.
When the user enters a 0, the program calculates the sales tax (based on a fixed value), gives a total cost, and exits.
