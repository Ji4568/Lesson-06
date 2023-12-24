###第二節：增加程式可讀性(1)
#在R裡面我們經常會使用到組合函數，像是假使我們想要知道生化值的數量共有幾項，我們可以透過下面這種方法得知：
length(levels(factor(dat1$TESTNAME)))

#而這樣程式寫起來會很複雜，比較好的方式應該是這樣：
factorized_TESTNAME = factor(dat1$TESTNAME)
lvl_TESTNAME = levels(factorized_TESTNAME)
length(lvl_TESTNAME)
#但這樣在R裡面會額外儲存很多垃圾物件，並且會拖慢運算速度，因此如何在程式可讀性與執行速度上做平衡呢?
  
#增加程式可讀性(2)
#這裡我們介紹另一個套件「magrittr」，它擁有一個特殊的運算符號「%>%」，功能是把從左到右依序執行任務
#後面函數的「.」代表上一步的結果
library(magrittr)
n.TESTNAME = dat1$TESTNAME %>% factor %>% levels %>% length
n.TESTNAME

n.TESTNAME = dat1$TESTNAME %>% factor() %>% levels() %>% length()
n.TESTNAME

n.TESTNAME = dat1$TESTNAME %>% factor(.) %>% levels(.) %>% length(.)
n.TESTNAME

#為什麼需要「.」這種方式呢，這是因為假使你的函數需要指令參數，那可以透過這種方式來寫出：
f = function(x, a, b) {a*x^2 + b}
1:5 %>% f(., 2, 5)

1:5 %>% f(2, ., 5)

1:5 %>% f(2, 5, .)

#增加程式可讀性(3)
#我們再多介紹幾個特殊的運算符號(這兩個比較不常用)：
#「%<>%」：不要顯示結果，而是改變物件內容
a = 1
a %<>% add(1)
a
#「%$%」：指定物件內的索引格式
n.TESTNAME = dat1 %$% TESTNAME %>% factor %>% levels %>% length
n.TESTNAME

#增加程式可讀性(4)
#學習特殊運算符號的目標除了是增加自己程式的可讀性之外，更重要的是會增加及執行速度！
#讓我們看看結合了眾多改變後，再回頭看看第五課的練習一這個任務要花多久：
t0 = Sys.time
dat1$COLLECTIONDATE = dat1[,3] %>% as.Date
levels.TESTNAME = dat1[,4] %>% factor %>% levels
n.TESTNAME = levels.TESTNAME %>% length
levels.PATNUMBER = dat1[,1] %>% factor %>% levels
n.PATNUMBER = levels.PATNUMBER %>% length

dat_list = list()

for (i in 1:n.PATNUMBER) {
  
  subdat = dat1[dat1[,1]==levels.PATNUMBER[i],]
  levels.COLLECTIONDATE = subdat[,3] %>% factor %>% levels
  n.COLLECTIONDATE = levels.COLLECTIONDATE %>% length
  
  submatrix = matrix(NA, nrow = n.COLLECTIONDATE, ncol = n.TESTNAME + 2)
  colnames(submatrix) = c("PATNUMBER", "COLLECTIONDATE", levels.TESTNAME)
  
  submatrix[,1] = levels.PATNUMBER[i]
  submatrix[,2] = levels.COLLECTIONDATE
  
  for (j in 1:n.COLLECTIONDATE) {
    subsubdat = subdat[subdat[,3]==levels.COLLECTIONDATE[j],]
    for (k in 1:nrow(subsubdat)) {
      NAME = subsubdat[k,4]
      position = which(NAME == levels.TESTNAME) + 2
      submatrix[j, position] = subsubdat[k,5]
    }
  }
  
  dat_list[[i]] = submatrix
}

final.data = do.call("rbind", dat_list)

Sys.time() - t0

head(final.data)

#居然2分多鐘就做完了，配上讀取/寫出檔案的時間加起來也不超過2分半，看來大檔案的處理也並不怎麼可怕！
final.data = as.data.frame(final.data, stringsAsFactors = FALSE)

fwrite(final.data, 'final_data.csv', row.names = FALSE, quote = TRUE)


