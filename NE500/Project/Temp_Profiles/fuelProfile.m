function Tfuel = fuelProfile( r, T_infinity, q, Rv, Rfoc, Rg, R, kc, hc, k, Hg)
    Tfuel = - ( q ./ ( 6 .* k ) ) .* ( r.^2 + 2 .* ( Rv.^3 ./ r ) );
    Tfuel = Tfuel + cladProfile( r, T_infinity, q, Rv, Rfoc, Rg, R, kc, hc) - ...
            ( q ./ (3 .* Hg .* Rg ) ) .* ( ( ( Rv.^3 ) ./ Rfoc ) - Rfoc.^2 ) + ...
            ( q ./ 6 ) .* ( Rfoc.^2  + 2 .* ( Rv.^3 ./ Rfoc ) );
            
end

