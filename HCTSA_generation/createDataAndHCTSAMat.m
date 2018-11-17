function createDataAndHCTSAMat(config)

    % createDataAndHCTSAMat  
    %
    % Given information on which time series generator to use, now many time
    % series to generate of which length, etc., createDataAndHCTSAMat
    % generates the time series. It then generates the files initialisation 
    % files for HCTSA and an initialised HCTSA which are both saved into a 
    % folder inside the data folder specified in /config/globalParameters.mat.
    % HCTSA is _not_ run here.
    %
    %---INPUTS:
    % variableName, description
    %
    % ------------------------------------------------------------------------------
    % Copyright (C) 2017
    % Carl H. Lubba <carl.lubba@gmail.com> 
    % Ben D. Fulcher <ben.d.fulcher@gmail.com>
    %
    % If you use this code for your research, please cite:
    % B. D. Fulcher, M. A. Little, N. S. Jones, "Highly comparative time-series
    % analysis: the empirical structure of time series and their methods",
    % J. Roy. Soc. Interface 10(83) 20130048 (2013). DOI: 10.1098/rsif.2013.0048
    %
    % This work is licensed under the Creative Commons
    % Attribution-NonCommercial-ShareAlike 4.0 International License. To view a copy of
    % this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send
    % a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
    % California, 94041, USA.
    % ------------------------------------------------------------------------------

    % get save locations and some other global directions
    dataFolder = 'data';
    if exist(dataFolder, 'dir') ~= 7
       mkdir(dataFolder); 
    end

    %----------------------------------------------------------------------
    % Execute stuff -------------------------------------------------------
    %----------------------------------------------------------------------
    
    % time series parameters-----------------------------------------------
    
    functionName = config.functionName;
    signalNames = config.signalNames;
    
    nRealizations = config.nRealizations;
    
    paramNames = config.paramNames;
    params = config.params;

    timeParamNames = config.timeParamNames;
    timeParams = config.timeParams;
    
    % create folder to save into-------------------------------------------

    paramsFolderName = [];
    for paramInd = 1:length(params)
        
        paramVals = params{paramInd};
        
        switch (length(paramVals))
            case 1
                paramsFolderName = [paramsFolderName, ...
                    paramNames{paramInd}, '=', ...
                    num2str(paramVals), '_'];
            case 2
                paramsFolderName = [paramsFolderName, ...
                    paramNames{paramInd}, '=', ...
                    num2str(paramVals(1)), '-', ...
                    num2str(paramVals(2)), '_'];
            otherwise
                paramsFolderName = [paramsFolderName, ...
                    paramNames{paramInd}, '='];
                if length(paramVals) <= 5
                    for paramValInd = 1:length(paramVals)
                        paramsFolderName = [paramsFolderName, ...
                            num2str(paramVals(paramValInd)), ','];
                    end
                else
                   paramsFolderName = [paramsFolderName, ...
                            'discreteSetInRange', ...
                            num2str(paramVals(1)), ',...,', ...
                            num2str(paramVals(end))]; 
                end
                paramsFolderName = [paramsFolderName, '_'];
        end
                
    end

    timeParamsFolderName = [];
    for timeParamInd = 1:length(timeParams)
        timeParamsFolderName = [timeParamsFolderName, ...
            cell2mat(timeParamNames(timeParamInd)), '=', ...
            num2str(timeParams(timeParamInd))];

        if timeParamInd < length(timeParams)
            timeParamsFolderName = [timeParamsFolderName, '_'];
        end
    end

    if ~exist(dataFolder,'dir')
        mkdir(dataFolder)
    end
    
    numSignals = numel(signalNames);
    for signalInd =1:numSignals
    
        outputFolder{signalInd} = [dataFolder, '/', functionName, ...
            '_variable_', signalNames{signalInd}, '_', ...
            '_realizations=', num2str(nRealizations), '_', ...
            '_params_', paramsFolderName, ...
            '_timeParams_', timeParamsFolderName];

    end

    % compose function call------------------------------------------------

    % simulation time parameters
    timeParamsString = '';
    for timeParamsInd = 1:length(timeParams)
        
        timeParamsString = [timeParamsString, ...
            num2str(timeParams(timeParamsInd))];
        if timeParamsInd < length(timeParams)
            timeParamsString = [timeParamsString, ','];
        end
        
    end

    % output variable
    timeSeriesDataCell = cell(numSignals, nRealizations);
    labelsCell = cell(numSignals, nRealizations);
    keywordsCell = cell(numSignals, nRealizations);

    % create nRealizations time series
    index = 1;
    for i = 1:nRealizations

        fprintf('generating %i th time series.\n', i);
        
        paramsString = '';
        paramValues = [];
        for paramInd = 1:length(params)
            
            paramVals = params{paramInd};
            
            switch (length(paramVals))
                case 1
                    paramVal = paramVals;
                case 2
                    paramVal = paramVals(1) + ...
                        rand * (paramVals(2) - paramVals(1));
                otherwise
                    paramVal = datasample(paramVals, 1);
            end
            
            %save parameter value to add it as a keyword
            paramValues = [paramValues, paramVal];
            
            % compose function call substring
            paramsString = [paramsString, num2str(paramVal), ','];
            
        end
       
        command = ['signal1 = ', functionName, '(', ...
            paramsString, timeParamsString, ');'];

        % run single signal generation
        eval(command);

        % check if orientation right, transpose if not
        if size(signal1,1) > size(signal1,2)
            signal1 = signal1';
        end
        
        % add to signal, keyword and label cells
        nSignals = size(signal1,1);
        for signalInd = 1:nSignals

            % prepare addition to keyword and label cells
            labelString = [functionName, ',', cell2mat(signalNames(signalInd))];
            keywordString = labelString;
            for paramInd = 1:length(params)
                keywordString = [keywordString, ',', ...
                    paramNames{paramInd}, '=', ...
                    num2str(paramValues(paramInd))];
            end

            % add to cells
            timeSeriesDataCell{i, signalInd} = signal1(signalInd, :);
            labelsCell{i, signalInd} = [functionName, ',', ...
                cell2mat(signalNames(signalInd)), ',', num2str(index)];
            keywordsCell{i, signalInd} = keywordString;
            
            index = index + 1;
        end

    end
    
    % potential post processing -------------------------------------------
    if ismember('postprocessing', fieldnames(config))
        
        numberOfPostprocessingSteps = numel(config.postprocessing);
        for signalInd = 1:numSignals
            
            tsd_temp = timeSeriesDataCell(:, signalInd);
            kw_temp = keywordsCell(:, signalInd);
            l_temp = labelsCell(:, signalInd);
            
            if numel(config.postprocessing) == 1
               [tsd_temp, l_temp, kw_temp] = ...
                   config.postprocessing{1}(tsd_temp, l_temp, kw_temp); 
               
               % try to get an additional info to add to folder name
               try
                   [~, ~, ~, folderAdd] = config.postprocessing{1}(tsd_temp, l_temp, kw_temp); 
                   outputFolder{signalInd} = [outputFolder{signalInd}, folderAdd];
               catch
               end
            else
                for ppStep = 1:numberOfPostprocessingSteps
                    [tsd_temp, l_temp, kw_temp] = ...
                   config.postprocessing{ppStep}(tsd_temp, l_temp, kw_temp);
               
                   % try to get an additional info to add to folder name
                   try
                       [~, ~, ~, folderAdd] = config.postprocessing{1}(tsd_temp, l_temp, kw_temp); 
                       outputFolder{signalInd} = [outputFolder{signalInd}, folderAdd];
                   catch
                   end
               
                end
            end
            
            timeSeriesDataCell(:, signalInd) = tsd_temp;
            keywordsCell(:, signalInd) = kw_temp;
            labelsCell(:, signalInd) = l_temp;
            
        end
            
    end

    % save things----------------------------------------------------------
