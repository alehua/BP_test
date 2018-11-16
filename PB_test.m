% n=2.m=3
% 5 个输入，1个输出
% y(n)=u(n)+u(n-1)+u(n-2)+y(n-1)+y(n-2)
clc
load('PEA.mat.mat');
% plot(U,Y)
%step 1归一化 运算到-1到1之间
[input,ps1]=turnone(U);
[output,ps2]=turnone(Y);

%step 3 输出数据
output_data = output(3:end,:)';
%step 2 输入数据
input1=input(3:end,:);
input2=input(2:end-1,:);
input3=input(1:end-2,:);
input4=output(2:end-1,:);
input5=output(1:end-2,:);
input_data=[input1,input2,input3,input4,input5]';

% % step 网络参数
% net=newff(input_data,output_data,10,{'tansig','tansig'},'trainlm');
% net.trainParam.epochs=10000;%最大训练次数
% net.trainParam.goal=0.00001;%目标最小误差
% net.trainParam.lr=0.000001;%学习速率
% % 网络训练
% net=train(net,input_data,output_data);


% 网络测试
test_input1 = input_data(:,9000:9999);
test_input2 = input_data(:,38000:38999);
test_result1 = sim(net,test_input1);test_result2 = sim(net,test_input2);
input = U';output=Y';
result_input1 = input(:,9000:9999);
result_input2 = input(:,38000:38999);
tar1 = output(:,9000:9999);
tar2 = output(:,38000:38999);
reslut_out1 = resturnone(test_result1,ps2);
reslut_out2 = resturnone(test_result2,ps2);
figure(1)
plot(result_input1,tar1,'b',result_input2,tar2,'b')
hold on
plot(result_input1,reslut_out1,'r',result_input2,reslut_out2,'r')

hold off
figure(2)
err1 = abs(reslut_out1-tar1);
err2 = abs(reslut_out2-tar2);
plot(result_input1,err1)
figure(3)
plot(result_input2,err2)





