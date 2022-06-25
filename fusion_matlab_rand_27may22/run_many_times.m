

for schlong=1:3
    

    
    R1=schlong*1.0;
    
    main_hemifusion_kinetics
    % change back R1 in input file
    fusion
    
    
    results_summary(:,schlong)=final_matrix;
    
end