%     dataTrackerLocation = [dataFolder, '/', datasetTracker];
%     try 
%         outputFolders = importdata(dataTrackerLocation);
%         outputFolders = [outputFolders; outputFolder];
%         outputFolders = unique(outputFolders, 'rows');
%     catch
%         outputFolders = [outputFolder];
%     end
%     save(dataTrackerLocation, 'outputFolders');

    workingDir = pwd();
    
    for signalInd = 1:numSignals
    
        % check if target directory exists
        if exist(outputFolder{signalInd},'dir')
            x = input('Same parameters already run, overwriting results? (Y/n)', 's');
            if ~(isempty (x) || x == 'y' || x == 'Y')
                return
            end
        else
           mkdir(outputFolder{signalInd}) 
        end
        
        chdir(outputFolder{signalInd})
        
        timeSeriesData = timeSeriesDataCell(:, signalInd);
        keywords = keywordsCell(:, signalInd);
        labels = labelsCell(:, signalInd);
        
        save('INP_test.mat','timeSeriesData','keywords','labels');
        save('TSconfig.mat','config');

        % do HCTSA work--------------------------------------------------------

        TS_init('INP_test.mat');

        % remove stochastic, pos-only, length dependent features
        TS_local_clear_remove('ops',[ ...
            % TS_getIDs('tisean','raw','ops'), ...
            % TS_getIDs('locdep','raw','ops'), ...
            % TS_getIDs('posOnly','raw','ops'), ...
            TS_getIDs('stochastic','raw','ops')],1,'raw');

        %go back to main dir---------------------------------------------------
        chdir(workingDir);
        
    end
    
end

function runHCTSA(config)
    
    TS_compute(true,config.ts_ids,config.op_ids);

end

