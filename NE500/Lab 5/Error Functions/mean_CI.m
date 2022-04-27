function [dataMean, CI] = mean_CI(p, data)
    
    p = 1 - ((1 - p) / 2);
    dataMean = mean(data, 'all');
    
    N = numel(data);

    t = tinv(p, N - 1);

    sigma = sqrt( sum( (data - dataMean).^2, 'all' ) / ( N - 1 ) );
    
    CI = t * sigma / sqrt( N );

end

