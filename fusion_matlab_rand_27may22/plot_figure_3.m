clear
close all
OD = zeros(2,3);
%%% plot outcomes distribusion and several things
load('all_data_1.00_PS_0.00_PE.mat')
%% plot gamma and Ahd

figure(1)
colororder({'r','b'})
yyaxis left 
plot(t,gamma,'r:',t,gammahd,'r--','LineWidth',2)

hold on
syms xx positive
gamma_rup_hd = vpasolve(v0delta==vdeltac*(xx/sigmachd)^(1/2)*exp(-sigmachd/xx),xx);
gamma_rup_ves = vpasolve(v0delta==vdeltac*(xx/sigmacves)^(1/2)*exp(-sigmacves/xx),xx);
plot(xlim,gamma_rup_hd*[1 1],'k--',xlim,gamma_rup_ves*[1 1],'k:','LineWidth',2)
ylim([0 20])
yticks(0:5:20)
ylabel({'Membrane','Tension (mN/m)'})
yyaxis right
plot(t,Ahd,'b','LineWidth',2)
yticks(0:20:40)
ylabel('HD Area (\mum^2)')
xlabel('Time (s)')
xlim([0 20])
xticks(0:5:20)
ax = gca;
ax.LineWidth = 2;
ax.FontWeight = 'bold';
ax.FontSize = 20;
OD(1,:) = fliplr([deadendfraction,fusionfraction,lysisfraction]);
clearvars -except OD

load("all_data_0.25_PS_0.75_PE.mat")
figure(2)
colororder({'r','b'})
yyaxis left 
plot(t,gamma,'r:',t,gammahd,'r--','LineWidth',2)

hold on
syms xx positive
gamma_rup_hd = vpasolve(v0delta==vdeltac*(xx/sigmachd)^(1/2)*exp(-sigmachd/xx),xx);
gamma_rup_ves = vpasolve(v0delta==vdeltac*(xx/sigmacves)^(1/2)*exp(-sigmacves/xx),xx);
plot(xlim,gamma_rup_hd*[1 1],'k--',xlim,gamma_rup_ves*[1 1],'k:','LineWidth',2)
ylim([0 20])
yticks(0:5:20)
ylabel({'Membrane','Tension (mN/m)'})
yyaxis right
plot(t,Ahd,'b','LineWidth',2)
ylim([0 30])
yticks(0:10:30)
ylabel('HD Area (\mum^2)')
xlabel('Time (s)')
xlim([0 20])
xticks(0:5:20)
ax = gca;
ax.LineWidth = 2;
ax.FontWeight = 'bold';
ax.FontSize = 20;

OD(2,:) = fliplr([deadendfraction,fusionfraction,lysisfraction]);

figure(3)
bar([1 2],OD*100,'hist')
xticklabels({'PS/PE 100/0','PS/PE 25/75'})
ylabel('Outcome (%)')
ylim([0 100])
yticks(0:20:100)
ax = gca;
ax.LineWidth = 2;
ax.FontWeight = 'bold';
ax.Box = 'off';
ax.FontSize = 20;