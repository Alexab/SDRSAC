% Demo Program for the paper: 
%   SDRSAC: Semidefinite-Based Randomized Approach for Robust Point Cloud
%   Registration without Correspondences - Huu Le, Thanh-Toan Do, Tuan
%   Hoang and Ngai-Man Cheung - CVPR 2019
%       
%   

clear;

dataset = 'synthetic';
method = 'SDRSAC';          % Without Correspondences




% Read configuration containing hyperparameters
config = readGenConfig('./data/gen_config.mat');
    
%config = readConfig(dataset); 

% Read Data
load(config.matPath);

% Run SDRSAC
out = pointCloudReg(D, M, config, method);

output_matrix = zeros(4,4);

if (out.inls>0)
    for i=1:3
        for j=1:3
            output_matrix(i,j)=out.R(i,j);
        end
        output_matrix(i,4) = out.T(i);
    end
    output_matrix(4,4)=1.0
end

writematrix(output_matrix, "./data/output.txt",'Delimiter','tab');

disp(out);
