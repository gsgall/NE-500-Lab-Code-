function Tgap = gapProfile(r, Rv, Rfoc, Tfuel, Tclad )
    
    Tgap = ( Tfuel - Tclad ) ./ ( Rv - Rfoc ) .* r + Tfuel;
end

