###�ĤG�`�G�W�[�{���iŪ��(1)
#�bR�̭��ڭ̸g�`�|�ϥΨ�զX��ơA���O���ϧڭ̷Q�n���D�ͤƭȪ��ƶq�@���X���A�ڭ̥i�H�z�L�U���o�ؤ�k�o���G
length(levels(factor(dat1$TESTNAME)))

#�ӳo�˵{���g�_�ӷ|�ܽ����A����n���覡���ӬO�o�ˡG
factorized_TESTNAME = factor(dat1$TESTNAME)
lvl_TESTNAME = levels(factorized_TESTNAME)
length(lvl_TESTNAME)
#���o�˦bR�̭��|�B�~�x�s�ܦh�U������A�åB�|��C�B��t�סA�]���p��b�{���iŪ�ʻP����t�פW�����ũO?
  
#�W�[�{���iŪ��(2)
#�o�̧ڭ̤��Хt�@�ӮM��umagrittr�v�A���֦��@�ӯS�����B��Ÿ��u%>%�v�A�\��O��q����k�̧ǰ������
#�᭱��ƪ��u.�v�N���W�@�B�����G
library(magrittr)
n.TESTNAME = dat1$TESTNAME %>% factor %>% levels %>% length
n.TESTNAME

n.TESTNAME = dat1$TESTNAME %>% factor() %>% levels() %>% length()
n.TESTNAME

n.TESTNAME = dat1$TESTNAME %>% factor(.) %>% levels(.) %>% length(.)
n.TESTNAME

#������ݭn�u.�v�o�ؤ覡�O�A�o�O�]�����ϧA����ƻݭn���O�ѼơA���i�H�z�L�o�ؤ覡�Ӽg�X�G
f = function(x, a, b) {a*x^2 + b}
1:5 %>% f(., 2, 5)

1:5 %>% f(2, ., 5)

1:5 %>% f(2, 5, .)

