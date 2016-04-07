function spokes=cresinspokes(n,nspokes,nframe)
% function spokes=cresinspokes(n,nspokes,nframe)
% Create sinusoidal spokes pattern
% n = array size (default = 200)
% nspokes = number of cycles (light/dark pairs of spokes) (default = 40)  
% nframe = number of pixels in dark boarder around edge (default = 10)
% J.R. Fienup 11/11/08

if exist('nframe')~=1, nframe = 20; end
if exist('nspokes')~=1, nspokes=40; end
if exist('n')~=1, n=200; end
ndc=fix(n/2)+1;
x=[1:n]-ndc;
[X,Y]=meshgrid(x,x);
ang=atan2(Y,X);
ang=nspokes*ang;
spokes=1 + sin(ang);

if nframe ~= 0,
    box=zeros(n,n);
    box(nframe+1:n-nframe,nframe+1:n-nframe)=ones(n-2*nframe,n-2*nframe);
    spokes=spokes.*box;
end