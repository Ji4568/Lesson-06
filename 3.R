###�ĤT�`�G��|�ȴ���(1)
#�b��誺��Ƥ��A�A���Ӧ��`�N�찲�]�ڷQ�p��t�C���n�A���ե��o�P�ɦ��t�H���C��ӫ��СA�����]�P�@�ѥu�����C�A�ӨS�����t�O?
#�b�o�̡A�ڭ̭n���п�|�ȴ��ɪ��޳N�A�Ӯھڤ��P����ƫ��A�|��ܤ��P����k�A�H�ڭ̪���Ƭ��ҡA�ѩ�̭������P���ӮסA�ҥH�ڭ̴��ɪ��̾ڴN�O�u��C�ӤH�������v�ɤW�h�C
#�o�Ӱ��D���N�O�n�@�ӤH�@�ӤH���A�ڭ̦P�˪��A���l��ơA�������ݭn�Ψ��ơumean�v�G
final.data_1 = final.data
levels.PATNUMBER = final.data_1[,1] %>% factor %>% levels
n.PATNUMBER = levels.PATNUMBER %>% length

i = 1
sub_final.data_1 = final.data_1[final.data_1[,1] == levels.PATNUMBER[i],]
sub_final.data_1[is.na(sub_final.data_1[,'IP']),'IP'] = mean(sub_final.data_1[,'IP'], na.rm = TRUE)
#�o��A����Ҥ@�U�A�ڭn�p���o�˪��L�{�X�i���������ƤW��?
  