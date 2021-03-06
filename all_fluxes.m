function [NE,AC,SMC,EC] = all_fluxes (t,state)
%% load the constants for the fluxes and pointers:
    all_indices();
    all_constants();
    global stretch_ch only_Koenig
% Fluxes for Neuron Model
AC(flu.R_s)    = R_tot - state(ind.R_k); 
% Nernst potential for Na,K,Cl ions in soma and dendrite

NE(flu.N_sa_E_Na)= ph.*log(state(ind.N_e_Na)./state(ind.N_sa_Na));
NE(flu.N_sa_E_K)= ph.*log(state(ind.N_e_K)./state(ind.N_sa_K));
NE(flu.N_sa_E_Cl)= -70;
NE(flu.N_d_E_Na)= ph.*log(state(ind.N_e_Na)./state(ind.N_d_Na));
NE(flu.N_d_E_K)= ph.*log(state(ind.N_e_K)./state(ind.N_d_K));
NE(flu.N_d_E_Cl)= -70;

% NE(flu.N_sa_E_Na)= 70.4547;
% NE(flu.N_sa_E_K)= -97.2173;
% NE(flu.N_sa_E_Cl)= -70;
% NE(flu.N_d_E_Na)= 70.4547;
% NE(flu.N_d_E_K)= -97.2173;
% NE(flu.N_d_E_Cl)= -70;

NE(flu.N_sa_E_K_s)= ph.*log((state(ind.N_K_s)./(2.8e-8.*1000))./state(ind.N_sa_K));
NE(flu.N_d_E_K_s)= ph.*log((state(ind.N_K_s)./(2.8e-8.*1000))./state(ind.N_d_K));

%Na flux through NaP channel in soma using GHK

NE(flu.N_sa_Na_NaP_m1a1_GHK)=1./(6*(1+exp(-((0.143.*state(ind.N_sa_Em))+5.67))));
NE(flu.N_sa_Na_NaP_m1b1_GHK)=exp(-((0.143.*state(ind.N_sa_Em))+5.67))./(6.*(1+exp(-((0.143.*state(ind.N_sa_Em))+5.67))));
NE(flu.N_sa_Na_NaP_h1a1_GHK)=5.12e-8.*exp(-((0.056.*state(ind.N_sa_Em))+2.94));
NE(flu.N_sa_Na_NaP_h1b1_GHK)=1.6e-6./(1+exp(-(((0.2.*state(ind.N_sa_Em)))+8)));
NE(flu.N_sa_Na_NaP_GHK)=((state(ind.N_sa_Na_NaP_m1_GHK)).^2.*state(ind.N_sa_Na_NaP_h1_GHK).*gNaP_GHk.*F.*state(ind.N_sa_Em).*(state(ind.N_sa_Na)-(exp(-state(ind.N_sa_Em)./ph).*state(ind.N_e_Na))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));





% Na flux through NaT channel in soma using GHK

NE(flu.N_sa_Na_NaT_m8a8_GHK)=0.32*((-(state(ind.N_sa_Em))-51.9)./(exp(-(0.25*(state(ind.N_sa_Em))+12.975))-1));
NE(flu.N_sa_Na_NaT_m8b8_GHK)=0.28.*(((state(ind.N_sa_Em))+24.89)./(exp(0.2*(state(ind.N_sa_Em))+4.978)-1));
NE(flu.N_sa_Na_NaT_h6a6_GHK)=0.128.*exp(-(0.056*(state(ind.N_sa_Em))+2.94));
NE(flu.N_sa_Na_NaT_h6b6_GHK)=4./(1+exp(-(0.2*(state(ind.N_sa_Em))+6)));
NE(flu.N_sa_Na_NaT_GHK)=((state(ind.N_sa_Na_NaT_m8_GHK)).^3.*state(ind.N_sa_Na_NaT_h6_GHK).*gNaT_GHk.*F.*state(ind.N_sa_Em).*(state(ind.N_sa_Na)-(exp(-state(ind.N_sa_Em)./ph).*state(ind.N_e_Na))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));

%K flux through KDR channel in soma using GHK

NE(flu.N_sa_K_KDR_m2a2_GHK)=0.016.*(((state(ind.N_sa_Em))+34.9)./(1-exp(-((0.2.*state(ind.N_sa_Em))+6.98))));
NE(flu.N_sa_K_KDR_m2b2_GHK)=0.25.*exp(-((0.025.*state(ind.N_sa_Em))+1.25));
NE(flu.N_sa_K_KDR_GHK)=((state(ind.N_sa_K_KDR_m2_GHK)).^2.*gKDR_GHk*F*state(ind.N_sa_Em).*(state(ind.N_sa_K)-(exp(-state(ind.N_sa_Em)./ph).*state(ind.N_e_K))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));

NE(flu.N_sa_K_KDR_GHK_s)=((state(ind.N_sa_K_KDR_m2_GHK)).^2.*gKDR_GHk*F*state(ind.N_sa_Em).*(state(ind.N_sa_K)-(exp(-state(ind.N_sa_Em)./ph).*(state(ind.N_K_s)./(2.8e-8.*1000)))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));


%K flux through KA channel in soma using GHK

