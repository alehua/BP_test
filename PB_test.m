% n=2.m=3
% 5 个输入，1个输出
% y(n)=u(n)+u(n-1)+u(n-2)+y(n-1)+y(n-2)
load('PEA.mat.mat');
% plot(U,Y)
%step 1归一化 运算到-1到1之间
[input,ps1]=turnone(U);
[output,ps2]=turnone(Y);

%step 3 输出数据
output_data = output(3:end,:);
%step 2 输入数据
input1=input(3:end,:);
input2=input(2:end-1,:);
input3=input(1:end-2,:);
input4=output(2:end-1,:);
input5=output(1:end-2,:);
input_data=[input1;input2;input3;input4;input5];

%step 网络参数
net=newff(input_data,output_data,10,{'tansig','purelin'},'trainlm');
net.trainParam.epochs=10000;%最大训练次数
net.trainParam.goal=0.01;%目标最小误差
net.trainParam.lr=0.01;%学习速率
% 网络训练
net=train(net,input_data,output_data);