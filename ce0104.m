function ce0104
  
  nmax=50;
  x0=[0.3 0.31 0.301];
  
  y=zeros(nmax,1+length(x0));
  y(1,:)=[0 x0];
  for i=2:1:nmax
    y(i,1)=i-1;
    for j=1:1:length(x0)
      
      y(i,j+1)=g(y(i-1,j+1));
    end
  end
  plot(y(:,1),y(:,2:end));
  ylabel('g(x)');
  xlabel('x');
endfunction
function y=g(x)
  y=4*x*(1-x);
endfunction