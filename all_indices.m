

%% ODE indices
ind.R_k     = 1;  % 
ind.N_Na_k  = 2;
ind.N_K_k   = 3;
ind.N_HCO3_k= 4;
ind.N_Cl_k  = 5;
ind.N_Na_s  = 6;
ind.N_K_s   = 7;
ind.N_HCO3_s= 8;
ind.K_p     = 9;
ind.w_k     = 10;

ind.Ca_i    = 11;
ind.s_i     = 12;
ind.v_i     = 13;
ind.w_i     = 14;
ind.I_i     = 15;

ind.K_i     = 16;

ind.Ca_j    = 17;
ind.s_j     = 18;
ind.v_j     = 19;
ind.I_j     = 20;

ind.Mp      = 21;
ind.AMp     = 22;
ind.AM      = 23;

ind.R       = 24;

%Neuron indices

ind.N_sa_Em             = 25;
ind.N_d_Em              = 26;
ind.N_sa_Na_NaP_m1_GHK  = 27;
ind.N_sa_Na_NaP_h1_GHK  = 28;
ind.N_sa_K_KDR_m2_GHK   = 29;
ind.N_sa_K_KA_m3_GHK    = 30;
ind.N_sa_K_KA_h2_GHK    = 31;
ind.N_d_Na_NaP_m4_GHK   = 32;
ind.N_d_Na_NaP_h3_GHK   = 33;
ind.N_d_Na_NMDA_m5_GHK  = 34;
ind.N_d_Na_NMDA_h4_GHK  = 35;
ind.N_d_K_KDR_m6_GHK    = 36;
ind.N_d_K_KA_m7_GHK     = 37;
ind.N_d_K_KA_h5_GHK     = 38;
ind.N_sa_Na             = 39;
ind.N_sa_K              = 40;
ind.N_sa_Cl             = 41;
ind.N_d_Na              = 42;
ind.N_d_K               = 43;
ind.N_d_Cl              = 44;
ind.N_e_K_buffer        = 45;
ind.N_e_Na              = 46;
ind.N_e_K               = 47;
ind.N_e_Cl              = 48;
ind.N_O2                = 49;
ind.B_dhb =50;
ind.B_CBV =51;
ind.N_e_Ke=52;
ind.N_e_Nae=53;
ind.N_sa_Na_NaT_m8_GHK   =54;
ind.N_sa_Na_NaT_h6_GHK   =55;

ind.N_e_Kb_buffer=56;
ind.N_s_K=57;
ind.N_s_Kb_buffer=58;
%neuron model 2

ind.N2_Em = 59;
ind.N2_Na_h1 =60;
ind.N2_K_n1  =61;
ind.N2_Nai = 62;
ind.N2_Ke = 63;
ind.N2_Cai = 64;

% % morris lecar
% 
% ind.N3_Em=64;
% ind.N3_w=65;

%% Neuron flux indices



%Nernst potential for Na,K,Cl ions in soma and dendrite

flu.N_sa_E_Na              = 1;
flu.N_sa_E_K               = 2;
flu.N_sa_E_Cl              = 3;
flu.N_d_E_Na               = 4;
flu.N_d_E_K                = 5;
flu.N_d_E_Cl               = 6;
%Na flux through NaP channel in soma using GHK

flu.N_sa_Na_NaP_m1a1_GHK   = 7;
flu.N_sa_Na_NaP_m1b1_GHK   = 8;
flu.N_sa_Na_NaP_h1a1_GHK   = 9;
flu.N_sa_Na_NaP_h1b1_GHK   = 10;
flu.N_sa_Na_NaP_GHK        = 11;

%K flux through KDR channel in soma using GHK

flu.N_sa_K_KDR_m2a2_GHK    = 12;
flu.N_sa_K_KDR_m2b2_GHK    = 13;
flu.N_sa_K_KDR_GHK         = 14;

%K flux through KA channel in soma using GHK

flu.N_sa_K_KA_m3a3_GHK     = 15;
flu.N_sa_K_KA_m3b3_GHK     = 16;
flu.N_sa_K_KA_h2a2_GHK     = 17;
flu.N_sa_K_KA_h2b2_GHK     = 18;
flu.N_sa_K_KA_GHK          = 19;

