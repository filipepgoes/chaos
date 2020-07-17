function ce0201

	x_initials=-2.5:0.05:2.5;
	y_initials=-2.5:0.05:2.5;
	z_finals=zeros(length(x_initials));
	n_iter=1000;
	
	% For non chaotic
	a=1.28, b=-0.3
	likely_poles=[0.7618 0.5382]
	
	% For chaotic
	%a=1.4, b=-0.3
	%likely_poles=[0.28599   1.01401]
	
	for j=1:length(y_initials)
		for i=1:length(x_initials)
			x0=x_initials(i);
			y0=y_initials(j);
			x=zeros(n_iter,2);
			x(1,:)=[x0 y0];
			z=zeros(n_iter,2);
			for k=1:n_iter-1
				result=henon(x(k,:),a,b);
				z(k,:)=result;
				if (any(abs(result)>10000))
					z_finals(j,i)=1;
					break;
				end
				if ((all(abs(result-likely_poles)<[0.01 0.01])) || (all(abs(result-flip(likely_poles))<[0.01 0.01])))
					break;
				end
				x(k+1,:)=z(k,:);
			end
			disp(result);
			disp(k);
			%z(end,:)=henon(x(end,:),1.28,-0.3);

		end
	end
	z_finals
	contour(x_initials,y_initials,z_finals)
	xlabel('x')
	ylabel('y')
endfunction