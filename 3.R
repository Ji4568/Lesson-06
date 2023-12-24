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
  
#遺漏值插補(2)
#那要做所有變項的也不難，只要這樣就能做完了：
final.data_1 = final.data
levels.PATNUMBER = final.data_1[,1] %>% factor %>% levels
n.PATNUMBER = levels.PATNUMBER %>% length
levels.TESTNAME = colnames(final.data_1)[-c(1:2)]
n.TESTNAME = levels.TESTNAME %>% length

dat_list = list()

for (i in 1:n.PATNUMBER) {
  sub_final.data_1 = final.data_1[final.data_1[,1] == levels.PATNUMBER[i],]
  for (j in 1:n.TESTNAME) {
    sub_final.data_1[is.na(sub_final.data_1[,levels.TESTNAME[j]]),levels.TESTNAME[j]] = mean(sub_final.data_1[,levels.TESTNAME[j]], na.rm = TRUE)
  }
  dat_list[[i]] = sub_final.data_1
}

final.data_1 = do.call("rbind", dat_list)
#但你可能會有疑問，這樣插補感覺很不可靠，畢竟病人隨著時間生化值會慢慢變化，我要插補的值應該是選擇找「天數最近的值」作為插補的依據。
#那這樣再考考你，你覺得應該怎麼做?
  
#遺漏值插補(3)
#關鍵其實是在sub_final.data_1的處理上，我們簡單點來拆解程式，並先找出不是na的位置在哪：
final.data_1 = final.data

levels.PATNUMBER = final.data_1[,1] %>% factor %>% levels
n.PATNUMBER = levels.PATNUMBER %>% length
levels.TESTNAME = colnames(final.data_1)[-c(1:2)]
n.TESTNAME = levels.TESTNAME %>% length

dat_list = list()

i = 1
sub_final.data_1 = final.data_1[final.data_1[,1] == levels.PATNUMBER[i],]
j = 1
value_pos = which(!is.na(sub_final.data_1[,levels.TESTNAME[j]]))
if (length(value_pos)!=0) {
  k = 1
  if (is.na(sub_final.data_1[k,levels.TESTNAME[j]])) {
    impute_seq = which.min(abs(value_pos - k))
    impute_pos = value_pos[impute_seq]
    sub_final.data_1[k,levels.TESTNAME[j]] = sub_final.data_1[impute_pos,levels.TESTNAME[j]]
  }
}
#這邊有個小坑，需要先確認value_pos的長度是否為0！

