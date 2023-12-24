###第三節：遺漏值插補(1)
#在剛剛的資料中，你應該有注意到假設我想計算鈣磷乘積，那勢必得同時有鈣以及磷兩個指標，那假設同一天只有測磷，而沒有測鈣呢?
#在這裡，我們要介紹遺漏值插補的技術，而根據不同的資料型態會選擇不同的方法，以我們的資料為例，由於裡面有不同的個案，所以我們插補的依據就是「把每個人的平均」補上去。
#這個問題其實就是要一個人一個人做，我們同樣的再把原始資料，取平均需要用到函數「mean」：
final.data_1 = final.data
levels.PATNUMBER = final.data_1[,1] %>% factor %>% levels
n.PATNUMBER = levels.PATNUMBER %>% length

i = 1
sub_final.data_1 = final.data_1[final.data_1[,1] == levels.PATNUMBER[i],]
sub_final.data_1[is.na(sub_final.data_1[,'IP']),'IP'] = mean(sub_final.data_1[,'IP'], na.rm = TRUE)
#這邊你先思考一下，我要如何把這樣的過程擴展到全部的資料上面?
  