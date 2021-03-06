currency_convert <- function(amount, prefix = "£", stop_pennies = 4) {
  
  #check value is numeric
  if(is.numeric(amount) == TRUE) {
  
  #deal with negative numbers
  if(amount < 0) {amount = -1 * amount
                  prefix = paste0("-",prefix)}
    
  #get big digits
  digits <- nchar(round(amount))
  
  #deal with large numbers
  if(digits > stop_pennies) {
   
   units <- floor((digits - 1) / 3)
    
   #generate unit text
   if(units == 1) {end <- "k "}
   if(units == 2) {end <- "Million"}
   if(units == 3) {end <- "Billion"}
   if(units == 4) {end <- "Trillion"}
   if(units == 5) {end <- "Quadrillion"}
   if(units == 6) {end <- "Quintillion"}
   if(units == 7) {end <- "Sextillion"}
   if(units == 8) {end <- "Septillion"}
   if(units == 9) {end <- "Octillion"}
   if(units == 10) {end <- "Nonillion"}
   
   #message if value exceeds limit
   if(units > 10) {currency <- "Value is too large!!"}
   
   else {amount2 <- round(amount, digits = -(digits - 3))
         amount2 <-  amount2 / (1000 ^ units)
         currency <-  paste0(prefix,amount2," ",end) } }
  
  #if 0 pounds then put units into pennies
  else { if (round(amount) == 0) {
            amount2 <- round(amount, digits = 2) * 100
            if(prefix == "$") {pennies = "c"} else {pennies = "p"}
            currency = paste0(amount2,pennies)
                                  }
         
         #deal with small numbers 
         else {amount <- round(amount, digits = 2)
               amount2 <- sprintf("%.2f",round(amount,2))
               currency <- paste0(prefix,amount2) }
       }
  
  #return output
  return(currency) }
  
  #return error message on non numeric input
  else {return("Please enter a valid number") }
}