%Na flux through NaP channel in dendrite using GHK

flu.N_d_Na_NaP_m4a4_GHK    = 20;
flu.N_d_Na_NaP_m4b4_GHK    = 21;
flu.N_d_Na_NaP_h3a3_GHK    = 22;
flu.N_d_Na_NaP_h3b3_GHK    = 23;
flu.N_d_Na_NaP_GHK         = 24;

%Na flux through NMDA channel in dendrite using GHK

flu.N_d_Na_NMDA_m5a5_GHK   = 25;
flu.N_d_Na_NMDA_m5b5_GHK   = 26;
flu.N_d_Na_NMDA_h4a4_GHK   = 27;
flu.N_d_Na_NMDA_h4b4_GHK   = 28;
flu.N_d_Na_NMDA_GHK        = 29;

%K flux through KDR channel in dendrite using GHK

flu.N_d_K_KDR_m6a6_GHK     = 30;
flu.N_d_K_KDR_m6b6_GHK     = 31;
flu.N_d_K_KDR_GHK          = 32;

%K flux through KA channel in dendrite using GHK
 
flu.N_d_K_KA_m7a7_GHK      = 33; 
flu.N_d_K_KA_m7b7_GHK      = 34;
flu.N_d_K_KA_h5a5_GHK      = 35;
flu.N_d_K_KA_h5b5_GHK      = 36;
flu.N_d_K_KA_GHK           = 37;
  
%K flux through NMDA channel in dendrite using GHK

flu.N_d_K_NMDA_GHK         = 38;
 
%Flux of Na and K ions through pumps in soma and dendrite

flu.N_sa_r1_pump           = 39;
flu.N_d_r1_pump            = 40;
flu.N_O2_r2_pump           = 41;
flu.N_sa_pump              = 42;
flu.N_d_pump               = 43;
flu.N_sa_Napump            = 44;
flu.N_sa_Kpump             = 45;
flu.N_d_Napump             = 46;
flu.N_d_Kpump              = 47;

% % Leak conductance of Na and K in soma and dendrite using HH
% 
% flu.N_sa_tempNatot=48;
% flu.N_sa_tempKtot=49;
% flu.N_d_tempNatot=50;
% flu.N_d_tempKtot=51;
% 
% flu.N_sa_gNaleak           = 52;
% flu.N_sa_gKleak            = 53;
% flu.N_d_gNaleak            = 54;
% flu.N_d_gKleak             = 55;
% 
% 
% flu.N_sa_Naleak_HH         = 56;
% flu.N_sa_Kleak_HH          = 57;
% flu.N_d_Naleak_HH          = 58;
% flu.N_d_Kleak_HH           = 59;
% flu.N_sa_Cl_tot            = 60;
% flu.N_d_Cl_tot             = 61;
% 
% % Total Na and K ion fluxes in soma
% 
% flu.N_sa_Na_tot            = 62;
% flu.N_sa_K_tot             = 63;
%   
% % Total Na and K ion fluxes in dendrite
% flu.N_d_Na_tot             = 64;
% flu.N_d_K_tot              = 65;
% 
% % Total ion fluxes in soma and dendrite
% flu.N_sa_tot               = 66;
% flu.N_d_tot                = 67;
% flu.V_CBF                =68;
% flu.N_sa_r1_pump_init    =69;
% flu.N_d_r1_pump_init     =70;
% flu.N_P_O2               =71;
% flu.V_Supply             =72;
% flu.N_Backgroundoxygen   =73;
% flu.N_Pumpoxygen         =74;
% flu.N_sa_pumprate    =75;
% flu.N_d_pumprate    =76;
% 
% flu.N_MRI_BOLD=77;
% flu.N_OEF =78;
% flu.N_relativechange =79;
% flu.N_MRI_BOLD1=80;
% flu.V_CBF_Norm=81;
% flu.V_CMRO2_Norm=82;
% 
% flu.B_dhb_Norm=83;
% flu.B_CBV_Norm=84;
% flu.N_TissueOxy_Norm=85;
% flu.V_CMRO2=86;
% flu.N_Glia_Buffer=87;
% 
% flu.N_sa_Na_NaT_m8a8_GHK=88;
% flu.N_sa_Na_NaT_m8b8_GHK=89;
% flu.N_sa_Na_NaT_h6a6_GHK=90;
% flu.N_sa_Na_NaT_h6b6_GHK=91;
% flu.N_sa_Na_NaT_GHK=92;
% flu.N_Gtotsoma_Na=93;
% flu.N_Gtotsoma_K=94;
% flu.N_Gtotden_Na=95;
% flu.N_Gtotden_K=96;
% 
% 
% %%NEuron model 2
% 
% flu.N2_E_Na = 97;
% flu.N2_E_K = 98;
% flu.N2_E_Cl = 99;
% flu.N2_Na_m1a1 = 100;
% flu.N2_Na_m1b1 =101;
% flu.N2_Na_h1a1 =102;
% flu.N2_Na_h1b1= 103;
% flu.N2_K_n1a1 =104;
% flu.N2_K_n1b1 =105;
% flu.N2_Na_m_inf =106;
% flu.N2_Na =107;
% flu.N2_K =108;
% flu.N2_Cl =109;
% flu.N2_pump =110;
% flu.N2_glia =111;
% flu.N2_diffusion=112;
% flu.N2_Nae_conc =113;
% flu.N2_Ki_conc = 114;
% flu.N2_NaL=115;
% flu.N2_KL=116;
% flu.N_diffusion=117;



