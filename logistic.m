function logistic
  
  niter=1000;
  x0=0.3;
  a=[1:0.001:4];
  p=zeros(length(a),niter);
  for j=1:1:length(a)
    y=zeros(1,niter);
    y(1)=x0;
    for i=2:1:niter
      y(i)=g(y(i-1),a(j));
    endfor
	y;
    cp=poles(y);
    for k=1:1:length(cp)
      p(j,k)=cp(k);
    endfor
  endfor
  plot(p)
  ylabel('a')
  xlabel('poles')
endfunction
function y=g(x,a)
  y=a*x*(1-x);
endfunction
function p=poles(y)
  p=y;
  for w=1:1:min(floor(length(y)/2),20)
    d=sum(y(length(y)-w:end).-y(length(y)-w-w-1:length(y)-w-1));
    if (d<=0.01)
      p=y(length(y)-w:length(y));
      break
    endif
  endfor
endfunction
