function Nu = getNu(Re, Pr)
    
    C = 0; 
    m = 0;
    if ( Re < 4e-1 || Re > 4e5 )
        error( "Invalid Assumption for flow regime\n");
    elseif ( Re >= 4e-1 && Re < 4 )
        C = 0.989; 
        m = 0.330;
    elseif ( Re >= 4 && Re < 4e1 )
        C = 0.911; 
        m = 0.385; 
    elseif ( Re >= 4e1 && Re < 4e3 )
        C = 0.683; 
        m = 0.466;
    elseif ( Re >= 4e3 && Re < 4e4 )
        C = 0.193;
        m = 0.618;
    elseif ( Re >= 4e4 && Re <= 4e5 )
        C = 0.027; 
        m = 0.805;
    end 

    Nu = C .* Re.^m .* Pr.^(1/3);
end

