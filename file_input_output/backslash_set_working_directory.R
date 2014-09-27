
## These commands are used to set working directory from windows format address line
## The critical point is to understand the escaping system in R


wd <- readline()    

# copy and paste the windows address line in the prompt
# we cannot simply paste the directory in the function for substitution
# since Windows format address contains only one backslash
# while in R, backslash is used as an escaping symbol
# thus R will read the single backslash as escaping signals for the following symbol
# it will not make sense in this format


# readline help you input in the address in Windows format and
# internally convert it to double backslash for following manipulations


wd <- gsub("\\\\","/",wd)
wd

## the reason using four consecutive backslash is also escaping rules
## for 2n backslash, n of them will be just escaping signal and have no actual meaning


setwd(wd)
getwd()

