function hc = gethc(kfluid, R, Nu)
    
    hc = ( kfluid ./ R ) .* Nu;
end

