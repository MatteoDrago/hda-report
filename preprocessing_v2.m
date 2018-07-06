%% HDA-PROJECT

clear; clc;
root = ".\OpportunityUCIDataset\dataset\";

%% import ADL sessions

for subject = 1:4
    for session = 1:5
        filename = root + "S" + int2str(subject) + "-ADL" + int2str(session) + ".dat";
        
        data = load(filename);
        features = data(:,[2:46 51:59 64:72 77:85 90:98 103:134]);
        labels = data(:,[244:250]);
        
        features(labels(:,1)==0,:) = [];
        labels(labels(:,1)==0,:) = [];
        filled_features = fillmissing(features,'spline');

        output = "prep\A_nonzero\S" + int2str(subject) + "-ADL" + int2str(session) + ".mat";
        
        save(output, 'filled_features', 'labels')
    end
end

%% import Drill sessions

for subject = 1:4
    filename = root + "S" + int2str(subject) + "-Drill.dat";
    data = load(filename);
    features = data(:,[2:46 51:59 64:72 77:85 90:98 103:134]);
    labels = data(:,[244:250]);
    
    features(labels(:,1)==0,:) = [];
    labels(labels(:,1)==0,:) = [];
    
    filled_features = fillmissing(features,'spline');
    output = "prep\A_nonzero\S" + int2str(subject) + "-Drill.mat";
    save(output, 'filled_features', 'labels')
end

