setwd("~/Downloads/")
total <- read.table(file="miRNAbenchmark.tsv", header = TRUE, fill = TRUE, sep = "\t")
start <- nrow(total)
total$mod <- substr(total$NAME, regexpr(":null_add:", total$NAME)+17, nchar(as.character(total$NAME)))
total$len_mod <- nchar(total$mod)-1
total$program <- substr(total$TOOL, 1, regexpr(";", total$TOOL)-1)

only3nt <- nrow(total)
total$count <- 1

total$lossRand3p <- regexpr("test_lossRand_3p", total$TOOL)
total$gainRand3p <- regexpr("test_gainRand_3p", total$TOOL)
total$gainTemp3p <- regexpr("test_gainTemp_3p", total$TOOL)
total$gainTemp5p <- regexpr("test_gainTemp_5p", total$TOOL)
total$lossRand5p <- regexpr("test_lossRand_5p", total$TOOL)

lossRand3p <- total[which(total$lossRand3p>-1),]
gainRand3p <- total[which(total$gainRand3p>-1),]

gainTemp3p <- total[which(total$gainTemp3p>-1),]
gainTemp5p <- total[which(total$gainTemp5p>-1),]
lossRand5p <- total[which(total$lossRand5p>-1),]

### analysis of reads of 1-2 nt changes
analyzed <- lossRand3p
analyzed <- analyzed[which(analyzed$len_mod<3),]
aggdata <-aggregate(analyzed$count, by=list(analyzed$ALIGNED, analyzed$program), FUN=sum, na.rm=FALSE)
colnames(aggdata) <- c("ALIGNED", "program", "counts")
numbers <-aggregate(analyzed$count, by=list(analyzed$program), FUN=sum, na.rm=FALSE)
colnames(numbers) <- c("program", "totals")

aggdata <- merge(aggdata, numbers, by=("program"))

aggdata$ratio <- aggdata$counts/aggdata$totals*100

### by length
analyzed2 <- lossRand3p
mapped <- analyzed2[which(analyzed2$ALIGNED=="yes" | analyzed2$ALIGNED=="multi-yes"),]

aggdata2 <-aggregate(mapped$count, by=list(mapped$program, mapped$len_mod), FUN=sum, na.rm=FALSE)
colnames(aggdata2) <- c("program", "length", "counts")

numbers2 <-aggregate(analyzed2$count, by=list(analyzed2$program, analyzed2$len_mod), FUN=sum, na.rm=FALSE)
colnames(numbers2) <- c("program", "length" , "totals")

aggdata2 <- merge(aggdata2, numbers2, by=(c("program","length")))

aggdata2$ratio <- aggdata2$counts/aggdata2$totals*100
