function ce0202

	x0=0;
	y0=0;
	n_iter=100;
	b=-0.3;
	
	a_values=0:0.001:2.2;
	x_sink=zeros(50,length(a_values));
	
	for i=1:length(a_values)
		a=a_values(i)
		orbit=zeros(2,n_iter);
		orbit(1,1)=x0;
		orbit(2,1)=y0;
		divergent=0;
		for j=2:n_iter
			result=henon(orbit(:,j-1),a,b);
			if (any(abs(result)>10000))
				divergent=1;
				break;
			end
			orbit(:,j)=result';				
		end
		if (divergent==0)
			for k=0:1:j/2-1
				period=orbit(:,j-k:j)
				next_period=orbit(:,j-2*k-1:j-k-1);
				%disp(orbit(:,j-2*k-1:j-k-1));
				%pause;
				if (all(abs(period-next_period)<[0.01; 0.01]) || all(abs(period-flip(next_period))<[0.01; 0.01]))
					x_sink(1:length(period),i);
					x_sink(1:length(period),i)=period(1,:);
					break;
				end
			end
			if (k=j/2-1)
				x_sink(1:length(period),i)=period(1,:);
			end
		end
	end
	x_sink
	plot(a_values,x_sink, '.');
	xlabel('a');
	ylabel('x');
endfunction