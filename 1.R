###第一節：快速讀寫檔案(1)
#在這節課之前，我們使用的函數種類相當有限，但我們也在之前的範例中發現了不同程式碼執行同樣的事情在速度上有顯著的不同。
#不同的主因其實牽涉到程式碼執行過程，但目前我們的知識很有限，做出來就不容易了更別說還要求速度快，因此比較可行的方式是去「抄」程式碼！
#在讀取檔案的部分，我們這裡先介紹一個特別的套件：data.table，它裡面有眾多協助我們加速處理大量資料的函數

#快速讀寫檔案(2)
#至於安裝套件的方法，假設你是用Rstudio，可以看到右下角有個Packages分頁，點選後你能看到Install按鍵，透過這種方式就能安裝套件了
#假設你是使用一般的R程式，可以在Console地方打上這個指令：
install.packages("data.table")
#安裝完成後，未來我們要使用這個套件只要打上這串指令：
library(data.table)

#快速讀寫檔案(3)
#讓我們來體驗一下data.table套件內一個神奇的函數：「fread」，它可以以數倍的速度讀取一個csv檔案：
#至於大Data在哪，我們可以使用第五節課用到的大檔案，請在這裡下載。
#這是使用「read.csv」讀取的速度：
t0 = Sys.time()
dat1 = read.csv('data3_4.csv', header = TRUE, fileEncoding = 'CP950')
Sys.time() - t0

#這是使用「fread」讀取的速度：
t0 = Sys.time()
dat2 = fread('data3_4.csv', header = TRUE)
Sys.time() - t0

#快速讀寫檔案(4)
#比較討厭的地方在使用「fread」讀取進來的物件格式是「data.table」，這是一個 新的物件格式。
class(dat1)
class(dat2)

#解決這個問題的方式是在使用「fread」的時候多給一個參數：
t0 = Sys.time()
dat2 = fread('data3_4.csv', header = TRUE, data.table = FALSE)
Sys.time() - t0

class(dat2)

#快速讀寫檔案(5)
#但現在兩者還不完全一樣，問題出在哪呢?
all.equal(dat1, dat2)

#原來是使用「read.csv」有另一個參數「stringsAsFactors」，預設是TRUE，但使用「fread」的時候預設卻是FALSE，所以我們再改變一下：
dat1 = read.csv('data3_4.csv', header = TRUE, stringsAsFactors = FALSE, fileEncoding = 'CP950')
#這樣兩者就完全一樣了
all.equal(dat1, dat2)

#快速讀寫檔案(6)
#除了讀取檔案之外，寫出檔案也可以使用「fwrite」函數進行加速：
#這是使用「write.csv」寫出的速度：

t0 = Sys.time()
write.csv(dat1, 'data3_4(1).csv', row.names = FALSE, quote = TRUE)
Sys.time() - t0

#這是使用「fwrite」寫出的速度：

t0 = Sys.time()
fwrite(dat2, 'data3_4(2).csv', row.names = FALSE, quote = TRUE)
Sys.time() - t0


