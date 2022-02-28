function tableToTex(table, fileName, caption, format)
%{ 
    Function for converting a matlab table into a latex table that uses the
    tabu package 

    table:    The table to be converted to a latex table 
              Function currently only supports tables of purely numeric data 
    fileName: The location where the table latex script will be written to 
    caption:  The caption you want the table to have as a string or char
              array
    format:   Options are long or short 
              long:  prints in scientific notation with an 8 digit mantissa
              short: prints 4 sigfigs after the decimal place behavior 
                     is slighlly magnitude dependant
%} 

    fid = fopen(fileName,'W');
    
    vars = table.Properties.VariableNames;
    data = table.Variables;
    [sets, numVars] = size(data);
    % Printing the headers for starting the table
    fprintf(fid, "\\begin{table}[H]\n");
    fprintf(fid, "\t\\centering\n");
    fprintf(fid, "\t\\begin{tabu}{|");
    % printing the column characters for the number of variables in the
    % table
    for i = 1:numVars
        fprintf(fid, "c|");
    end 
    fprintf(fid, "}\n\t\t\\hline\n");

    fprintf(fid, "\t\t%s", vars{1});
    for i = 2:numVars
        fprintf(fid, " & %s", vars{i});
    end 
    fprintf(fid, " \\\\\n\t\t\\hline\n");

    if isequal(format, "long")
        for i = 1:sets
            fprintf(fid, "\t\t%.4f ", data(i, 1));
            for j = 2:numVars
                fprintf(fid, "& %.4f ", data(i, j));
            end 
            fprintf(fid, "\\\\\n\t\t\\hline\n");
        end
    elseif isequal(format, "short")
        for i = 1:sets
            fprintf(fid, "\t\t%.4g ", data(i, 1));
            for j = 2:numVars
                fprintf(fid, "& %.4g ", data(i, j));
            end 
            fprintf(fid, "\\\\\n\t\t\\hline\n");
        end
    end 
    
    fprintf(fid, "\t\\end{tabu}\n");
    fprintf(fid, "\t\\caption{%s}\n", caption);
    fprintf(fid, "\t\\label{table:Number}\n");
    fprintf(fid, "\\end{table}\n");

    fclose(fid);
end