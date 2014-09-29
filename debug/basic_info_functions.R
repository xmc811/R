## this is a function exampling the debugging functions in R
## including message, warning and stop
              
              
## the function itself is to calculate the quotient of two numbers
## it's called divider()
              
divider <- function(a,b) {                       # declare two parameters a and b
       if (is.numeric(a) & is.numeric(b)) {      # check if a and b are numbers
              message("read a and b")            # if they are, make a message
              if (b==0) {                        # if b is 0, calculate anyway
                     d<<-a/b                     # but make a warning
                     
                     ## Notice: here we use "<<" rather than ""< for assignment
                     ## since we want d become a global variable instead of
                     ## a local variable which only appears in the function-calling env
                     
                     invisible(d)
                     ## the function returns the d value but not print it
                     ## if d is put after that
                     ## d is still printed
                     
                     warning("b is 0")
              } else {                           # if b is not 0
                     d<<-a/b                      # do the calculation as usual
                     invisible(d)
                     ## the same as above
                     
                     message("result calculated")# return a normal message
              }
       } else {                                  # if both are not numbers
              stop("invalid input")              # function cannot be executed
       }                                         # return error message
}