NE(flu.N_sa_K_KA_m3a3_GHK)=0.02.*(((state(ind.N_sa_Em))+56.9)./(1-exp(-((0.1.*state(ind.N_sa_Em))+5.69))));
NE(flu.N_sa_K_KA_m3b3_GHK)=0.0175.*(((state(ind.N_sa_Em))+29.9)./(exp(((0.1.*state(ind.N_sa_Em))+2.99))-1));
NE(flu.N_sa_K_KA_h2a2_GHK)=0.016.*exp(-((0.056.*state(ind.N_sa_Em))+4.61));
NE(flu.N_sa_K_KA_h2b2_GHK)=0.5./(1+exp(-((0.2.*state(ind.N_sa_Em))+11.98)));
NE(flu.N_sa_K_KA_GHK)=((state(ind.N_sa_K_KA_m3_GHK)).^2.*state(ind.N_sa_K_KA_h2_GHK).*gKA_GHk.*F.*state(ind.N_sa_Em).*(state(ind.N_sa_K)-(exp(-state(ind.N_sa_Em)./ph).*state(ind.N_e_K))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));

NE(flu.N_sa_K_KA_GHK_s)=((state(ind.N_sa_K_KA_m3_GHK)).^2.*state(ind.N_sa_K_KA_h2_GHK).*gKA_GHk.*F.*state(ind.N_sa_Em).*(state(ind.N_sa_K)-(exp(-state(ind.N_sa_Em)./ph).*(state(ind.N_K_s)./(2.8e-8.*1000)))))./(ph.*(1-exp(-state(ind.N_sa_Em)./ph)));


%Na flux through NaP channel in dendrite using GHK

NE(flu.N_d_Na_NaP_m4a4_GHK)=1./(6.*(1+exp(-((0.143.*state(ind.N_d_Em))+5.67))));
NE(flu.N_d_Na_NaP_m4b4_GHK)=exp(-((0.143.*state(ind.N_d_Em))+5.67))./(6.*(1+exp(-((0.143.*state(ind.N_d_Em))+5.67))));
NE(flu.N_d_Na_NaP_h3a3_GHK)=5.12e-8.*exp(-((0.056.*state(ind.N_d_Em))+2.94));
NE(flu.N_d_Na_NaP_h3b3_GHK)=1.6e-6./(1+exp(-(((0.2.*state(ind.N_d_Em)))+8)));
NE(flu.N_d_Na_NaP_GHK)=((state(ind.N_d_Na_NaP_m4_GHK)).^2.*state(ind.N_d_Na_NaP_h3_GHK).*gNaP_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_Na)-(exp(-state(ind.N_d_Em)./ph).*state(ind.N_e_Na))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph)));


%Na flux through NMDA channel in dendrite using GHK

NE(flu.N_d_Na_NMDA_m5a5_GHK)=0.5./(1+exp((13.5-state(ind.N_e_K))./1.42));
NE(flu.N_d_Na_NMDA_m5b5_GHK)=0.5-NE(flu.N_d_Na_NMDA_m5a5_GHK);
NE(flu.N_d_Na_NMDA_h4a4_GHK)=1./(2000.*(1+exp(((state(ind.N_e_K))-6.75)/0.71)));
NE(flu.N_d_Na_NMDA_h4b4_GHK)=1/2e3 - NE(flu.N_d_Na_NMDA_h4a4_GHK);
NE(flu.N_d_Na_NMDA_GHK)=((state(ind.N_d_Na_NMDA_m5_GHK).*state(ind.N_d_Na_NMDA_h4_GHK).*gNMDA_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_Na)-(exp(-state(ind.N_d_Em)./ph).*state(ind.N_e_Na))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph))))./ (1+0.33*Mg*exp(-(0.07*state(ind.N_d_Em)+0.7)));

%K flux through KDR channel in dendrite using GHK

NE(flu.N_d_K_KDR_m6a6_GHK)=0.016.*(((state(ind.N_d_Em))+34.9)./(1-exp(-((0.2.*state(ind.N_d_Em))+6.98))));
NE(flu.N_d_K_KDR_m6b6_GHK)=0.25.*exp(-((0.025.*state(ind.N_d_Em))+1.25));
NE(flu.N_d_K_KDR_GHK)=((state(ind.N_d_K_KDR_m6_GHK)).^2.*gKDR_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*state(ind.N_e_K))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph)));

NE(flu.N_d_K_KDR_GHK_s)=((state(ind.N_d_K_KDR_m6_GHK)).^2.*gKDR_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*(state(ind.N_K_s)./(2.8e-8.*1000)))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph)));


%K flux through KA channel in dendrite using GHK

NE(flu.N_d_K_KA_m7a7_GHK)=0.02.*(((state(ind.N_d_Em))+56.9)./(1-exp(-((0.1.*state(ind.N_d_Em))+5.69))));
NE(flu.N_d_K_KA_m7b7_GHK)=0.0175.*(((state(ind.N_d_Em))+29.9)./(exp(((0.1.*state(ind.N_d_Em))+2.99))-1));
NE(flu.N_d_K_KA_h5a5_GHK)=0.016.*exp(-((0.056.*state(ind.N_d_Em))+4.61));
NE(flu.N_d_K_KA_h5b5_GHK)=0.5./(1+exp(-((0.2.*state(ind.N_d_Em))+11.98)));
NE(flu.N_d_K_KA_GHK)=((state(ind.N_d_K_KA_m7_GHK)).^2.*state(ind.N_d_K_KA_h5_GHK).*gKA_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*state(ind.N_e_K))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph)));

