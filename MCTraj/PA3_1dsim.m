function [] = PA3_1dsim(force,nSims)

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

    for n = 1: nSims
        x(1, :) = zeros(1, nTraj);
        y(1, :) = zeros(1, nTraj);
            for c=2:MaxC
    
            dvx = Wind(nTraj,WindParas)*dt;
            Vx = Vx + dvx;
            dx = Vx * dt;
    
            dvy = -g * dt;
            Vy = Vy + dvy;
            dy = Vy * dt + g * dt^2 / 2;
            
            if max(y(c - 1,:) + dy) <= 0
                break
            end
            
            x(c,:) = x(c - 1,:) + dx;
            y(c,:) = y(c - 1,:) + dy;
        end
    
        xl = [xl x(end, :)];
    end