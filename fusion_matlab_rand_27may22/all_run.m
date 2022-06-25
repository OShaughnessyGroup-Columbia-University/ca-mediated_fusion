
PE = 0:0.05:0.95;
PS = 1-PE;
DD = zeros(length(PE),1);
FF = zeros(length(PE),1);
LL = zeros(length(PE),1);
% Applying Ben's Stratton's parameters
gamma_crit_hd_grp = [26.9402660100000,30.1535240500000,33.6897679000000,37.5846564900000,41.8794116900000,46.6218847500000,51.8679796500000,57.6834682700000,64.1463320100000,71.3498205600000,79.4065036800000,88.4537218100000,98.6610469700000,110.240696800000,123.462397000000	138.675140900000,156.340000800000,177.081351200000,201.770208900000,231.666796200000];
gamma_crit_ves_grp = [126.759600000000,131.064900000000,135.553700000000,140.237400000000,145.128400000000,150.240400000000,155.588300000000,161.188400000000,167.058800000000,173.219200000000,179.691500000000,186.500000000000,193.671800000000,201.236900000000,209.229200000000,217.686700000000,226.652200000000,236.174500000000,246.309200000000,257.119900000000];
% end of Ben's Stratton's parameters
epsilon = [0.0709433960000000,0.0703423610000000,0.0697413260000000,0.0691402910000000,0.0685392560000000,0.0679382200000000,0.0673371850000000,0.0667361500000000,0.0661351150000000,0.0655340800000000,0.0649330450000000,0.0643320090000000,0.0637309740000000,0.0631299390000000,0.0625289040000000,0.0619278690000000,0.0613268340000000,0.0607257980000000,0.0601247630000000,0.0595237280000000];

for j = 1:length(PS)    
    clearvars -except PS PE DD FF LL gamma_crit_ves_grp gamma_crit_hd_grp epsilon j
    
    pooper=zeros(5,8);
    
    
    
    epsiloncat=epsilon(j);
    gamma0=epsiloncat*265/2;
    sigmacves = gamma_crit_ves_grp(j);
    sigmachd = gamma_crit_hd_grp(j);
    
    
    %kleak for pure dops = 0.000091;
    %kleak=.000091;
    kleak=0.000091;
    %tauleak=34;
    %tauleak=0.91;
    tauleak=51.0;
    
    
    Wvv=5.3;
    
    for asli=1
        
        R1=asli*5.0;
        R0=R1;
        vag=(0.2*4*R1^2)^.5/0.01;
        
        %reinstate penis
        m= round(vag);
        %m=3;
        
        main_hemifusion_kinetics
        
        % NOTE this tau is for fusion.m  which is different then some tau
        % floating around for hemifusion calcs
        tau= 1e-3;
        
        
        vag=round(m*0.65);
        maxtime=t(vag);
        
        % reinstate penis
        fusion
        
        % reinstate penis
        pooper(:,asli)=final_matrix;
        
    %clearvars -except pooper epsiloncat gamma0
        
    end
    DD(j) = deadendfraction;
    FF(j) = fusionfraction;
    LL(j) = lysisfraction;
    save(sprintf('all_data_%0.2f_PS_%0.2f_PE.mat',PS(j),PE(j)))
end