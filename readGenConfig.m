% Configurations for the algorithsm
% Input: 
%       configName:  Name of the config, corresponding to the desired
%       dataset
function config = readGenConfig(configName)

config = load(configName);
config.maxIter = double(config.maxIter);
config.innerIter = double(config.innerIter);
config.k = double(config.k);
config.pointPerSample = double(config.pointPerSample);
config.nPairThresh = double(config.nPairThresh);
config.syntheticN = double(config.syntheticN);
config.OutlierRate = double(config.OutlierRate);
config.SamplesForCongruent = double(config.SamplesForCongruent);  
plyMaps = containers.Map(); plyMapsB = containers.Map();
matMaps = containers.Map();

%plyMaps('bunny10') = './data/bun045.ply';
%plyMapsB('bunny10') = './data/bun045.ply';
matMaps('gen_data') = './data/gen_data.mat';

%config.plyPath = plyMaps(config.datasetName);
%config.plyPathB = plyMapsB(config.datasetName);
config.matPath = matMaps(config.datasetName);    
end