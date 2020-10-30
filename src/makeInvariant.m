function z_inv = makeInvariant(z)
% z and z_inv are cell arrays of Fourier coefficients

z_inv = {};
for i=1:size(z,2)
    z_ = z{i};
    %Translation Invariance by ignoring DC component
    z_(end/2 +1) = 0;
    %Rotation Invariance by taking Magnitude
    z_ = abs(z_);
    %Scale Invariance by Normalising
    z_inv{end+1} = z_/z_(end/2);
end
end


