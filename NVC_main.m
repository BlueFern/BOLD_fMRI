clean
tic
% global variables
global CASE J_PLC startpulse lengthpulse C_Hillmann stretch_ch only_Koenig

%% Parameters to adjust the model:
t_start     = 0;
t_end       = 200;
startpulse  = 1000;  % (s) 
lengthpulse = 40;  % (s) 
CASE        = 2;    % (see all_constants.m for details)
J_PLC 		= 0.18;  % (muM s-1) EC agonist concentration  
C_Hillmann  = 1;    % scaling factor for the Hai&Murphy rate constants (see all_constants.m for details)
stretch_ch  = 'ON'; % choose 'ON'/'OFF' to activate/deactivate stretch-activated channels in EC and SMC
only_Koenig = 'OFF';% choose 'ON'/'OFF' to simulate only the Koenigsberger model (other sub-models will still be considered, but the KIR channel is set to 0)

%% load the constants for the fluxes and pointers:
all_indices();
all_constants();
%% load the initial conditions of the system:
state0 = InitCond();
%% Ensure single filenames for the writing of data in other files
global csvfilename
csvfilename = 'Data_simulation.csv';
try
delete(csvfilename) % remove file, if present from older simulation.
end
%% Solve the proces from initial position tot Steady State:
options = odeset('OutputFcn',@odeprogWD,'Events',@odeabort,'Stats','on','RelTol', 1e-3, 'AbsTol', 1e-6, 'MaxStep', 1); 
[t,state] = ode15s(@DEsyst,[t_start t_end],state0,options);



%% Write output and info to file/cmd
output.info.completiontime = toc;
fprintf('ODE solution time: %.3f seconds\n', output.info.completiontime)

% % Plot statement:
% plot_all()
% hold all

% %% plot all of neuron model's state variables:
% 
% figure(8);
% set(gcf,'Name','Neuron Membrane potentials')
% for i = 25:26
% subplot(1,2,i-24)
% plot(time,state(:,i))
% ylabel(i)
% end
% 
% figure(9);
% set(gcf,'Name','Neuron Gating variables')
% for i = 27:38
% subplot(4,4,i-26)
% plot(time,state(:,i))
% ylabel(i)
% end
% 
% figure(10);
% set(gcf,'Name','Neuron Concentration of ions')
% for i = 39:64
% subplot(6,6,i-38)
% plot(time,state(:,i))
% ylabel(i)
% end

%% plot all of neuron model's state variables:
figure(7);
set(gcf,'Name','Astrocyte to radius')
for i = 2:24
subplot(5,5,i-1)
plot(t,state(:,i))
ylabel(i)
end
figure(8);
set(gcf,'Name','Neuron Membrane potentials')
for i = 25:26
    %% 
subplot(1,2,i-24)
plot(t,state(:,i))
ylabel(i)
end

figure(9);
set(gcf,'Name','Neuron Gating variables')
for i = 27:38
subplot(4,4,i-26)
plot(t,state(:,i))
ylabel(i)
end

figure(10);
set(gcf,'Name','Neuron Concentration of ions')
for i = 39:64
subplot(6,6,i-38)
plot(t,state(:,i))
ylabel(i)
end

%% plot all of neurons model's fluxes:

figure(11); 
set(gcf,'Name','Neuron Fluxes1-20')
for i = 1:20
subplot(4,5,i); 
plot(time,DATA(:,neoff+i)); 
ylabel(i)
end

figure(12); 
set(gcf,'Name','Neuron Fluxes21-40')
for i = 21:40
subplot(4,5,i-20); 
plot(time,DATA(:,neoff+i)); 
ylabel(i)
end

figure(13); 
set(gcf,'Name','Neuron Fluxes41-63')
for i = 41:62
subplot(5,5,i-40); 
plot(time,DATA(:,neoff+i)); 
ylabel(i)
end
figure(14); 
set(gcf,'Name','Neuron Fluxes64-66')
for i =63:128
subplot(10,10,i-62); 
plot(time,DATA(:,neoff+i)); 
ylabel(i)
end

% Extra plots of neuron model

figure(15)
set(gcf,'Name','Membrane potential ')
plot(time, state(:,ind.N_sa_Em) )
xlabel('time in s')
ylabel('Soma potential in mV')
title('Membrane potential')

figure(16)
set(gcf,'Name','Cerebral Blood Flow and Tissue oxygen Concentration ')
subplot(2,2,1)
plot(time, DATA(:,neoff+flu.V_CBF_Norm),time, DATA(:,neoff+flu.V_CMRO2_Norm) )
xlabel('Time [s]')
ylabel('Normalized CBF and CMRO_2')
title('A.Normalized CBF and CMRO_2')
legend('CBF','CMRO_2')
hold all
subplot(2,2,2)
plot(time, state(:,ind.N_O2))
xlabel('Time [s]')
ylabel('O_2 concentration(mM)')
title('B.Tissue oxygen concentration')
subplot(2,2,3)
plot(time, DATA(:,neoff+flu.N_relativechange))
xlabel('Time [s]')
ylabel('\DeltaCBF /\DeltaCMRO2')
title('C.Relative change of CBF to CMRO2')
subplot(2,2,4)
plot(time, DATA(:,neoff+flu.N_MRI_BOLD))
xlabel('Time [s]')
ylabel('\DeltaBOLD signal(%) ')
title('D.BOLD response')