NE(flu.N_d_K_KA_GHK_s)=((state(ind.N_d_K_KA_m7_GHK)).^2.*state(ind.N_d_K_KA_h5_GHK).*gKA_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*(state(ind.N_K_s)./(2.8e-8.*1000)))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph)));


%K flux through NMDA channel in dendrite using GHK


NE(flu.N_d_K_NMDA_GHK)=((state(ind.N_d_Na_NMDA_m5_GHK).*state(ind.N_d_Na_NMDA_h4_GHK).*gNMDA_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*state(ind.N_e_K))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph))))./ (1+0.33*Mg*exp(-(0.07*state(ind.N_d_Em)+0.7)));

NE(flu.N_d_K_NMDA_GHK_s)=((state(ind.N_d_Na_NMDA_m5_GHK).*state(ind.N_d_Na_NMDA_h4_GHK).*gNMDA_GHk.*F.*state(ind.N_d_Em).*(state(ind.N_d_K)-(exp(-state(ind.N_d_Em)./ph).*(state(ind.N_K_s)./(2.8e-8.*1000)))))./(ph.*(1-exp(-state(ind.N_d_Em)./ph))))./ (1+0.33*Mg*exp(-(0.07*state(ind.N_d_Em)+0.7)));




NE(flu.N_sa_r1_pump)=(1+(N_e_K_init./state(ind.N_e_K))).^-2.*(1+(N_sa_Na_init./state(ind.N_sa_Na))).^-3;
NE(flu.N_sa_r1_pump_init)=(1+(N_e_K_init./N_e_K_init)).^-2.*(1+(N_sa_Na_init./N_sa_Na_init)).^-3;
NE(flu.N_d_r1_pump)=(1+(N_e_K_init./state(ind.N_e_K))).^-2.*(1+(N_d_Na_init./state(ind.N_d_Na))).^-3;
NE(flu.N_d_r1_pump_init)=(1+(N_e_K_init./N_e_K_init)).^-2.*(1+(N_d_Na_init./N_d_Na_init)).^-3;
NE(flu.N_O2_r2_pump)=2.*(1+O2_0./(((1-alph).*(state(ind.N_O2)))+alph.*O2_0)).^-1;
% NE(flu.N_O2_r2_pump)=2.*(1+O2_0./(((1-alph).*(O2_0))+alph.*O2_0)).^-1;

NE(flu.N_sa_r1_pump_s)=(1+(N_e_K_init_s./(state(ind.N_K_s)./(2.8e-8.*1000)))).^-2.*(1+(N_sa_Na_init./state(ind.N_sa_Na))).^-3;
NE(flu.N_d_r1_pump_s)=(1+(N_e_K_init_s./(state(ind.N_K_s)./(2.8e-8.*1000)))).^-2.*(1+(N_d_Na_init./state(ind.N_d_Na))).^-3;
NE(flu.N_sa_pump_s)=Imax.*NE(flu.N_sa_r1_pump_s)*NE(flu.N_O2_r2_pump);
NE(flu.N_d_pump_s)=Imax.*NE(flu.N_d_r1_pump_s)*NE(flu.N_O2_r2_pump);
NE(flu.N_sa_Kpump_s)= -2.*NE(flu.N_sa_pump_s);
NE(flu.N_d_Kpump_s)= -2.*NE(flu.N_d_pump_s);

NE(flu.N_sa_pumprate)= -(NE(flu.N_sa_Na_NaP_GHK)+ NE(flu.N_sa_Naleak_HH)+NE(flu.N_sa_K_KDR_GHK)+ NE(flu.N_sa_K_KA_GHK)+NE(flu.N_sa_Kleak_HH)+NE(flu.N_sa_Cl_tot))/(NE(flu.N_sa_r1_pump).*NE(flu.N_O2_r2_pump));
NE(flu.N_d_pumprate)= -(NE(flu.N_d_Na_NaP_GHK)+NE(flu.N_d_Naleak_HH)+ NE(flu.N_d_Na_NMDA_GHK)+NE(flu.N_d_K_KDR_GHK)+ NE(flu.N_d_K_KA_GHK)+NE(flu.N_d_Kleak_HH)+ NE(flu.N_d_K_NMDA_GHK)+ NE(flu.N_d_Cl_tot))/(NE(flu.N_d_r1_pump).*NE(flu.N_O2_r2_pump));
NE(flu.N_sa_pump)=Imax.*NE(flu.N_sa_r1_pump).*NE(flu.N_O2_r2_pump);
NE(flu.N_d_pump)=Imax.*NE(flu.N_d_r1_pump).*NE(flu.N_O2_r2_pump);

