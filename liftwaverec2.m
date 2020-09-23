 function imgwave=liftwaverec2(image,m,n)
 M=m/(2^n);
 imgwave=image;
 for i=n:-1:1
     M=M*2;
     img=imgwave(1:M,1:M);
     imgwave1=lwaverec2(img,M);
     imgwave(1:M,1:M)=imgwave1;
 end


function f_column=lwaverec2(f_row,N)
T=N/2;


%%%%   1.�б任

%   A.����

f1=f_row(:,T+1:1:N);  %  ����
f2=f_row(:,1:1:T);    %  ż��



%  B.����

for i_lr=1:T
    low_frequency_row(:,i_lr)=f2(:,i_lr)-floor(1/2*f1(:,i_lr));
end

%  C.Ԥ��

for i_hr=1:T
    high_frequency_row(:,i_hr)=f1(:,i_hr)+low_frequency_row(:,i_hr);
end



%  D.�ϲ�(��ż�ֿ��ϲ�)
f_row(:,2:2:N)=low_frequency_row(:,1:T);
f_row(:,1:2:N-1)=high_frequency_row(:,1:T);


%%%%   2.�б任

%  A.����

f1=f_row(T+1:1:N,:);  %  ����
f2=f_row(1:1:T,:);    %  ż��


%  B.����

for i_lc=1:T
    low_frequency_column(i_lc,:)=f2(i_lc,:)-floor(1/2*f1(i_lc,:));
end

%  C.Ԥ��

for i_hc=1:T
    high_frequency_column(i_hc,:)=f1(i_hc,:)+low_frequency_column(i_hc,:);
end


%  D.�ϲ�(��ż�ֿ��ϲ���
f_column(2:2:N,:)=low_frequency_column(1:T,:);
f_column(1:2:N-1,:)=high_frequency_column(1:T,:);
    
