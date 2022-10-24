load data_betas

matrix_pca = [beta_rew beta_del]; %190 bins x 2 series of beta values for 231 neurons
[coeff,score,latent,tsquared,explained,mu] = pca(matrix_pca);

figure
subplot(2,2,1)
plot(cumsum(explained),'k','Linewidth', 3)
xlim([0 15])
ylim([0 100])
hold on
plot([1 1], [0 explained(1)], 'b--')
plot([0 1],[explained(1) explained(1)],'b--')
plot([2 2], [0 sum(explained(1:2))], 'r--')
plot([0 2],[sum(explained(1:2)) sum(explained(1:2))],'r--')
plot([3 3], [0 sum(explained(1:3))], 'g--')
plot([0 3],[sum(explained(1:3)) sum(explained(1:3))],'g--')
plot([4 4], [0 sum(explained(1:4))], 'color', [1 0.839 0], 'LineStyle', '--')
plot([0 4],[sum(explained(1:4)) sum(explained(1:4))],'color', [1 0.839 0], 'LineStyle', '--')
xlabel('# of components')
ylabel('Cumulative variance (%)')



figure
subplot (3,4,1)
col = zeros(190,2);
blue = [0.2:(1-0.2)/189:1];
col = [col blue'];

  for yy = 1:190
    quiver (0, 0, coeff(yy,1), coeff(yy+190,1), 'Color', col(yy,:))
    hold on
  end
  plot([0 0],[-0.17 0.17],'k--')
  plot([-0.17 0.17],[0 0],'k--')
  axis equal
  xlim([-0.17 0.17])
  ylim([-0.17 0.17])
  title('1st cpt')

 subplot (3,4,5)
   for yy = 1:190
    c(yy) = hypot(coeff(yy,1), coeff(yy+190,1));    
    scatter(yy, c(yy), [], col(yy,:), 'filled')
    hold on
   end
    xlim([0 190])
    ylim([0 0.16])
    set(gca,'XTick',[]);
    ylabel('vector magnitude')
    
 subplot (3,4,9)   
    for yy = 1:190
     teta(yy) = atan2d(coeff(yy+190,1), coeff(yy,1)); 
     scatter(yy, teta(yy), [], col(yy,:), 'filled', 'd')
     hold on
    end
     xlim([0 190])
     ylim([-180 180])
     set(gca,'xtick',[]);
     ylabel('vector angle')
      
subplot (3,4,2)
col = zeros(190,2);
red = [0.2:(1-0.2)/189:1];
col = [red' col];

  for yy = 1:190
    quiver (0, 0, coeff(yy,2), coeff(yy+190,2), 'Color', col(yy,:))
    hold on
  end
  plot([0 0],[-0.17 0.17],'k--')
  plot([-0.17 0.17],[0 0],'k--')
  axis equal
  xlim([-0.17 0.17])
  ylim([-0.17 0.17])
  title('2nd cpt')

 subplot (3,4,6)
   for yy = 1:190
    c(yy) = hypot(coeff(yy,2), coeff(yy+190,2));    
    scatter(yy, c(yy), [], col(yy,:), 'filled')
    hold on
   end
    xlim([0 190])
    ylim([0 0.16])
    set(gca,'XTick',[]);
    ylabel('vector magnitude')
    
 subplot (3,4,10)   
    for yy = 1:190
     teta(yy) = atan2d(coeff(yy+190,2), coeff(yy,2)); 
     scatter(yy, teta(yy), [], col(yy,:), 'filled', 'd')
     hold on
    end
     xlim([0 190])
     ylim([-180 180])
     set(gca,'xtick',[]);
     ylabel('vector angle')
     
subplot (3,4,3)
col = zeros(190,1);
green = [0.2:(1-0.2)/189:1];
col = [col green' col];

  for yy = 1:190
    quiver (0, 0, coeff(yy,3), coeff(yy+190,3), 'Color', col(yy,:))
    hold on
  end
  plot([0 0],[-0.17 0.17],'k--')
  plot([-0.17 0.17],[0 0],'k--')
  axis equal
  xlim([-0.17 0.17])
  ylim([-0.17 0.17])
  title('3rd cpt')

 subplot (3,4,7)
   for yy = 1:190
    c(yy) = hypot(coeff(yy,3), coeff(yy+190,3));    
    scatter(yy, c(yy), [], col(yy,:), 'filled')
    hold on
   end
    xlim([0 190])
    ylim([0 0.16])
    set(gca,'XTick',[]);
    ylabel('vector magnitude')
    
 subplot (3,4,11)   
    for yy = 1:190
     teta(yy) = atan2d(coeff(yy+190,3), coeff(yy,3)); 
     scatter(yy, teta(yy), [], col(yy,:), 'filled', 'd')
     hold on
    end
     xlim([0 190])
     ylim([-180 180])
     set(gca,'xtick',[]);
     ylabel('vector angle')     
     
subplot (3,4,4)
col = zeros(190,1);
yellow1 = [0.2:(1-0.2)/189:1];
yellow2 = [0.4:(1-0.4)/189:1];
col = [yellow1' yellow2' col];

  for yy = 1:190
    quiver (0, 0, coeff(yy,4), coeff(yy+190,4), 'Color', col(yy,:))
    hold on
  end
  plot([0 0],[-0.17 0.17],'k--')
  plot([-0.17 0.17],[0 0],'k--')
  axis equal
  xlim([-0.18 0.18])
  ylim([-0.18 0.18])
  title('4th cpt')

 subplot (3,4,8)
   for yy = 1:190
    c(yy) = hypot(coeff(yy,4), coeff(yy+190,4));    
    scatter(yy, c(yy), [], col(yy,:), 'filled')
    hold on
   end
    xlim([0 190])
    ylim([0 0.16])
    set(gca,'XTick',[]);
    ylabel('vector magnitude')
    
 subplot (3,4,12)   
    for yy = 1:190
     teta(yy) = atan2d(coeff(yy+190,4), coeff(yy,4)); 
     scatter(yy, teta(yy), [], col(yy,:), 'filled', 'd')
     hold on
    end
     xlim([0 190])
     ylim([-180 180])
     set(gca,'xtick',[]);
     ylabel('vector angle')     