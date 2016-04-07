clear;
n = 5;
w = 3;
aper=zeros(n,n);

for k=1:w
	aper(k,(w-(k-1)):w)=ones(1,k);
end