figure(17)

set(gcf,'Name','Neural activation to vascular response ')
subplot(3,2,1)
plot(time, state(:,ind.N_sa_Em) )
xlabel('Time [s]')
ylabel('V_{soma} [mV]')
title('A.Membrane potential of soma')

subplot(3,2,2)
plot( time,0.001*DATA(:,acoff+flu.K_s));
title('B.[K^+] in synaptic space')
xlabel('Time [s]')
ylabel('[K^+]_s [mM]')
hold all

subplot(3,2,3)
plot(time,(DATA(:,acoff+flu.J_BK_k)./(DATA(:,stoff+ind.R_k))))
title('C.K^+ flux through the BK channel')
xlabel('Time [s]')
ylabel('K^+ flux [\muM/s]')
hold all

% subplot(3,2,4)
% plot(time,0.001*DATA(:,stoff+ind.K_p))
% title('D.[K^+] in perivascular space')
% xlabel('Time [s]')
% ylabel('[K^+]_p [mM]')
% hold all

subplot(3,2,4)
plot(time,DATA(:,smcoff+flu.J_KIR_i))
title('D.K^+ flux through the KIR channel')
xlabel('Time [s]')
ylabel('K^+ flux [\muM m/s]')
hold all

% subplot(4,2,6)
% plot(time, state(:,ind.v_i) )
% xlabel('Time [s]')
% ylabel('V_{SMC} [mV]')
% title('F.Membrane voltage smooth muscle cell')
% hold all

subplot(3,2,5)
plot(time, state(:,ind.Ca_i) )
title('E.[Ca^{2+}] in smooth muscle cell')
xlabel('Time [s]')
ylabel('[Ca^{2+}]_i [\muM]')
hold all

subplot(3,2,6)
plot(time,1e6*state(:,ind.R))
title('F.Radius')
xlabel('Time [s]')
ylabel('Radius [\mum]')
%axis([0 250 15 27])
hold all
% axis([0 250 15 27])

figure(18)
set(gcf,'Name','The BOLD response ')
subplot(2,2,1)
plot(time, DATA(:,neoff+flu.V_CBF_Norm),'-',time, DATA(:,neoff+flu.V_CMRO2_Norm),'-.',time, DATA(:,neoff+flu.B_CBV_Norm),'--')
xlabel('Time [s]')
ylabel('Normalized CBF,CMRO2 and CBV')
title('A.CBF,CMRO2 and CBV ')
legend('CBF','CMRO2','CBV')
subplot(2,2,2)
plot(time, DATA(:,neoff+flu.N_OEF))
xlabel('Time [s]')
ylabel('OEF ')
title('B.Oxygen extraction fraction')
subplot(2,2,3)
plot(time, state(:,ind.B_dhb))
xlabel('Time [s]')
ylabel('Deoxyhb ')
title('C.Deoxyhemoglobin')
subplot(2,2,4)
plot(time, DATA(:,neoff+flu.N_MRI_BOLD))
xlabel('Time [s]')
ylabel('\DeltaBOLD signal(%) ')
title('BOLD response')

% figure(25)
% [AX2,H12,H23] = plotyy(DATA(:,neoff+flu.V_CBF)...
%     ,time, state(:,ind.N_O2)...
%     );
% xlabel('Time [s]')
% set(get(AX2(1),'Ylabel'),'CBF in mM/s') 
% set(get(AX2(2),'Ylabel'),'Tissue O2 in mM')
% title('Cerebral blood flow and Tissue oxygen concentration')
[v,T,vT]=xlsread('hipBOLD.csv');%experimental data
t=v(:,1);y=v(:,2);z=v(:,3);
y=(y-786)./786.*100;%percentage change from steady state
% figure(19)
% set(gcf,'Name','Comparing the BOLD response ')
% plot(t,y,time, DATA(:,neoff+flu.N_MRI_BOLD));
% xlabel('Time [s]')
% ylabel('\DeltaBOLD signal(%)')
% title('Comparing Experimental and Simulated BOLD ')
% legend('Experimental ','Simulated')
%% save figures & parameters
%save_all()


% to create .tikz figures:
% matlab2tikz('test.tikz', 'height', '\figureheight', 'width', '\figurewidth');


% figure; plot(time,DATA(:,smcoff+flu.M)+state(:,ind.AMp)+state(:,ind.AM)+state(:,ind.Mp)); hold on;
% plot(time,DATA(:,smcoff+flu.M),'r'); plot(time,state(:,ind.Mp),'g'); plot(time,state(:,ind.AMp),'b');plot(time,state(:,ind.AM),'k');
% legend('Total Myosin','[M]','[Mp]','[AMp]','[AM]')
% title('New')

% to plot a single flux, type in plot(time,DATA(:,flu.(name))     
% to plot a single state variable, type in plot(time,state(:,ind.(name))
%(don't forget to put the offset!! e.g. smcoff+flu.1_c)
