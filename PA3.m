%{
% Author: Maharshi Gurjar
% ELEC 4700 - Modeling of Integrated Devices
% PA 3 - MonteCarlo PA Assignment
% not sure how to implement scattering
%}
close all; clc;
nRuns = 300; %number of simulation steps
t = 0; %inital time 
F = 1; % Force
m = 1; % Mass
dt = 1; % Time steps, aka 1 second
a = F/m*dt; % Acc wrt time
nParticles = 4;
re = 0;
V = zeros(1,nParticles); %Initalizes velosity as 0
X = zeros(1,nParticles) ; %Initalizes x-position as 0
Avg_Vel = zeros(1,nParticles);
for i = 2:nRuns
    for j = 1:nParticles
        t(i) = t(i-1)+dt; % moving through time
        V(i,j) = V(i-1,j) + a; % Current vel = previous vel + constant Vel
        X(i,j) = X(i-1,j) + V(i-1,j)*dt + (a^2)/2; % same indexing idea as above
        random = rand();
        if random < 0.05
                V(i,j) = re*V(i,j);
        end
        Avg_Vel(i,:) = mean(V,1);
    end
    %Plotting the first graph, Time vs V
    subplot(2,2,1), plot(t,V,'-'); %hold on;
    grid on;
    xlabel('Time');
    ylabel('Velocity');
    hold off;
    %Plotting the first graph, x-position (total) vs V
    subplot(2,2,2), plot(X,V,'-')
    grid on;
    xlabel('x-position (total)');
    ylabel('Velocity');
    %Plotting the first graph, x-position (total) vs Time
    subplot(2,2,3), plot(t,X,'-')
    grid on;
    xlabel('Time');
    ylabel('x-position (total)');
    subplot(2,2,4), plot(t,Avg_Vel)
    grid on;
    xlabel('Time')
    ylabel('Average Velocity')
    sgtitle(["Average velocity of particles: ",mean(Avg_Vel,"all")]);
    pause(0.1)
end