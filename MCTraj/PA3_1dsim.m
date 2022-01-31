function [] = PA3_1dsim()
    clear all
    close all
    %UNFINISHED%

    global C

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²

    %nSims = 100;
    %MaxC = 10000;    
    
    nT = 50;
    x = 0;
    v = 0;
    xp = 0;
    F = 1;
    m =1;
    dt = 1;
    np = 1;
    t = 0;

    q1 = F/m*dt;
    q2 = (F/m*dt^2)/2;

    for n = 2: nT
        t(n) = t(n-1)+dt;
        v(:,n) = v(:,n-1) + q1;
        x(:,n) = x(:,n-1) + v(:,n-1)*dt + q2;
        r = rand(1)/10 < 0.05;
        %if r < 0.05 % TRIED THIS BUT DON'T KNOW WHY IT DID NOT WORK
        v(r,n) = 0;
        %end
        vdx = (x(:,n)-x(:,n-1)) / dt;

        subplot(3,1,1),plot(t,v(1,:)); hold on
        xlabel('time');
        ylabel('velocity');
        hold off
        subplot(3,1,2),plot(t,x(1,:)); hold on
        xlabel('time');
        ylabel('position');
        hold off
        subplot(3,1,3),plot(t,vdx); hold on
        grid on; % NO IDEA WHY I DID NOT GET A GRAPH
        
    end