NE(flu.N_sa_Napump)= 3.*NE(flu.N_sa_pump);
NE(flu.N_sa_Kpump)= -2.*NE(flu.N_sa_pump);
NE(flu.N_d_Napump)= 3.*NE(flu.N_d_pump);
NE(flu.N_d_Kpump)= -2.*NE(flu.N_d_pump);  
NE(flu.N_P_O2)=(2.*(1+O2_0./((1-alph).*(state(ind.N_O2))+alph.*O2_0)).^-1)-(2.*(1+(O2_0./(alph.*O2_0))).^-1)./(2.*(1+O2_0./((1-alph).*O2_0+alph.*O2_0)).^-1)-(2.*(1+(O2_0./(alph.*O2_0))).^-1);
NE(flu.V_CBF)=CBF_init.*((state(ind.R))^4./(LU_R_init)^4);
NE(flu.V_Supply)=(NE(flu.V_CBF).*((O2_b-state(ind.N_O2))./(O2_b-O2_0)));
NE(flu.N_Backgroundoxygen)=(CBF_init.*NE(flu.N_P_O2).*(1-gamm));
NE(flu.N_Pumpoxygen)=(CBF_init.*NE(flu.N_P_O2).*gamm.*((NE(flu.N_sa_r1_pump)+NE(flu.N_d_r1_pump))./(NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init))));



% % Leak conductance of Na and K in soma and dendrite using HH calculated for steady state 
% NE(flu.N_sa_tempNatot)=NE(flu.N_sa_Na_NaT_GHK)+NE(flu.N_sa_Na_NaP_GHK)+NE(flu.N_sa_Napump);%
% NE(flu.N_sa_tempKtot)=NE(flu.N_sa_K_KDR_GHK)+NE(flu.N_sa_K_KA_GHK)+NE(flu.N_sa_Kpump);%
% NE(flu.N_d_tempNatot)=NE(flu.N_d_Na_NaP_GHK)+NE(flu.N_d_Napump)+NE(flu.N_d_Na_NMDA_GHK);%+
% NE(flu.N_d_tempKtot)=NE(flu.N_d_K_KDR_GHK)+NE(flu.N_d_K_KA_GHK)+NE(flu.N_d_Kpump)+NE(flu.N_d_K_NMDA_GHK);%
%     
% NE(flu.N_sa_gNaleak)  = (NE(flu.N_sa_tempNatot))/(NE(flu.N_sa_E_Na) - state(ind.N_sa_Em));
% NE(flu.N_sa_gKleak)   = (NE(flu.N_sa_tempKtot))/(NE(flu.N_sa_E_K) - state(ind.N_sa_Em));
% NE(flu.N_d_gNaleak)   = (NE(flu.N_d_tempNatot))/(NE(flu.N_d_E_Na)  - state(ind.N_d_Em));
% NE(flu.N_d_gKleak)    = (NE(flu.N_d_tempKtot))/(NE(flu.N_d_E_K)  - state(ind.N_d_Em)) ;
% 
% 
% % Leak fluxes of Na,K,Cl in soma and dendrite using HH
% NE(flu.N_sa_Naleak_HH)=NE(flu.N_sa_gNaleak)*(state(ind.N_sa_Em) - NE(flu.N_sa_E_Na));
% NE(flu.N_sa_Kleak_HH)=NE(flu.N_sa_gKleak)*(state(ind.N_sa_Em) - NE(flu.N_sa_E_K));
% NE(flu.N_d_Naleak_HH)=NE(flu.N_d_gNaleak)*(state(ind.N_d_Em) - NE(flu.N_d_E_Na));
% NE(flu.N_d_Kleak_HH)=NE(flu.N_d_gKleak)*(state(ind.N_d_Em) - NE(flu.N_d_E_K));
% NE(flu.N_sa_Cl_tot)=10.*NE(flu.N_sa_gNaleak)*(state(ind.N_sa_Em)- NE(flu.N_sa_E_Cl));
% NE(flu.N_d_Cl_tot)=10.*NE(flu.N_d_gNaleak)*(state(ind.N_d_Em) - NE(flu.N_d_E_Cl));

% Leak fluxes of Na,K,Cl in soma and dendrite using HH
NE(flu.N_sa_Naleak_HH)=gNaleak_sa*(state(ind.N_sa_Em) - NE(flu.N_sa_E_Na));
NE(flu.N_sa_Kleak_HH)=gKleak_sa *(state(ind.N_sa_Em) - NE(flu.N_sa_E_K));
NE(flu.N_d_Naleak_HH)=gNaleak_d*(state(ind.N_d_Em) - NE(flu.N_d_E_Na));
NE(flu.N_d_Kleak_HH)=gKleak_d*(state(ind.N_d_Em) - NE(flu.N_d_E_K));
NE(flu.N_sa_Cl_tot)= gClleak_sa*(state(ind.N_sa_Em)- NE(flu.N_sa_E_Cl));
NE(flu.N_d_Cl_tot)=gClleak_d *(state(ind.N_d_Em) - NE(flu.N_d_E_Cl));



%Total Na and K ion fluxes in soma

