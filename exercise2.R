###�m��2�G�ǲ߬ݬݻ������Ʊ�
#�ڭ̥���ͤƭȳ��ন�Ʀr�榡�G
for (i in 1:n.TESTNAME) {
  final.data[,i+2] = as.numeric(final.data[,i+2])
}
#���M�ڭ̤w�g�Ƿ|�F�D�`�h��ƳB�z���޳N�A���ڭ̤]�`�`�F�Ѩ�ϥήM���a���ڭ̪��[�t�O�D�`��۪��A�ڭ̨Ӭd�d���`�H�a����˰���ƳB�z�C
#�A���άd�ܤ[�A�N�|�o�{���ӮM��s���udplyr�v�A�ڭ̵o�{�j�a������w�γo�ӮM��Ӱ���ƳB�z�G
#���]�ڭ̷Q���X�t�C���n�G
final.data_1 = final.data
final.data_1[,"Cap"] = final.data_1[,"Total Calcium"] * final.data_1[,"IP"]
head(final.data_1)
#�b�J�Ӿ\Ū������A�ڭ̵o�{���ӡumutate�v��ơA�L�వ��ڭ̷Q�����Ʊ��A�{�b�ЧA�յۨϥ�mutate��ƨӰ��X�t�C���n�I

###�m��2����
#�A���ӷ|�o�{�A�p�G�n��Creatinine�MNa�����n�A�i�H�ΤU���o�ӻy�k�G
library(dplyr)
final.data_1 = final.data
final.data_1 %<>% mutate(CrNa = Creatinine * IP)
#���O�p�G�n���X�t�C���n�A�h�n����W�r�G
colnames(final.data_1)[18] = 'Total_Calcium'
final.data_1 %<>% mutate(Cap = Total_Calcium * Na)

