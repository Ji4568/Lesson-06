###�m��1�GŪ���Ϥ�����ܹϤ�
#�Ƿ|�B�ήM���A�ڭ̤F�Ѩ�R�i�H�z�L�M���X�R�����ʯ�A�b�����e�ڭ̧����S��k�Q���n��˧�Ϥ�Ū�iR�̭��A�{�b�ЧA�H�K��@�i�Ϲ��ɮסA�øյ۱q�����W���ݭn���Ū�ɥH����ܹϤ��I
#�z�LGoogle�j�M�uR display image�v��A�A�N�i�H���o�ӭ����A�䤤�Ĥ@�ӳs���i�h��A�|�o�{�o�̤w�g���H�o�ݩM�^���F�G
#�иյۧQ�Υ��Ҵ��Ѫ��覡Ū������ܹϤ��a�I
###�m��1����

#�A���ӷ|���A���䪺�M��O�ujpeg�v�A�Ӹ̭�����ơureadJPEG�v�i�H���Ū�i�ӡG
library("jpeg")
img <- readJPEG(system.file("img", "Rlogo.jpg", package = "jpeg"))
plot(0:1, 0:1, type = "n", ann = FALSE, axes = FALSE)
rasterImage(img, -0.04, -0.04, 1.04, 1.04)