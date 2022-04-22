function Pr = getPr(Cp, mu, kfluid)
    Pr = Cp .* mu ./ kfluid; 
end

