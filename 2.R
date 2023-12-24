###第二節：增加程式可讀性(1)
#在R裡面我們經常會使用到組合函數，像是假使我們想要知道生化值的數量共有幾項，我們可以透過下面這種方法得知：
length(levels(factor(dat1$TESTNAME)))

#而這樣程式寫起來會很複雜，比較好的方式應該是這樣：
factorized_TESTNAME = factor(dat1$TESTNAME)
lvl_TESTNAME = levels(factorized_TESTNAME)
length(lvl_TESTNAME)
#但這樣在R裡面會額外儲存很多垃圾物件，並且會拖慢運算速度，因此如何在程式可讀性與執行速度上做平衡呢?
  
  