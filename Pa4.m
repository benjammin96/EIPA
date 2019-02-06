nx=50;
ny=50;
V=zeros(1,nx*ny);
G=sparse(nx*ny,nx*ny);

for i= 1:nx
    for j=1:ny
            n=j+(i-1)*ny;
            
            nxm= j+(i-2)*ny;
            nxp=j+(i)*ny;
            nyp=j+1 +(i-1)*ny;
            nym = j-1 +(i-1)*ny;

        if i==1
            G(n,n)=1;
        elseif i==nx
            G(n,n)=1;
        elseif j ==1
            G(n,n)=1;    
        elseif j==ny
            G(n,n)=1;
        else 
            if (i>10 && i<20 && j>10 &&j<20)
                G(n,n)=-2;
            
            else
            G(n,n)=-4;
            end
            
            G(n,nxm)=1;
            G(n,nxp)=1;
            G(n,nym)=1;
            G(n,nyp)=1;
        end
    end
end
        
spy(G)

[E,D]=eigs(G,9,'SM');

for t=1:9
    for i = 1:nx
        for j=1:ny   
        n=j+(i-1)*ny;   
        z(i,j) =E(n,t);
       
        end
    end
    surf(z)
    pause(1)
end






       