function ce11
  
  x0=0:0.1:1.0;
  n=20;
  m=length(x0);
  
  x=zeros(m,n);
  y=zeros(m,n);
  for j=1:m
    x(j,1)=x0(j);
    y(j,1)=g(x0(j));
    for i=2:n
      x(j,i)=y(j,i-1);
      y(j,i)=g(x(j,i));
    end
  end
  x
  y
  plot(x,y);
endfunction
function retval=g(prev)
  retval=2*prev*(1-prev);
endfunction

