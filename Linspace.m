TorqueHip = zeros(146,181);
TorqueKnee = zeros(146,181);
SplayAngle = 0;

X = -140:1:40;
Y = 15:1:160;

for x = X
    for y = Y
        [TorqueHip(-14+y,141+x),TorqueKnee(-14+y,141+x),c] = TorqueCalcs(x,y,SplayAngle);
    end
end

close all;
figure();
surf(X, Y, TorqueHip);
xlabel("HipAngle");
ylabel("KneeAngle");
title("Hip Torque");

figure();
surf(X, Y, TorqueKnee);
xlabel("HipAngle");
ylabel("KneeAngle");
title("Knee Torque");