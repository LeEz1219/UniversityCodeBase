    diary lab1_output
    diary on
    %How to define a matrix?
    A= [10 2 3; 4 50 6; 7 8 9]
    
    %Given a matrix, how to retrieve the matrix size (number of rows and number of columns)?
    [r, c]= size(A)
    
    %How to get the inverse of a matrix?
    inv_A = inv(A)
    
    %How to get the Eigen values and Eign vectors of a square matrix? Show it.
    [EVector, Evalue]= eig(A)
    %Given mXm matrix A and mX1 vector b, how to solve x in Ax=b?
    b= [3.5 1.7 2.9]';
    c= linsolve(A, b);
   
    %How to add comments in Matlab?
    %add the notation "%" in front of each comment lines.
   
    %How to take user’s input in m-file?
     prompt = 'What is the original value? '
     x = input(prompt)
    %How to set a breakpoint in m-file? For example, set a breakpoint in line 3.
    %To set a standard breakpoint click the breakpoint alley at an executable line where you want to set the breakpoint. 
    %The breakpoint alley is the narrow column on the left side of the Editor, to the right of the line number. 
    %You also can use the F12 key to set the breakpoint.
    
    %How to check intermediate result of a variable (e.g. x) when program runs to line i (e.g. line 10)?
    x= line_num;
    line_num= 10;
 
    disp(x)
    %How to plot y=sin(x) for x between 0-2Pi with increment pi/10?
    x = (0 :pi/10: 2*pi);
    y = sin(x);
    plot(x,y)
    %In above plot, add axis labels in the plot.
    xlabel('x')
    ylabel('sin(x)')
    %Change color of line in the plot to red.
    plot(x, y, 'r')
    %Show the dots in the plot with marker ‘*’.
    plot(x, y, '*')
    %Decrease the increment from pi/10 to pi/20 and re-plot.
    x = (0 :pi/20: 2*pi);
    y = sin(x);
    plot(x,y)
    %Graph cos(x) and sin(x) functions in one figure with different colors and add a legend for the graphs.
    x = (0: pi/20: 2*pi);
    y1 = sin(x);
    y2 = cos(x);
    plot(x,y1, 'r', x, y2, 'g')
    legend('sin(x)', 'cos(x)')
  
    diary off
    
