function output=spinave461(f)
%function output=spinave461(f)
%Puts spin (angular) average of square array (about center) into output
%Note: index is true index +1 (so zero radius is 1)
% Presently only works properly for square array with an even number of pixels
% J.R. Fienup 11/14/10

[nr,nc]=size(f);
nrdc=fix(nr/2)+1; ncdc=fix(nc/2)+1;
r=[1:nr]-nrdc; c=[1:nc]-ncdc;
[R,C]=ndgrid(r,c);
[R,C]=meshgrid(r,c);
index=round(sqrt(R.^2 + C.^2))+1;


maxindex=max(index(:));
sumf=zeros(1,maxindex);
count=zeros(1,maxindex);
% here comes the really slow part, since it is not vectorized:
for ri=1:nr, for ci=1:nc,
  sumf(index(ri,ci))=sumf(index(ri,ci))+f(ri,ci);
  count(index(ri,ci))=count(index(ri,ci))+1;
end;end

for ni=1:maxindex,
 if count(ni)~=0., output(ni)=sumf(ni)/count(ni);
 else output(ni)=0.;
 end
end

returnend