NE(flu.N_sa_Na_tot)= (NE(flu.N_sa_Na_NaP_GHK)+ NE(flu.N_sa_Naleak_HH)+ NE(flu.N_sa_Napump)+NE(flu.N_sa_Na_NaT_GHK));
NE(flu.N_sa_K_tot)=(NE(flu.N_sa_K_KDR_GHK)+ NE(flu.N_sa_K_KA_GHK)+NE(flu.N_sa_Kleak_HH)+ NE(flu.N_sa_Kpump));



% Total Na and K ion fluxes in dendrite
NE(flu.N_d_Na_tot)= (NE(flu.N_d_Na_NaP_GHK)+NE(flu.N_d_Naleak_HH)+ NE(flu.N_d_Napump))+ NE(flu.N_d_Na_NMDA_GHK);
NE(flu.N_d_K_tot)= (NE(flu.N_d_K_KDR_GHK)+ NE(flu.N_d_K_KA_GHK)+NE(flu.N_d_Kleak_HH)+ NE(flu.N_d_Kpump))+ NE(flu.N_d_K_NMDA_GHK);



%Total ion fluxes in soma and dendrite

NE(flu.N_sa_tot) =NE(flu.N_sa_Na_tot)+ NE(flu.N_sa_K_tot)+ NE(flu.N_sa_Cl_tot);
NE(flu.N_d_tot) = NE(flu.N_d_Na_tot)+ NE(flu.N_d_K_tot)+ NE(flu.N_d_Cl_tot);

NE(flu.N_diffusion)=lam.*(state(ind.N_e_K)-Kreg);

%Fluxes in the neuron model 2


NE(flu.N2_Nae_conc) = 144- Beta.*(state(ind.N2_Nai)-18);
NE(flu.N2_Ki_conc) = 140+(18-state(ind.N2_Nai));
NE(flu.N2_E_Na) = ph.*log(NE(flu.N2_Nae_conc)./state(ind.N2_Nai));
NE(flu.N2_E_K) = ph.*log(state(ind.N2_Ke)./NE(flu.N2_Ki_conc));
NE(flu.N2_E_Cl) =ph.*log(Cli./Clo);
NE(flu.N2_Na_m1a1) = 0.1.*(state(ind.N2_Em)+30)./(1-exp(-0.1.*(state(ind.N2_Em)+30)));
NE(flu.N2_Na_m1b1) =4.*exp(-(state(ind.N2_Em)+55)/18);
NE(flu.N2_Na_h1a1) =0.07.*exp(-(state(ind.N2_Em)+44)./20);
NE(flu.N2_Na_h1b1)= 1/(1+exp(-0.1.*(state(ind.N2_Em)+14)));
NE(flu.N2_K_n1a1) =0.01.*(state(ind.N2_Em)+34)./(1-exp(-0.1.*(state(ind.N2_Em)+34)));
NE(flu.N2_K_n1b1) =0.125.*exp(-(state(ind.N2_Em)+44)./80);
NE(flu.N2_Na_m_inf) =NE(flu.N2_Na_m1a1) ./(NE(flu.N2_Na_m1a1) +NE(flu.N2_Na_m1b1));
NE(flu.N2_Na) = g_Na.*(NE(flu.N2_Na_m_inf))^3.*state(ind.N2_Na_h1).*(state(ind.N2_Em)-NE(flu.N2_E_Na))+g_NaL.*(state(ind.N2_Em)-NE(flu.N2_E_Na));
NE(flu.N2_K) =(g_K.*state(ind.N2_K_n1)^4).*(state(ind.N2_Em)-NE(flu.N2_E_K))+g_KL.*(state(ind.N2_Em)-NE(flu.N2_E_K));
NE(flu.N2_NaL)=-g_Na.*(NE(flu.N2_Na_m_inf))^3.*state(ind.N2_Na_h1).*(state(ind.N2_Em)-NE(flu.N2_E_Na))./(state(ind.N2_Em)-NE(flu.N2_E_Na));
NE(flu.N2_KL)=-(g_K.*state(ind.N2_K_n1)+ (g_AHP.*state(ind.N2_Cai)./(1+state(ind.N2_Cai)))).*(state(ind.N2_Em)-NE(flu.N2_E_K))./(state(ind.N2_Em)-NE(flu.N2_E_K));

NE(flu.N2_Cl) =g_ClL.*(state(ind.N2_Em)-E_Cl);
NE(flu.N2_pump) =(ro./(1+exp((25-state(ind.N2_Nai))./3))).*(1./(1+exp(5.5-state(ind.N2_Ke))));
NE(flu.N2_glia) =G_glial./(1+exp((18-state(ind.N2_Ke))./2.5));
NE(flu.N2_diffusion)=sig.*(state(ind.N2_Ke)-(k_inf));


