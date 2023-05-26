%load p-values calculated from the two-way ANOVAs (Reward x Delay) using the sliding window
%analysis (n=231 neurons)
load data_ANOVA

stat_thr = 0.05/170; %bonferroni correction
ANOVA_rew = zeros(length(pval_ANOVA),length(pval_ANOVA{1}.rew)); 
ANOVA_del = zeros(length(pval_ANOVA),length(pval_ANOVA{1}.del));
 
 for iii = 1:length(pval_ANOVA)
     ANOVA_rew(iii, find(pval_ANOVA{iii}.rew < stat_thr | pval_ANOVA{iii}.inter < stat_thr)) = 1;
     ANOVA_del(iii, find(pval_ANOVA{iii}.del < stat_thr | pval_ANOVA{iii}.inter < stat_thr)) = 1;

     vect = [ANOVA_rew(iii,:)];
     if ~isempty(find(vect == 1))
        t_max(iii,1) = find(vect == 1, 1);
     else
        t_max(iii,1) = 300;
     end
      vect2 = [ANOVA_del(iii,:)];
     if ~isempty(find(vect2 == 1))
        t_max2(iii,1) = find(vect2 == 1, 1);
     else
        t_max2(iii,1) = 300;
     end
 end

 [val rank] = sort(t_max);
 [val2 rank2] = sort(t_max2);
 
 figure
 subplot(2,2,1)
 h = bar(timescale,sum(ANOVA_rew)./length(pval_ANOVA));
           set(h,'FaceColor','b','EdgeColor','none');
           ylim([0 0.27]) 
           ylabel('% neurons');
           xlim([-1 3.5])
           text(1.3,0.22,'rew encoding')
       
subplot(2,2,3)
imagesc(ANOVA_rew(rank, :)) 
hold on
plot([46 46], [1 231], 'w--', 'LineWidth', 1.5)
xlabel('Time relative to cue')
ylabel('Neurons')
colormap([0 0 0; 1 1 1])
xlim([0 216])
set(gca,'XTick',[])

subplot(2,2,2)
h = bar(timescale,sum(ANOVA_del)./length(pval_ANOVA));
           set(h,'FaceColor','g','EdgeColor','none');
           ylim([0 0.27]) 
           ylabel('% neurons');
           xlim([-1 3.5])
           text(1.3,0.22,'del encoding')
                  
subplot(2,2,4)
imagesc(ANOVA_del(rank2, :)) 
hold on
plot([46 46], [1 231], 'w--', 'LineWidth', 1.5)
xlabel('Time relative to cue')
ylabel('Neurons')
colormap([0 0 0; 1 1 1])
xlim([0 216])
set(gca,'XTick',[])

clear all








