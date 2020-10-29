function z_inv = makeInvariant(z)
% z and z_inv are cell arrays of Fourier coefficients

z_inv = {};
for i=1:size(z,2)
    z_ = z{i};
    %Translation Invariance by ignoring first coefficient
    z_ = z_(2:end);
    %Scale Invariance by Normalising
    z_ = z_/z_(1);
    %Rotation Invariance by taking Magnitude
    z_inv{end+1} = abs(z_);
end
end


