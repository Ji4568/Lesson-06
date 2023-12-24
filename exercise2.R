###練習2：學習看看說明做事情
#我們先把生化值都轉成數字格式：
for (i in 1:n.TESTNAME) {
  final.data[,i+2] = as.numeric(final.data[,i+2])
}
#雖然我們已經學會了非常多資料處理的技術，但我們也深深了解到使用套件能帶給我們的加速是非常顯著的，我們來查查平常人家都怎樣做資料處理。
#你不用查很久你就會發現有個套件叫做「dplyr」，我們發現大家比較喜歡用這個套件來做資料處理：
#假設我們想做出鈣磷乘積：
final.data_1 = final.data
final.data_1[,"Cap"] = final.data_1[,"Total Calcium"] * final.data_1[,"IP"]
head(final.data_1)
#在仔細閱讀說明後，我們發現有個「mutate」函數，他能做到我們想做的事情，現在請你試著使用mutate函數來做出鈣磷乘積！

###練習2答案
#你應該會發現，如果要做Creatinine和Na的乘積，可以用下面這個語法：
library(dplyr)
final.data_1 = final.data
final.data_1 %<>% mutate(CrNa = Creatinine * IP)
#但是如果要做出鈣磷乘積，則要先改名字：
colnames(final.data_1)[18] = 'Total_Calcium'
final.data_1 %<>% mutate(Cap = Total_Calcium * Na)


