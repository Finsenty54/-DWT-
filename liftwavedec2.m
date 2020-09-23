function imgwave=liftwavedec2(image,m,n)
img=image;
M=m;
for i=1:n
    imgwave1=lwavedec2(img,M);
    imgwave(1:M,1:M)=imgwave1;
    M=M/2;
    img=imgwave1(1:M,1:M);
end

%% ����С���任
function f_row=lwavedec2(image,N)
f=image;
T=N/2;               %  ��ͼ��ά��


%%%%   1.�б任

%  A.���ѣ���ż�ֿ���

f1=f(1:2:N-1,:);  %  ����
f2=f(2:2:N,:);    %  ż��


%  B.Ԥ��

for i_hc=1:T
    high_frequency_column(i_hc,:)=f1(i_hc,:)-f2(i_hc,:);
end

%  C.����

for i_lc=1:T
    low_frequency_column(i_lc,:)=f2(i_lc,:)+floor(1/2*high_frequency_column(i_lc,:));
end

%  D.�ϲ�
f_column(1:1:T,:)=low_frequency_column(1:T,:);
f_column(T+1:1:N,:)=high_frequency_column(1:T,:);

%%%%   2.�б任

%  A.���ѣ���ż�ֿ���

f1=f_column(:,1:2:N-1);  %  ����
f2=f_column(:,2:2:N);    %  ż��


%  B.Ԥ��

for i_hr=1:T
    high_frequency_row(:,i_hr)=f1(:,i_hr)-f2(:,i_hr);
end


%  C.����

for i_lr=1:T
    low_frequency_row(:,i_lr)=f2(:,i_lr)+floor(1/2*high_frequency_row(:,i_lr));
end

%  D.�ϲ�
f_row(:,1:1:T)=low_frequency_row(:,1:T);
f_row(:,T+1:1:N)=high_frequency_row(:,1:T);