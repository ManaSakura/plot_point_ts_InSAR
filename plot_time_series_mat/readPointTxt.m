function [date,value]=readPointTxt(filename)
%   ��ȡʱ������ͼ�е�ʱ����α��ۻ���ֵ�������date��value�У���ȡ�����ļ�(һ���㣩
% filename='G:\InSAR Function\point\alt point\p231_201.txt';
rows=getrow(filename);
date=zeros(rows,1);%����
value=zeros(rows,1);%�α���ֵ
fid=fopen(filename,'r');
head_index=0;
tline=fgetl(fid);
while head_index<8
    head_index=head_index+1;
    tline=fgetl(fid);
end
index=1;
while ~feof(fid)
    tline = fgetl(fid);
    date1=tline(7:16);
    date2=str2double(date1(1:4))+(str2double(date1(6:7))-1)/12+str2double(date1(9:10))/365;
    date(index,:)=date2;
    value1=tline(63:74);
    value(index,:)=str2double(value1);
    index=index+1;
end
fclose(fid);