%BOLD response fluxes
NE(flu.V_CBF_Norm)=NE(flu.V_CBF)./0.03219;
NE(flu.N_TissueOxy_Norm)=state(ind.N_O2)./0.02271;
NE(flu.V_CMRO2)=((CBF_init.*NE(flu.N_P_O2).*(1-gamm))+(CBF_init.*NE(flu.N_P_O2).*gamm.*((NE(flu.N_sa_r1_pump)+NE(flu.N_d_r1_pump))./(NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init)))));
NE(flu.V_CMRO2_Norm)=((CBF_init.*NE(flu.N_P_O2).*(1-gamm))+(CBF_init.*NE(flu.N_P_O2).*gamm.*((NE(flu.N_sa_r1_pump)+NE(flu.N_d_r1_pump))./(NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init)))))./((CBF_init.*NE(flu.N_P_O2).*(1-gamm))+(CBF_init.*NE(flu.N_P_O2).*gamm.*((NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init))./(NE(flu.N_sa_r1_pump_init)+NE(flu.N_d_r1_pump_init)))));
NE(flu.B_dhb_Norm)=state(ind.B_dhb)./1.029;%0.9992
NE(flu.B_CBV_Norm)=state(ind.B_CBV)./0.9954;%1

NE(flu.N_MRI_BOLD)=V0.*100.*(aa1.*(1-NE(flu.B_dhb_Norm))-aa2.*(1-NE(flu.B_CBV_Norm)));% percentage of BOLD signal change
NE(flu.N_OEF)= (NE(flu.V_CMRO2_Norm).*0.4)./NE(flu.V_CBF_Norm);
NE(flu.N_relativechange)=NE(flu.V_CBF_Norm)./NE(flu.V_CMRO2_Norm);
NE(flu.N_MRI_BOLD1)=A.*(1-(NE(flu.V_CBF_Norm))^(-1.1).*((NE(flu.V_CBF_Norm)).*(NE(flu.N_OEF)./E_0))^(1.5));
NE(flu.N_Glia_Buffer) = G_glia./(1+exp((18-(state(ind.N_e_K)))./2.5));

NE(flu.N_Gtotsoma_Na)=(state(ind.N_sa_Na_NaP_m1_GHK)).^2.*state(ind.N_sa_Na_NaP_h1_GHK).*gNaP_GHk+(state(ind.N_sa_Na_NaT_m8_GHK)).^2.*state(ind.N_sa_Na_NaT_h6_GHK).*gNaT_GHk;
NE(flu.N_Gtotsoma_K)=(state(ind.N_sa_K_KDR_m2_GHK)).^2.*gKDR_GHk+(state(ind.N_sa_K_KA_m3_GHK)).^2.*state(ind.N_sa_K_KA_h2_GHK).*gKA_GHk;
NE(flu.N_Gtotden_Na)=state(ind.N_d_Na_NMDA_m5_GHK).*state(ind.N_d_Na_NMDA_h4_GHK).*gNMDA_GHk+(state(ind.N_d_Na_NaP_m4_GHK)).^2.*state(ind.N_d_Na_NaP_h3_GHK).*gNaP_GHk;
NE(flu.N_Gtotden_K)=(state(ind.N_d_K_KDR_m6_GHK)).^2.*gKDR_GHk+(state(ind.N_d_K_KA_m7_GHK)).^2.*state(ind.N_d_K_KA_h5_GHK).*gKA_GHk;
% %     
%% Calculate the fluxes for the Astrocyte (AC)

% Below all the additional equations are calculated and stores in NE, AC, SMC
% and EC
% NE=[];

                              % m

AC(flu.N_Cl_s) = state(ind.N_Na_s) + state(ind.N_K_s) - state(ind.N_HCO3_s);   % uMm


AC(flu.Na_k  ) = state(ind.N_Na_k)  /state(ind.R_k);  % uM
AC(flu.K_k   ) = state(ind.N_K_k)   /state(ind.R_k);  % uM
AC(flu.HCO3_k) = state(ind.N_HCO3_k)/state(ind.R_k);  % uM
AC(flu.Cl_k  ) = state(ind.N_Cl_k)  /state(ind.R_k);  % uM
AC(flu.Na_s  ) = state(ind.N_Na_s)  /AC(flu.R_s);     % uM
AC(flu.K_s   ) = state(ind.N_K_s)   /AC(flu.R_s);     % uM 
AC(flu.HCO3_s) = state(ind.N_HCO3_s)/AC(flu.R_s);     % uM
AC(flu.Cl_s  ) = AC(flu.N_Cl_s)     /AC(flu.R_s);     % uM

AC(flu.E_Na_k ) = (R_gas * Temp) / (z_Na * Farad) * log(AC(flu.Na_s)/AC(flu.Na_k)); % V
AC(flu.E_K_k )  = (R_gas * Temp) / (z_K  * Farad) * log(AC(flu.K_s )/AC(flu.K_k )); % V
AC(flu.E_Cl_k ) = (R_gas * Temp) / (z_Cl * Farad) * log(AC(flu.Cl_s)/AC(flu.Cl_k)); % V
AC(flu.E_NBC_k )= (R_gas * Temp) / (z_NBC* Farad) * ...
              log((AC(flu.Na_s)*AC(flu.HCO3_s)^2)/(AC(flu.Na_k)*AC(flu.HCO3_k)^2));     % V 
AC(flu.E_BK_k)  = (R_gas * Temp) / (z_K  * Farad) * log(state(ind.K_p)/AC(flu.K_k));% V




AC(flu.J_NaK_k  ) = J_NaK_max * Hill(AC(flu.Na_k), K_Na_k, 1.5) * ...
                Hill(AC(flu.K_s),K_K_s,1);              % uMm s-1 

