function [funcVals, functionTable, partialTable] = func_Eval( func, functionName, errorFunc, partials, paramValues, errorValues) 
    
    variableNames = keys( paramValues );
    errorNames = keys( errorValues );
    numVars = numel( variableNames );
    numError = numel( errorNames );
    
    partialNames = cell( numError, 1 );

    for i = 1:numVars
        partialNames{ i } = sprintf( '%s(%spartial %s%s)','\','\', variableNames{ i }, '\');
    end 
    numRows = numel( paramValues( sprintf( "%s", variableNames{ 1 } ) ) );
    
    funTableData = zeros( numRows, numVars + 1 );
    partialTableData = zeros( numRows, numError );
    errorTableData = zeros( numRows, 1 );

    for i = 1:numRows
        for j = 1:numVars
            currVar = sprintf( "%s", variableNames{ j } );
            currValues = paramValues( currVar );
            assignin( "base", currVar, currValues( i ) );
            funTableData( i, j ) = currValues( i );
        % error assignment 
            currError = sprintf( "%s", errorNames{ j } );
            currValue = errorValues( currError );
            assignin( "base", currError, currValue( i ) );
        end 
        funTableData( i, end ) = vpa( subs( func ) );
        partialTableData( i, : ) = vpa( subs( partials) );
        errorTableData( i ) = vpa( subs( errorFunc ) );
    end 
    funcVals = [funTableData( :, end ), errorTableData( :, end )];
    funTableData = [funTableData, errorTableData];
    variableNames = cat( 2, variableNames, functionName, sprintf('%ssigma_{%s}', '\', functionName ) );
    for i = 1:numel( variableNames )
        variableNames{ i } = sprintf( '%s( %s %s)', '\', variableNames{ i }, '\');
    end
    functionTable = array2table( funTableData, "VariableNames", variableNames );
    partialTable = array2table( partialTableData, "VariableNames", partialNames );
end

