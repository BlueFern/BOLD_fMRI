function STATES = InitCond()
    % Below the initial conditions of the differential equation are given.
    % They are chosen, such that the system is in steady state at t=0
    
    all_indices()
    
    STATES(ind.R_k)     =6.0185e-8;% 5.996e-8;    %'wi in component wi (metre)'  
    STATES(ind.N_Na_k)  =0.00098432;% 0.00098178;  %'N_Nai in component N_Nai (micromolar_metre)' 
    STATES(ind.N_K_k)   =0.0045919;% 0.0045915;   %'N_Ki in component N_Ki (micromolar_metre)' 
    STATES(ind.N_HCO3_k)=0.00059186;% 0.00058703;   %'N_HCO3i in component N_HCO3i (micromolar_metre)' 
    STATES(ind.N_Cl_k)  =0.00036543;% 0.0003673;   %'N_Cli in component N_Cli (micromolar_metre)' 
    STATES(ind.N_Na_s)  =0.0042814;% 0.0042839; %'N_Nao in component N_Nao (micromolar_metre)' 
    STATES(ind.N_K_s)   =8.0391e-5;%  8.0815e-5;  %'N_Ko in component N_Ko (micromolar_metre)' 
    STATES(ind.N_HCO3_s)=0.00042873;% 0.00043356;  %'N_HCO3o in component N_HCO3o (micromolar_metre)' 
    STATES(ind.K_p)     =3274.6;% 3265.4;      % uM,  [K+] in de perivascular space  
    STATES(ind.w_k)     =0.00027398;% 0.00026769;    % [-]  BK-Channel open probability 
   
    STATES(ind.Ca_i)    =0.27107;% 0.2711;          % calcium concentration in cytosol  
    STATES(ind.s_i)     =1.1401;%  1.14;         % calcium concentration in sacroplasmatic reticulum  
    STATES(ind.v_i)     =-35.612;% -35.61;        % mV celmembrane of SMC  
    STATES(ind.w_i)     =0.21615;% 0.21622;         % open state probability of calcium-activated K channels  
    STATES(ind.I_i)     = 0.45;% 0.45;          % IP3 concentration 
    
    STATES(ind.K_i)     =99819;% 99831;          %uM [K+] in SMC  
    
    STATES(ind.Ca_j)    =0.58613;% 0.58614;      % calcium concentration in EC cytosol  
    STATES(ind.s_j)     =0.81072;% 0.81071;      % calcium concentration in endoplasmatic reticulum  
    STATES(ind.v_j)     =-65.68;% -65.68;       % mV celmembrane of EC  
    STATES(ind.I_j)     =1.35;% 1.35;         % IP3 concentration in EC  
    
    STATES(ind.Mp)      =0.14073;% 0.14074;   
    STATES(ind.AMp)     =0.26305;% 0.26311;   
    STATES(ind.AM)      =0.29986;% 0.29986;  
    
    STATES(ind.R)       =1.9371e-5;% 1.937e-5;   
    
   
    
    
    STATES(ind.N_sa_Em)             =-70;% -69.999;   %mV membrane potential of soma  
    STATES(ind.N_d_Em)              =-70;% -69.999;  %mV membrane potential of dendrite  
    STATES(ind.N_sa_Na_NaP_m1_GHK)  =0.012869;% 0.01287; % 
    STATES(ind.N_sa_Na_NaP_h1_GHK)  =0.9718;%  0.9718;  %
    STATES(ind.N_sa_K_KDR_m2_GHK)   =0.0012175;% 0.0012176; % 
    STATES(ind.N_sa_K_KA_m3_GHK)    =0.1193;% 0.11931;  %
    STATES(ind.N_sa_K_KA_h2_GHK)    =0.12053;% 0.12051;  %
    STATES(ind.N_d_Na_NaP_m4_GHK)   =0.012869;% 0.01287;  %
    STATES(ind.N_d_Na_NaP_h3_GHK)   =0.9718;%  0.9718;  %
    STATES(ind.N_d_Na_NMDA_m5_GHK)  =0.00087377;% 0.00087377;  %
     STATES(ind.N_d_Na_NMDA_h4_GHK)  =0.99005;% 0.99005;  %
    STATES(ind.N_d_K_KDR_m6_GHK)    =0.0012175;% 0.0012176;  %
    STATES(ind.N_d_K_KA_m7_GHK)     =0.1193;% 0.11931;  %
    STATES(ind.N_d_K_KA_h5_GHK)     =0.12053;% 0.12051;  %
%     STATES(ind.N_d_K_NMDA_m8_GHK)   = 0.0008;%
%     STATES(ind.N_d_K_NMDA_h6_GHK)   = 0.9898;%
    STATES(ind.N_sa_Na)             = 9.9854;  %mM concentration of Na inside the soma  9.9853;%
    STATES(ind.N_sa_K)              = 133.5;  %mM concentration of K inside the soma   133.5;%
    STATES(ind.N_sa_Cl)             = 10.464;   %mM concentration of Cl inside the soma  10.464;%
    STATES(ind.N_d_Na)              = 9.9853;   %mM concentration of Na inside the dendrite  9.9853;%
    STATES(ind.N_d_K)               = 133.5;  %mM concentration of K inside the dendrite  133.5;%
    STATES(ind.N_d_Cl)              = 10.464;   %mM concentration of Cl inside the dendrite  10.464;%
   
    STATES(ind.N_e_Na)              = 139.76;  %mM concentration of Na in the extracellular space   139.76;% 
    STATES(ind.N_e_K)               = 3.5006;      %mM concentration of K in the extracellular space  3.5006;%
    STATES(ind.N_e_Cl)              = 144.1;   %mM concentration of Cl in the extracellular space   144.1;%
    STATES(ind.N_O2)    =0.022715;
    STATES(ind.B_dhb)=1;
    STATES(ind.B_CBV)=1;
   STATES(ind.N_e_Ke)=9.8e-5;
    STATES(ind.N_e_Nae)=0.0039;
    STATES(ind.N_sa_Na_NaT_m8_GHK)=0.0050;
    STATES(ind.N_sa_Na_NaT_h6_GHK)=0.9961;
     STATES(ind.N_e_Kb_buffer)        = 170;    %mM free buffer concentration   
  STATES(ind.N2_Em)=-70;
  STATES(ind.N2_Na_h1)=0.9947;
  STATES(ind.N2_K_n1)=0.0552;
  STATES(ind.N2_Nai)=18;
  STATES(ind.N2_Ke)=4;
  STATES(ind.N2_Cai)=1e-4;
  STATES(ind.N_s_K)=3.5006;
  STATES(ind.N_s_Kb_buffer)        = 170;
%   STATES(ind.N3_Em)=-70;
%   STATES(ind.N3_w)=4.7847e-4;
  
end