AC(flu.v_k )   = ( g_Na_k  * AC(flu.E_Na_k )...
             + g_K_k   * AC(flu.E_K_k  )...
             + g_Cl_k  * AC(flu.E_Cl_k )...
             + g_NBC_k * AC(flu.E_NBC_k)...
             - AC(flu.J_NaK_k)*Farad/unitcon...
             + g_BK_k *state(ind.w_k) * AC(flu.E_BK_k)          )...
            /(g_Na_k + g_K_k + g_Cl_k + g_NBC_k + g_BK_k*state(ind.w_k));  % V

       
AC(flu.J_KCC1_k ) = getRef(t,'fluxft')*...
                (R_gas * Temp * g_KCC1_k) / (Farad^2) * log((AC(flu.K_s)...
                *AC(flu.Cl_s))/(AC(flu.K_k)*AC(flu.Cl_k)))*unitcon;                  %uMm s-1
%             AC(flu.J_KCC1_k ) =(R_gas * Temp * g_KCC1_k) / (Farad^2) * log((AC(flu.K_s)...
%                 *AC(flu.Cl_s))/(AC(flu.K_k)*AC(flu.Cl_k)))*unitcon;                  %uMm s-1

AC(flu.J_NBC_k  ) = g_NBC_k / Farad * (AC(flu.v_k) - AC(flu.E_NBC_k))*unitcon;       %uMm s-1
AC(flu.J_NKCC1_k) = getRef(t,'fluxft')*...
                (g_NKCC1_k * R_gas * Temp) / (Farad^2) ...
                * log((AC(flu.K_s) * AC(flu.Na_s) * AC(flu.Cl_s)^2)...
                     /(AC(flu.K_k) * AC(flu.Na_k) * AC(flu.Cl_k)^2))*unitcon;        %uMm s-1  

%                 AC(flu.J_NKCC1_k) =(g_NKCC1_k * R_gas * Temp) / (Farad^2) ...
%                 * log((AC(flu.K_s) * AC(flu.Na_s) * AC(flu.Cl_s)^2)...
%                      /(AC(flu.K_k) * AC(flu.Na_k) * AC(flu.Cl_k)^2))*unitcon;        %uMm s-1
AC(flu.J_Na_k  ) = g_Na_k / Farad * (AC(flu.v_k) - AC(flu.E_Na_k))*unitcon;          %uMm s-1
AC(flu.J_K_k   ) = g_K_k  / Farad * (AC(flu.v_k) - AC(flu.E_K_k ))*unitcon;          %uMm s-1
AC(flu.J_BK_k)   = g_BK_k / Farad * state(ind.w_k)*(AC(flu.v_k)-AC(flu.E_BK_k))*unitcon; %uMm s-1

AC(flu.w_inf)    = 0.5*(1+tanh((AC(flu.v_k)+v_6)/(v_4)));                        %[-]
AC(flu.phi_w)    = psi_w*cosh((AC(flu.v_k)+v_6)/(2*v_4));                        %s-1


%% SMC

SMC(flu.M)                   = 1 - state(ind.Mp) - state(ind.AM) - state(ind.AMp);                         
SMC(flu.E_K_i)              = (R_gas * Temp) / (z_K  * Farad)*unitcon*log(state(ind.K_p)/state(ind.K_i));
SMC(flu.h_r)                 = 0.1* state(ind.R);

SMC(flu.v_coup_i)            = - g_hat * ( state(ind.v_i) - state(ind.v_j) );   
SMC(flu.Ca_coup_i)           = - p_hat * ( state(ind.Ca_i) - state(ind.Ca_j) );
SMC(flu.IP3_coup_i)          = - p_hatIP3 * ( state(ind.I_i) - state(ind.I_j) );
SMC(flu.rho_i)              = 1;%( K_d + state(ind.Ca_i ))^2 / ( ( K_d + state(ind.Ca_i) )^2 + ( K_d * B_T ) );
SMC(flu.J_IP3_i)            = Fmax_i * ( state(ind.I_i)^2 ) / ( Kr_i^2 + state(ind.I_i)^2 );
SMC(flu.J_SRuptake_i)       = B_i * ( state(ind.Ca_i)^2 ) / ( state(ind.Ca_i)^2 + cb_i^2 );
SMC(flu.J_CICR_i)           = C_i *  ( state(ind.s_i)^2 ) / ( sc_i^2 + state(ind.s_i)^2 ) *  ( state(ind.Ca_i)^4 ) / ( cc_i^4 + state(ind.Ca_i)^4 );
SMC(flu.J_extrusion_i)      = D_i * state(ind.Ca_i) * ( 1 + ( state(ind.v_i) - vd_i ) / ( Rd_i ) );
SMC(flu.J_leak_i)           = L_i * state(ind.s_i);
SMC(flu.J_VOCC_i)           = G_Ca * ( state(ind.v_i) - v_Ca1) / ( 1 + exp( - ( state(ind.v_i) - v_Ca2 ) / ( R_Ca ) ) );
SMC(flu.J_NaCa_i)           = G_NaCa * state(ind.Ca_i)* ( state(ind.v_i) - v_NaCa ) / ( state(ind.Ca_i) + c_NaCa );
SMC(flu.J_NaK_i)            = F_NaK;
SMC(flu.J_Cl_i)             = G_Cl * ( state(ind.v_i) - v_Cl );
SMC(flu.J_K_i)              = G_K * state(ind.w_i) * ( state(ind.v_i) - vK_i );
SMC(flu.Kactivation_i)      = ( state(ind.Ca_i) + c_w )^2 / ( (state(ind.Ca_i) + c_w)^2 + bet*exp(-(state(ind.v_i) - v_Ca3)/R_K) );
SMC(flu.J_degrad_i)         = k_i * state(ind.I_i);

