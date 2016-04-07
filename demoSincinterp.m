%demoSincInterp.m% Nyquist sampling demo% J.R. Fienup 9/14/04% Compute an "object" that is band-limitedosr=10;n1=40;n=n1*osr;rand('state',0);g=rand(1,n);aper=zeros(1,n);aper(1:n1+1)=ones(1,n1+1);aper=shiftwrap(aper,0,-fix(n1/2));gbl=real(ifftn(fftn(g).*aper));figure(1);plot(gbl,'r');axis([0 n 0 .8])ipr=real(ifftn(aper));figure(2);plot(fftshift(ipr))% Compute the sampled image (oversampled case)mask=zeros(1,n);mask(1:osr-2:n)=ones(1,length([1:osr-2:n]));gs=gbl.*mask;figure(3);plot(1:n,gs,'*',1:n,gs,1:n,gbl,'r');% Compute the sinc-interpolated reconstruction from the sampled image% Use Fourier product to do convolutiongrec=real(ifftn(fftn(gs).*fftn(ipr)));grec=grec*(sum(gbl(:))/sum(grec(:))); % normalize to have same average valuefigure(4); plot(1:n,gbl,'r',1:n,grec,'b');axis([0 n 0 .8])% Repeat, for undersampled casemask=zeros(1,n);mask(1:osr+2:n)=ones(1,length([1:osr+2:n]));gs=gbl.*mask;figure(5);plot(1:n,gs,'*',1:n,gs,1:n,gbl,'r');grec=real(ifftn(fftn(gs).*fftn(ipr)));grec=grec*(sum(gbl(:))/sum(grec(:)));figure(6); plot(1:n,gbl,'r',1:n,grec,'b');axis([0 n 0 .8])