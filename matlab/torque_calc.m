function [TorqueHip,TorqueKnee,TorqueSplay] = torque_calc(HipAngle,KneeAngle,SplayAngle, ContactPoints)
    UpperLegLength = 0.4/2; %Units in m
    LowerLegLength = 0.35/2; %Units in m
    TotalWeight = 70; %Units in kg
    Gravity = [0 -9.81 0];

    HipAngle = deg2rad(HipAngle);
    KneeAngle = deg2rad(KneeAngle);

    BodyForce = (TotalWeight * Gravity) / ContactPoints;

    UpperLegVector = [UpperLegLength*sin(HipAngle),UpperLegLength*cos(HipAngle),0];
    LowerLegVector = [LowerLegLength*sin(KneeAngle + HipAngle),LowerLegLength*cos(KneeAngle + HipAngle),0];

    TorqueHip = cross((UpperLegVector + LowerLegVector),BodyForce);
    TorqueKnee = cross(LowerLegVector,BodyForce);
    TorqueSplay = sin(SplayAngle)* (UpperLegVector(2) + LowerLegVector(2)) * BodyForce;

    TorqueHip   = norm(TorqueHip);
    TorqueKnee  = norm(TorqueKnee);
    TorqueSplay = norm(TorqueSplay);

    % No backwards knees
    if (KneeAngle+HipAngle < 0)
        TorqueHip = nan;
        TorqueKnee = nan;
    end

    % No kneeling
    if (KneeAngle+HipAngle > pi/2)
        TorqueHip = nan;
        TorqueKnee = nan;
    end
end