if strcmp(stretch_ch,'ON') == 1
   SMC(flu.J_stretch_i)     = G_stretch/(1+exp(-alpha1*(P_str*state(ind.R)/SMC(flu.h_r) - sig0))) * (state(ind.v_i) - Esac);
elseif strcmp(stretch_ch,'OFF') == 1
   SMC(flu.J_stretch_i)     = 0;
end

if strcmp(only_Koenig,'OFF') == 1
   SMC(flu.v_KIR_i)    = z_1 * state(ind.K_p)/unitcon + z_2;                                               % mV
   SMC(flu.G_KIR_i)    = exp( z_5 * state(ind.v_i) + z_3 * state(ind.K_p)/unitcon + z_4 ); %exp( z_5 * state(ind.v_i) + z_3 * state(ind.K_p)/unitcon + z_4 );                     % pS pF-1 =s-1
   SMC(flu.J_KIR_i)    = F_il/gam * SMC(flu.G_KIR_i)*(state(ind.v_i)-SMC(flu.v_KIR_i));                                % mV s-1
elseif strcmp(only_Koenig,'ON') == 1
   SMC(flu.v_KIR_i)    = 0;
   SMC(flu.G_KIR_i)    = 0;
   SMC(flu.J_KIR_i)    = 0;
end

SMC(flu.K1_c)       = gam_cross*state(ind.Ca_i)^3;
SMC(flu.K6_c)       = SMC(flu.K1_c);

%% EC

EC(flu.v_coup_j)             = - g_hat * ( state(ind.v_j) - state(ind.v_i) );  
EC(flu.Ca_coup_j)            = - p_hat * ( state(ind.Ca_j) - state(ind.Ca_i) );
EC(flu.IP3_coup_j)           = - p_hatIP3 * ( state(ind.I_j) - state(ind.I_i) );
EC(flu.rho_j)               = 1;%( K_d + state(ind.Ca_j) )^2 / ( ( K_d + state(ind.Ca_j) )^2 + ( K_d * B_T ) );
EC(flu.J_0_j)               = J0_j;
EC(flu.J_IP3_j)             = Fmax_j * ( state(ind.I_j)^2 ) / ( Kr_j^2 + state(ind.I_j)^2 );
EC(flu.J_ERuptake_j)        = B_j * ( state(ind.Ca_j)^2 ) / ( state(ind.Ca_j)^2 + cb_j^2 );
EC(flu.J_CICR_j)            = C_j *  ( state(ind.s_j)^2 ) / ( sc_j^2 + state(ind.s_j)^2 ) *  ( state(ind.Ca_j)^4 ) / ( cc_j^4 + state(ind.Ca_j)^4 );
EC(flu.J_extrusion_j)       = D_j * state(ind.Ca_j); 
EC(flu.J_leak_j)            = L_j * state(ind.s_j);
EC(flu.J_cation_j)          = G_cat * ( E_Ca - state(ind.v_j) )* 0.5 * ( 1 + tanh(( log10( state(ind.Ca_j) ) - m3cat )/( m4cat)) );
EC(flu.J_BKCa_j) 			= 0.4/2 * ( 1 + tanh( ( (  log10(state(ind.Ca_j)) - c) * ( state(ind.v_j) - b ) - a1 ) / ( m3b*( state(ind.v_j) + a2 * ( log10( state(ind.Ca_j )) - c ) - b )^2 + m4b ) ) );
EC(flu.J_SKCa_j) 			= 0.6/2 * ( 1 + tanh( ( log10(state(ind.Ca_j)) - m3s ) / ( m4s ) ) );
EC(flu.J_K_j)               = G_tot * ( state(ind.v_j) - vK_j ) * ( EC(flu.J_BKCa_j) + EC(flu.J_SKCa_j) );
EC(flu.J_R_j)               = G_R * ( state(ind.v_j) - v_rest);
EC(flu.J_degrad_j)          = k_j * state(ind.I_j);

if strcmp(stretch_ch,'ON') == 1
   EC(flu.J_stretch_j)      = G_stretch/(1+exp(-alpha1*(P_str*state(ind.R)/SMC(flu.h_r) - sig0))) * (state(ind.v_j) - Esac);
elseif strcmp(stretch_ch,'OFF') == 1
   EC(flu.J_stretch_j)      =  0;
end
end


%    A function that corrects for negative concentrations and sets them to 1e-180
%    Note that, when the system is running correctly this function is not
%    used.


function out = negCheck(input,wx)
    if (input / wx) > 0
        out = input/wx;
    else
        out = 1e-180;
    end
end











