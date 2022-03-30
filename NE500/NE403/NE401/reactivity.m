function rho = reactivity( toi, time, Power, bigBeta, beta, bigLambda, lambda, derivativeFit)
    timeRange = 1:find( time == toi, 1 );
    times = time( timeRange);
    Powers = Power( timeRange );
    betaTerm = bigBeta; 
    derivativeTerm = bigLambda / Power( timeRange( end ) ) * derivativeFit( toi );
    integralTerm = - sum( ...
                         beta .* ( Power( 1 ) .* exp( - lambda .* toi )  +...
                          lambda .* trapz( times, Powers .* exp( - lambda .* ( toi - times ) ), 1 ) ...
                          ) )/ Power( timeRange( end ) ); 

    rho = betaTerm + derivativeTerm + integralTerm;
          
end

