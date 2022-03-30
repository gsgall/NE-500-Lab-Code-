function derivative = finiteDifference3( x, y, xoi, h )
    
    xidx = find( x == xoi, 1 ); 
    idx = xidx:xidx+3;

    %h = abs( x( xidx ) - x( xidx + 1 ) );
    A = -11 / 6;
    B = 3; 
    C = -3 / 2;
    D = 1 / 3;
    
    derivative = ( A .* y( idx( 1 ) ) + B .* y( idx( 2 ) ) + C .* y( idx( 3 ) ) + D .* y( idx( 4 ) ) ) / h; 
end