% Leak fluxes of Na,K,Cl in soma and dendrite using HH

flu.N_sa_Naleak_HH         = 48;
flu.N_sa_Kleak_HH          = 49;
flu.N_d_Naleak_HH          = 50;
flu.N_d_Kleak_HH           = 51;
flu.N_sa_Cl_tot            = 52;
flu.N_d_Cl_tot             = 53;

% Total Na and K ion fluxes in soma

flu.N_sa_Na_tot            = 54;
flu.N_sa_K_tot             = 55;
  
% Total Na and K ion fluxes in dendrite
flu.N_d_Na_tot             = 56;
flu.N_d_K_tot              = 57;

% Total ion fluxes in soma and dendrite
flu.N_sa_tot               = 58;
flu.N_d_tot                = 59;

flu.V_CBF                =60;
flu.N_sa_r1_pump_init    =61;
flu.N_d_r1_pump_init     =62;
flu.N_P_O2               =63;

flu.V_Supply             =64;
flu.N_Backgroundoxygen   =65;
flu.N_Pumpoxygen         =66;
flu.N_sa_pumprate    =67;
flu.N_d_pumprate    =68;



flu.N_MRI_BOLD=69;
flu.N_OEF =70;
flu.N_relativechange =71;
flu.N_MRI_BOLD1=72;
flu.V_CBF_Norm=73;
flu.V_CMRO2_Norm=74;

flu.B_dhb_Norm=75;
flu.B_CBV_Norm=76;
flu.N_TissueOxy_Norm=77;
flu.V_CMRO2=78;
flu.N_Glia_Buffer=79;
 
flu.N_Gtotsoma_Na=80;
flu.N_Gtotsoma_K=81;
flu.N_Gtotden_Na=82;
flu.N_Gtotden_K=83;
flu.N_sa_Na_NaT_m8a8_GHK=84;
flu.N_sa_Na_NaT_m8b8_GHK=85;
flu.N_sa_Na_NaT_h6a6_GHK=86;
flu.N_sa_Na_NaT_h6b6_GHK=87;
flu.N_sa_Na_NaT_GHK=88;
%%NEuron model 2

flu.N2_E_Na = 89;
flu.N2_E_K = 90;
flu.N2_E_Cl = 91;
flu.N2_Na_m1a1 = 92;
flu.N2_Na_m1b1 =93;
flu.N2_Na_h1a1 =94;
flu.N2_Na_h1b1= 95;
flu.N2_K_n1a1 =96;
flu.N2_K_n1b1 =97;
flu.N2_Na_m_inf =98;
flu.N2_Na =99;
flu.N2_K =100;
flu.N2_Cl =101;
flu.N2_pump =102;
flu.N2_glia =103;
flu.N2_diffusion=104;
flu.N2_Nae_conc =105;
flu.N2_Ki_conc = 106;
flu.N2_NaL=107;
flu.N2_KL=108;
flu.N_diffusion=109;

