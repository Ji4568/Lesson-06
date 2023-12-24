###練習1：讀取圖片及顯示圖片
#學會運用套件後，我們了解到R可以透過套件的擴充它的性能，在此之前我們完全沒辦法想像要怎樣把圖片讀進R裡面，現在請你隨便找一張圖像檔案，並試著從網路上找找看要怎樣讀檔以及顯示圖片！
#透過Google搜尋「R display image」後，你將可以找到這個頁面，其中第一個連結進去後你會發現這裡已經有人發問和回答了：
#請試著利用它所提供的方式讀取及顯示圖片吧！
###練習1答案

#你應該會找到，關鍵的套件是「jpeg」，而裡面的函數「readJPEG」可以把圖讀進來：
library("jpeg")
img <- readJPEG(system.file("img", "Rlogo.jpg", package = "jpeg"))
plot(0:1, 0:1, type = "n", ann = FALSE, axes = FALSE)
rasterImage(img, -0.04, -0.04, 1.04, 1.04)
