% Script to generate one specific dataset that can then be calculated. The
% TSconfig struct points to one time series generator and includes the
% desired parameters such as number of TS, parameter values, etc.
%
% ------------------------------------------------------------------------------
% Copyright (C) 2018
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

% time series and HCTSA configuration
TSconfigs = {};

% deterministic oscillator
% TSconfigs = horzcat(TSconfigs, generateVanDerPolConfigs());

% % generate one set of ridiculously long ts with high sampling rate. Cut/
% % downsample/ add noise later.
% tsLens = [10000]; % [100, 300, 1000, 3000]; % [100, 300, 1000, 3000, 10000]; 
% FSs = [100]; % [1, 3, 10, 30, 100];
% etas = [0]; % [0.1, 0.3, 1, 3, 10]; % [0.1, 0.3, 1]
% for tsLen = tsLens
%     for Fs = FSs
%         for eta = etas
%             TSconfigs = horzcat(TSconfigs, generateVanDerPolConfigs_varyLenFsEta(tsLen, Fs, eta));
%         end
%     end
% end

% % stochastic
% TSconfigs = horzcat(TSconfigs, generateNoisySineWithLinearTrendConfigs());
% TSconfigs = horzcat(TSconfigs, generateNoisySineWithLinearTrendConfigs2());
% TSconfigs = horzcat(TSconfigs, generateNoisySineWithLinearTrendConfigs3());
% TSconfigs = horzcat(TSconfigs, generateNoisySineWithMeanShiftConfigs());
% TSconfigs = horzcat(TSconfigs, generateAutoregressiveConfigs());
TSconfigs = horzcat(TSconfigs, generateAutoregressiveConfigs2());
% TSconfigs = horzcat(TSconfigs, generateBimodalConfigs());
% TSconfigs = horzcat(TSconfigs, generatePopulationGrowthConfigs());
% TSconfigs = horzcat(TSconfigs, generatePopulationGrowthConfigs2()); % increased beta-rage

% % low dimensional chaos: maps
% TSconfigs = horzcat(TSconfigs, generateLogisticMapConfigs());
% TSconfigs = horzcat(TSconfigs, generateStochasticSineMapConfigs());
TSconfigs = horzcat(TSconfigs, generateStochasticSineMapConfigs2());
% TSconfigs = horzcat(TSconfigs, generatePredatorPreyConfigs());
TSconfigs = horzcat(TSconfigs, generatePredatorPreyConfigs2()); % no alpha

% % low dimensional chaos: flows
% TSconfigs = horzcat(TSconfigs, generateLorenzConfigs());
TSconfigs = horzcat(TSconfigs, generateLorenzConfigs2());
% TSconfigs = horzcat(TSconfigs, generateRosslerConfigs());
% TSconfigs = horzcat(TSconfigs, generateRosslerConfigs2());

% % high dimensional chaos
% TSconfigs = horzcat(TSconfigs, generateMackeyGlassConfigs()); % tau 10:40 now!

% misc
% TSconfigs = horzcat(TSconfigs, generatePowernoiseConfigs());

% jump to main dir and start computations
for i = 1:length(TSconfigs)
    createDataAndHCTSAMat(TSconfigs{i});
end