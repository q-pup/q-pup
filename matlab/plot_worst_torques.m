% Reasonable walking gait joint angles
HipAngs  = -60:1:-40;
KneeAngs = 75:1:105;

TorqueHip = zeros(length(KneeAngs),length(HipAngs));
TorqueKnee = zeros(length(KneeAngs),length(HipAngs));
SplayAngle = 0;

for x = HipAngs
    for y = KneeAngs
        [TorqueHip(y-min(KneeAngs)+1,x-min(HipAngs)+1), ...
         TorqueKnee(y-min(KneeAngs)+1,x-min(HipAngs)+1), ...
         c] = torque_calc(x,y,SplayAngle,2);
    end
end

close all;
figure();
s1 = surf(HipAngs, KneeAngs, TorqueHip);
s1.EdgeColor = 'none';
xlabel("HipAngle");
ylabel("KneeAngle");
title("Hip Torque");

figure();
s2 = surf(HipAngs, KneeAngs, TorqueKnee);
s2.EdgeColor = 'none';
xlabel("HipAngle");
ylabel("KneeAngle");
title("Knee Torque");

display(max(TorqueHip,[],'all'))
display(max(TorqueKnee,[],'all'))



% Worst-case joint angles
HipAngs  = -140:1:40;
KneeAngs = 15:1:160;

TorqueHip = zeros(length(KneeAngs),length(HipAngs));
TorqueKnee = zeros(length(KneeAngs),length(HipAngs));
SplayAngle = 0;

for x = HipAngs
    for y = KneeAngs
        [TorqueHip(y-min(KneeAngs)+1,x-min(HipAngs)+1), ...
         TorqueKnee(y-min(KneeAngs)+1,x-min(HipAngs)+1), ...
         c] = torque_calc(x,y,SplayAngle,4);
    end
end

figure();
s1 = surf(HipAngs, KneeAngs, TorqueHip);
s1.EdgeColor = 'none';
xlabel("HipAngle");
ylabel("KneeAngle");
title("Hip Torque");

figure();
s2 = surf(HipAngs, KneeAngs, TorqueKnee);
s2.EdgeColor = 'none';
xlabel("HipAngle");
ylabel("KneeAngle");
title("Knee Torque");

display(max(TorqueHip,[],'all'))
display(max(TorqueKnee,[],'all'))
