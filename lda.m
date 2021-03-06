function [A,B,w,cost] = lda(class1,class2) %Performs Linear Discriminant Analysis on class1 and class2
dim1=size(class1); 
dim2=size(class2);       %Generates vectors of X and Y dimensions that uncovers the size of the data set
n1=dim1(1);
n2=dim2(1);              %Equal to the number of data points per data matrix
S1=(n1-1)*cov(class1);
S2=(n2-1)*cov(class2);   %Scatter Matrices for each class
SW=S1+S2;
w=inv(SW)*(mean(class1)-mean(class2))'; %Optimal value of projection vector
%w=SW\(mean(class1)-mean(class2))';
A=class1*w;
B=class2*w;
SB=(mean(class1)-mean(class2))'*(mean(class1)-mean(class2));
cost=(w'*SB*w)/(w'*SW*w);