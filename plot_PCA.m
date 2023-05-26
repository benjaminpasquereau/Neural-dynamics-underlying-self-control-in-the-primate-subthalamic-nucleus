% load beta values for reward amd delay encoding calculated from the GLM (n=231 neurons)
% data is calculated with non-overlapped windows of 100-ms
load data_betas
 
%PCA with beta values
matrix_pca = [beta_rew beta_del]; %35 bins x 2
[coeff,score,latent,tsquared,explained,mu] = pca(matrix_pca);

%Percent of variance explained by PCs
figure
plot(cumsum(explained),'k','Linewidth', 3)
xlim([0 20])
ylim([0 100])
hold on
plot([1 1], [0 explained(1)], 'c--')
plot([0 1],[explained(1) explained(1)],'c--')
plot([2 2], [0 sum(explained(1:2))], 'r--')
plot([0 2],[sum(explained(1:2)) sum(explained(1:2))],'r--')
plot([3 3], [0 sum(explained(1:3))], 'g--')
plot([0 3],[sum(explained(1:3)) sum(explained(1:3))],'g--')
plot([4 4], [0 sum(explained(1:4))], 'color', [1 0.839 0], 'LineStyle', '--')
plot([0 4],[sum(explained(1:4)) sum(explained(1:4))],'color', [1 0.839 0], 'LineStyle', '--')
xlabel('# of components')
ylabel('Cumulative variance (%)')


%Plot data for each PC (vectors, magnitudes, angles)
figure
subplot (3,4,1) 
col_r = [1:-1/35:0]';
colorplot = [zeros(length(col_r),1) col_r col_r];

for yy = 1:35
  iii = round(yy/1.2)+1;
  hold on  
  quiver (0, 0, coeff(yy,1), coeff(yy+35,1), 'Color', colorplot(iii,:))  
end
  
  plot([0 0],[-0.33 0.33],'k--')
  plot([-0.33 0.33],[0 0],'k--')
  axis equal
  xlim([-0.33 0.33])
  ylim([-0.33 0.33])
  title('PC1')

 subplot (3,4,5)
 hold on
 for yy = 1:35
     iii = round(yy/1.2)+1;  
     hold on  
     c(yy) = hypot(coeff(yy,1), coeff(yy+35,1)); 
     scatter(Time(yy), c(yy), [], colorplot(iii,:), 'filled')
 end
    xlim([0 3.5])
    ylim([0 0.4])
    ylabel('vector magnitude')
     
 subplot (3,4,9)   
 for yy = 1:35   
     iii = round(yy/1.2)+1;     
     teta(yy) = atan2d(coeff(yy+35,1), coeff(yy,1)); 
     hold on
     scatter(Time(yy), teta(yy), [], colorplot(iii,:), 'filled', 'd')
 end
     xlim([0 3.5])
     ylim([-180 180])
     ylabel('vector angle')
          
 subplot (3,4,2)
 col_r = [1:-1/35:0]';
 colorplot = [col_r zeros(length(col_r),1) zeros(length(col_r),1)];
 for yy = 1:35 
    iii = round(yy/1.2)+1;   
    hold on  
    quiver (0, 0, coeff(yy,2), coeff(yy+35,2), 'Color', colorplot(iii,:))
 end
  plot([0 0],[-0.33 0.33],'k--')
  plot([-0.33 0.33],[0 0],'k--')
  axis equal
  xlim([-0.33 0.33])
  ylim([-0.33 0.33])
  title('PC2')

 subplot (3,4,6)
 for yy = 1:35
     iii = round(yy/1.2)+1; 
     hold on
     c(yy) = hypot(coeff(yy,2), coeff(yy+35,2));   
     scatter(Time(yy), c(yy), [], colorplot(iii,:), 'filled')
 end
    xlim([0 3.5])
    ylim([0 0.4])
    ylabel('vector magnitude')
         
 subplot (3,4,10)   
 for yy = 1:35
     iii = round(yy/1.2)+1;    
     teta(yy) = atan2d(coeff(yy+35,2), coeff(yy,2)); 
     hold on
     scatter(Time(yy), teta(yy), [], colorplot(iii,:), 'filled', 'd')
 end
     xlim([0 3.5])
     ylim([-180 180])
     ylabel('vector angle')
         
subplot (3,4,3)
col_r = [1:-1/35:0]';
colorplot = [zeros(length(col_r),1) col_r zeros(length(col_r),1)];
 for yy = 1:35
     hold on  
     iii = round(yy/1.2)+1;  
     quiver (0, 0, coeff(yy,3), coeff(yy+35,3), 'Color', colorplot(iii,:))
 end
  plot([0 0],[-0.33 0.33],'k--')
  plot([-0.33 0.33],[0 0],'k--')
  axis equal
  xlim([-0.33 0.33])
  ylim([-0.33 0.33])
  title('PC3')

 subplot (3,4,7)
 for yy = 1:35
       iii = round(yy/1.2)+1; 
       hold on
       c(yy) = hypot(coeff(yy,3), coeff(yy+35,3));   
       scatter(Time(yy), c(yy), [], colorplot(iii,:), 'filled')
  end
    xlim([0 3.5])
    ylim([0 0.4])
    ylabel('vector magnitude')
    
 subplot (3,4,11)  
  for yy = 1:35
      iii = round(yy/1.2)+1;
      teta(yy) = atan2d(coeff(yy+35,3), coeff(yy,3)); 
      hold on
      scatter(Time(yy), teta(yy), [], colorplot(iii,:), 'filled', 'd')
  end
     xlim([0 3.5])
     ylim([-180 180])
     ylabel('vector angle')     
     
subplot (3,4,4)
col_r = [1:-1/35:0]';
colorplot = [col_r col_r zeros(length(col_r),1)];
 for yy = 1:35
    hold on
    iii = round(yy/1.2)+1;
    quiver (0, 0, coeff(yy,4), coeff(yy+35,4), 'Color', colorplot(iii,:))
 end
  plot([0 0],[-0.33 0.33],'k--')
  plot([-0.33 0.33],[0 0],'k--')
  axis equal
  xlim([-0.33 0.33])
  ylim([-0.33 0.33])
  title('PC4')
  
 subplot (3,4,8)
 for yy = 1:35
    hold on
    iii = round(yy/1.2)+1;
    c(yy) = hypot(coeff(yy,4), coeff(yy+35,4));  
    scatter(Time(yy), c(yy), [], colorplot(iii,:), 'filled')
 end
    xlim([0 3.5])
    ylim([0 0.4])
    ylabel('vector magnitude')

 subplot (3,4,12)   
 for yy = 1:35
     iii = round(yy/1.2)+1;   
     teta(yy) = atan2d(coeff(yy+35,4), coeff(yy,4)); 
     hold on
     scatter(Time(yy), teta(yy), [], colorplot(iii,:), 'filled', 'd')
 end
     xlim([0 3.5])
     ylim([-180 180])
     ylabel('vector angle')     
     
     clear all
     
     