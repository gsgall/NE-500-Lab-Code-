function [TmeltClad, TmeltFuel] = getMinMelt(U, rho, mu, Cp, kfluid, step, Rv, Rfoc, Rg, R, T_infinity, q, kc, k, Hg )
    
    range = 0:step:R;
    G = U ./ rho; 
    Re = getRe( G, R, mu );
    Pr = getPr(Cp, mu, kfluid);
    Nu = getNu(Re, Pr);
    hc = gethc(kfluid, R, Nu);
    

    Tclad = cladProfile( range, T_infinity, q, Rv, Rfoc, Rg, R, kc, hc);
    Tfuel = fuelProfile( range, T_infinity, q, Rv, Rfoc, Rg, R, kc, hc, k, Hg);
    
    TmeltClad = max( Tclad );
    TmeltFuel = max( Tfuel );
end

