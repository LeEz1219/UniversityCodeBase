function mydraw( x1,y1,d)
A=plot([x1-0.2,x1+0.2],[y1-0.2,y1-0.2],'r-','linewidth',2);
B=plot([x1-0.2,x1+0.2],[y1+0.2,y1+0.2],'r-','linewidth',2);
C=plot([x1-0.2,x1-0.2],[y1-0.2,y1+0.2],'r-','linewidth',2);
D=plot([x1+0.2,x1+0.2],[y1-0.2,y1+0.2],'r-','linewidth',2);
if d==1
    pause(1);
    delete(A);
    delete(B);
    delete(C);
    delete(D);
end


end

