clc;
clear;


%Initializing 
V = 0;
Sfront = 0;
Sside1 = 0;
Sside2 = 0;
Stop = 0;
Sbot = 0;
Sencl = 0;

rad=0;
phi=pi/4;
theta=pi/4;

radsteps = 1000;
phisteps = 1000;
thetasteps = 1000;

drad = (2-rad)/radsteps;
dphi = (pi/2-phi)/phisteps;
dtheta = (pi/2-theta)/thetasteps;

for k=1:radsteps
    for j=1:phisteps
        for i=1:thetasteps
            %both the radius and theta are changing, so make sure to update
            %and reset them in their respective loops
            V = V + (rad*sin(theta)*dphi)*(rad*dtheta)*(drad);
            theta = theta + dtheta;
        end
        rad = rad + drad;
        theta = pi/4;
    end
    rad = 0;
end
fprintf("Volume: %f \n", V);

radius1 = 0;
radius2 = 2;

theta = pi/4;
phi = pi/4;
for k=1:phisteps
    for j=1:thetasteps
        %here only the theta changes but the radius stays constant at r = 2
        Sfront = Sfront + (radius2)*(sin(theta)*dphi)*(radius2)*(dtheta);
        theta = theta + dtheta;
    end
    theta = pi/4;
end

fprintf("Front Surface: %f \n",Sfront);

rad = 0;
for k=1:radsteps
    for j=1:thetasteps
        %here the radius changes so it has to be updated
        %the sides are the same so equate them to the operations
        Sside1 = Sside1 + (rad)*drad*(dtheta);
        Sside2 = Sside2 + (rad)*drad*(dtheta);
    end
    rad = rad + drad;
end
fprintf("Side Surface(s): %f \n", Sside1);


rad = 0;
theta = pi/2;
for k=1:phisteps
    for j=1:radsteps
        %here the radius changes so it once again has to be updated while
        %theta stays constant at theta = pi/2
        Sbot = Sbot + (rad)*(sin(theta)*dphi)*(drad);
        rad = rad + drad;
    end
    rad = 0;
end
fprintf("Bot Surface: %f \n", Sbot);

rad = 0;
theta = pi/4;
for k=1:phisteps
    for j=1:radsteps
        %here the radius changes so it once again has to be updated while
        %theta stays constant at theta = pi/4
        Stop = Stop + (rad)*(sin(theta)*dphi)*(drad);
        rad = rad + drad;
    end
    rad = 0;
end
fprintf("Top Surface: %f \n", Stop);

%total enclosed surface area = sum of the area of each side
Sencl = Stop + Sbot + Sside1 + Sside2 + Sfront;
fprintf("Total enclosed: %f \n",Sencl);

     
        