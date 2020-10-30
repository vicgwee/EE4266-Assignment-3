function out = findMiddleCoefs(in,n_coefs)
%FINDMIDDLECOEFS Selects the middle n_coefs of in and places them in out.
    start = uint16(length(in)/2 - n_coefs/2 + 1);
    stop = uint16(length(in)/2 + n_coefs/2);
    out = in(start:stop, 1);
end

