% n=2.m=3
% 5 �����룬1�����
% y(n)=u(n)+u(n-1)+u(n-2)+y(n-1)+y(n-2)
load('PEA.mat.mat');
% plot(U,Y)
%step 1��һ�� ���㵽-1��1֮��
[input,ps1]=turnone(U);
[output,ps2]=turnone(Y);

%step 3 �������
output_data = output(3:end,:);
%step 2 ��������
input1=input(3:end,:);
input2=input(2:end-1,:);
input3=input(1:end-2,:);
input4=output(2:end-1,:);
input5=output(1:end-2,:);
input_data=[input1;input2;input3;input4;input5];

%step �������
net=newff(input_data,output_data,10,{'tansig','purelin'},'trainlm');
net.trainParam.epochs=10000;%���ѵ������
net.trainParam.goal=0.01;%Ŀ����С���
net.trainParam.lr=0.01;%ѧϰ����
% ����ѵ��
net=train(net,input_data,output_data);