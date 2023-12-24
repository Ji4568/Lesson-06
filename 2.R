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


