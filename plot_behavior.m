%Plot Rejection rates for both animals

%----Monkey H---
load data_behavior
 
 for iii = 1:length(Error_monkeyH)
     ER_R1D1(iii,1) = Error_monkeyH{iii}.R1D1;
     ER_R1D2(iii,1) = Error_monkeyH{iii}.R1D2;
     ER_R2D1(iii,1) = Error_monkeyH{iii}.R2D1;
     ER_R2D2(iii,1) = Error_monkeyH{iii}.R2D2;
     ER_R3D1(iii,1) = Error_monkeyH{iii}.R3D1;
     ER_R3D2(iii,1) = Error_monkeyH{iii}.R3D2;
 end

 data_ER = [ER_R1D2;ER_R1D1;ER_R2D2;ER_R2D1;ER_R3D2;ER_R3D1];
 REW = [ones(length(ER_R1D2),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);3*ones(length(ER_R1D1),1);3*ones(length(ER_R1D1),1)];
 DEL = [ones(length(ER_R1D2),1);2*ones(length(ER_R1D1),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1)];
 
 %ANOVA
 [p,table,stats] = anovan(data_ER,[REW DEL],'varnames',{'REW','DEL'},'model','full','display','off');
 
 %plot bar graph
 mean_H = [nanmean(ER_R1D2),nanmean(ER_R1D1);nanmean(ER_R2D2),nanmean(ER_R2D1);nanmean(ER_R3D2),nanmean(ER_R3D1)];
 sem_H = [nanstd(ER_R1D2)./sqrt(length(ER_R1D2)),nanstd(ER_R1D1)./sqrt(length(ER_R1D1));nanstd(ER_R2D2)./sqrt(length(ER_R2D2)),nanstd(ER_R2D1)./sqrt(length(ER_R2D1));nanstd(ER_R3D2)./sqrt(length(ER_R3D2)),nanstd(ER_R3D1)./sqrt(length(ER_R3D1))];
 
 figure
 subplot(2,2,1)
 b = bar(mean_H, 'grouped');

 hold on
 ngroups = size(mean_H, 1);
 nbars = size(mean_H, 2);
 groupwidth = min(0.8, nbars/(nbars + 1.5));
 
  for i = 1:nbars
     % Calculate center of each bar
     xx = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
     errorbar(xx, mean_H(:,i), sem_H(:,i), 'k', 'linestyle', 'none');
  end
 
 ylim([0 0.1])
 ylabel('Error rate')
 xlabel('Reward size (drops)')
 legend('long','short')
 title('monkey H')
 hold off
 
 clear all 
 
 %---Monkey C----
 load data_behavior
 
 for iii = 1:length(Error_monkeyC)
     ER_R1D1(iii,1) = Error_monkeyC{iii}.R1D1;
     ER_R1D2(iii,1) = Error_monkeyC{iii}.R1D2;
     ER_R2D1(iii,1) = Error_monkeyC{iii}.R2D1;
     ER_R2D2(iii,1) = Error_monkeyC{iii}.R2D2;
     ER_R3D1(iii,1) = Error_monkeyC{iii}.R3D1;
     ER_R3D2(iii,1) = Error_monkeyC{iii}.R3D2;
 end

 data_ER = [ER_R1D2;ER_R1D1;ER_R2D2;ER_R2D1;ER_R3D2;ER_R3D1];
 REW = [ones(length(ER_R1D2),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);3*ones(length(ER_R1D1),1);3*ones(length(ER_R1D1),1)];
 DEL = [ones(length(ER_R1D2),1);2*ones(length(ER_R1D1),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1);ones(length(ER_R1D1),1);2*ones(length(ER_R1D1),1)];
 
 %ANOVA
 [p,table,stats] = anovan(data_ER,[REW DEL],'varnames',{'REW','DEL'},'model','full','display','off');
 
 %plot bar graph
 mean_C = [nanmean(ER_R1D2),nanmean(ER_R1D1);nanmean(ER_R2D2),nanmean(ER_R2D1);nanmean(ER_R3D2),nanmean(ER_R3D1)];
 sem_C = [nanstd(ER_R1D2)./sqrt(length(ER_R1D2)),nanstd(ER_R1D1)./sqrt(length(ER_R1D1));nanstd(ER_R2D2)./sqrt(length(ER_R2D2)),nanstd(ER_R2D1)./sqrt(length(ER_R2D1));nanstd(ER_R3D2)./sqrt(length(ER_R3D2)),nanstd(ER_R3D1)./sqrt(length(ER_R3D1))];
 

 subplot(2,2,2)
 b = bar(mean_C, 'grouped');

 hold on
 ngroups = size(mean_C, 1);
 nbars = size(mean_C, 2);
 groupwidth = min(0.8, nbars/(nbars + 1.5));
 
  for i = 1:nbars
     % Calculate center of each bar
     xx = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
     errorbar(xx, mean_C(:,i), sem_C(:,i), 'k', 'linestyle', 'none');
  end
 
 ylim([0 0.1])
 ylabel('Error rate')
 xlabel('Reward size (drops)')
 legend('long','short')
 title('monkey C')
 hold off
 
 clear all 
 