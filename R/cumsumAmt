## create a function called, cumsumAmt, to calculate cumulative sum amount broken down by date
## input: df name and ID of the interested mayor
cumsumAmt_fn <- function(Data, ID){
	  data <- Data
	  
    ## assign column numbers to object names
    col_ID <- which(colnames(data)=="ID")  ##"ID" is the name of the column which can be changed
    col_TDate <- which(colnames(data)=="TDate") ##"TDate" is the name of the Transfer Date column
    col_Amt1 <- which(colnames(data)=="Amt1")  ##"Amt1" is the transfer amount that we are interested in
    
	  data <- data[,c(col_ID,col_TDate, col_Amt1)]  ##Taking only the ID, TDate, Amt1 columns
	  sumTranAmtByFilerID <- aggregate(Amt1 ~ ID + TDate, data=data, FUN=sum)
    sumTranAmtByFilerID <- sumTranAmtByFilerID[(sumTranAmtByFilerID$ID == ID), c(1,2,3)]
    within(sumTranAmtByFilerID, {
        cumsumAmt <- ave(Amt1, FUN = cumsum)
    })
}

## input: "mayors" which is df from dataloading.R at line 79
## input: Sam Licardo's ID is 1361139
cumsumAmt_fn(mayors, 1361139)

## David Cortese's ID is 1362117
cumsumAmt_fn(mayors, 1362117)
