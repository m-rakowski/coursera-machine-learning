function displayOneRow(X,rowNumber)


  imageToPrint = X(1,1:20);
  
  for i = 41:20:401
    imageToPrint = [imageToPrint ; X(rowNumber,i-20:i-1) ];
    
  end
  
  colormap(gray);
  imagesc(imageToPrint);  
end