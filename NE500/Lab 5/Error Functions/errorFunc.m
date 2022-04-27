function [errorFunction, vars, errors, partials] = errorFunc(func)
%{
    func: the symbolic function of interest 
    data: the data in a map with each data set mapped to its respective 
          variable
    percent: the percentage confidence interval you are interested in as a 
             decimal 
             if you want a confidence interval of 95% enter .95   
%}
   
    vars = symvar( func );
    
    numVars = numel( vars );

    partials = sym( 'p', [1, numVars] );
    
    errors = string( zeros( 1, numVars ) );

    for i = 1:numVars 
        partials(i) = diff( func, vars(i) );

        errors(i) = sprintf( "sigma_%s", vars(i) );
    end 

    errors = sym(errors);

    errorFunction = sqrt( sum( errors.^2 .* partials.^2 ) ) ;
   
end

