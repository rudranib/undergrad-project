function [precision,recall,accuracy] = printClassMetrics (pred_val , yval)

  accuracy = (mean(double(pred_val == yval)))*100;
 
  actual_positives = sum(yval == 1);
  actual_negatives = sum(yval == 0);
  true_positives = sum((pred_val == 1) & (yval == 1));
  false_positives = sum((pred_val == 1) & (yval == 0));
  false_negatives = sum((pred_val == 0) & (yval == 1));
  precision = 0; 
  if ( (true_positives + false_positives) > 0)
    precision = (true_positives / (true_positives + false_positives))*100;
  end

  recall = 0; 
  if ( (true_positives + false_negatives) > 0 )
    recall = (true_positives / (true_positives + false_negatives))*100;
  end

  %F1 = 0; 
  %if ((precision+recall)>0) 
   % F1 = 2*precision*recall/(precision+recall);
  %end
 
  if (1) 
    %fprintf('true_positives == %i (actual positive =%i) \n',true_positives,actual_positives);
    %fprintf('false_positives == %i \n',false_positives);
    %fprintf('false_negatives == %i \n',false_negatives);
   % fprintf('precision == %f \n',precision);
    %fprintf('recall == %f \n',recall);
    %fprintf('F1 == %f \n',F1);
  end 
  
  end
  
