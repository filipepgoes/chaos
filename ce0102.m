function ce0102
  
  nmax=15;
  x0=[0.2 0.5 0.95];
  
  y=zeros(nmax,1+length(x0));
  y(1,:)=[0 x0];
  for i=2:1:nmax
    y(i,1)=i-1;
    for j=1:1:length(x0)
      
      y(i,j+1)=g(y(i-1,j+1));
    end
  end
  y  
endfunction
function y=g(x)
  y=3.3*x*(1-x);
endfunction
