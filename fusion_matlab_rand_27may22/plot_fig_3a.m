table=readmatrix('outcome_distributions_rand_27may22.xlsx');
xx = 0:0.01:0.75*100;
yy1 = spline(table(:,1)*100,table(:,3)*100,xx);
yy2 = spline(table(:,1)*100,table(:,4)*100,xx);
yy3 = spline(table(:,1)*100,table(:,5)*100,xx);
plot(xx,yy1,'g',xx,yy2,'r',xx,yy3,'b','LineWidth',2)
xlim([0 0.75]*100)
xticks(0:25:75)
xlabel('PE Percentage')
yticks(0:20:100)
ylabel('Outcome (%)')
ax = gca;
ax.LineWidth = 2;
ax.FontWeight = 'bold';
ax.FontSize = 20;
ax.Box='on';