flu.N_sa_Kpump_s=110;
flu.N_d_Kpump_s=111;
flu.N_sa_K_KDR_GHK_s=112;
flu.N_sa_K_KA_GHK_s=113;
flu.N_d_K_KDR_GHK_s=114;
flu.N_d_K_KA_GHK_s=115;
flu.N_d_K_NMDA_GHK_s=116;
flu.N_sa_r1_pump_s=117;
flu.N_d_r1_pump_s=118;
flu.N_sa_pump_s=119;
flu.N_d_pump_s=120;
flu.N_sa_E_K_s=121;
flu.N_d_E_K_s=122;
flu.N_sa_Kleak_HH_s=123;
flu.N_d_Kleak_HH_s=124;
flu.N_sa_K_tot_s=125;
flu.N_d_K_tot_s=126;
flu.N_sa_tempKtot_s=127;
flu.N_d_tempKtot_s=128;
    
% 
% flu.N_sa_gKleak_s   = 129;
% flu.N_d_gKleak_s=130;

% % flu.N3_m_inf=110;
% % flu.N3_w_inf=111;
% % flu.N3_tauN=112;
%% Astrocyte indices
flu.R_s     = 1;%R_tot- R_k;
flu.N_Cl_s  = 2;
flu.Na_k    = 3;
flu.K_k     = 4;
flu.HCO3_k  = 5;
flu.Cl_k    = 6;
flu.Na_s    = 7;
flu.K_s     = 8;
flu.HCO3_s  = 9;
flu.Cl_s    = 10;

flu.E_Na_k  = 11;
flu.E_K_k   = 12;
flu.E_Cl_k  = 13;
flu.E_NBC_k = 14;

flu.v_k = 15;     

flu.J_KCC1_k =16;
flu.J_NBC_k  =17;
flu.J_NKCC1_k  =18;
flu.J_NaK_k  =19; 
flu.J_Na_k   =20;
flu.J_K_k    =21;

flu.J_BK_k  =22;
flu.E_BK_k  =23;
flu.w_inf   =24;
flu.phi_w   =25;

%% SMC-pointers

flu.v_coup_i        = 1;
flu.Ca_coup_i       = 2;
flu.IP3_coup_i      = 3;
flu.rho_i           = 4;
flu.J_IP3_i         = 5;
flu.J_SRuptake_i    = 6;
flu.J_CICR_i        = 7;
flu.J_extrusion_i   = 8;
flu.J_leak_i        = 9;
flu.J_VOCC_i        = 10;
flu.J_NaCa_i        = 11;
flu.J_NaK_i         = 12;
flu.J_Cl_i          = 13;
flu.J_K_i           = 14;
flu.Kactivation_i   = 15;
flu.J_degrad_i      = 16;
flu.J_stretch_i     = 17;

flu.v_KIR_i         = 18;
flu.G_KIR_i         = 19;
flu.J_KIR_i         = 20;

flu.M               = 21;
flu.h_r             = 22;
flu.E_K_i           = 23;

flu.K1_c            = 24;
flu.K6_c            = 25;
%% EC-pointers

flu.v_coup_j         = 1;
flu.Ca_coup_j        = 2;
flu.IP3_coup_j       = 3;
flu.rho_j           = 4;
flu.J_0_j           = 5;
flu.J_IP3_j         = 6;
flu.J_ERuptake_j    = 7;
flu.J_CICR_j        = 8;
flu.J_extrusion_j   = 9;
flu.J_leak_j        = 10;
flu.J_cation_j      = 11;
flu.J_BKCa_j        = 12;
flu.J_SKCa_j        = 13;
flu.J_K_j           = 14;
flu.J_R_j           = 15;
flu.J_degrad_j      = 16;
flu.J_stretch_j     = 17;

