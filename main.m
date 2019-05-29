close all
clear
clc
addpath(genpath(cd))
%% load the data
% load newfeatures_all.mat
load newfeatures3.mat

data= newfeatures;
% data=data(randperm(size(data,1)),:);
% load features and normalise them
[Table]=tabledata((data));
%% divide the features into testing and trainig
features=Table(:,1:size(Table,2)-1);
labels=Table(:,end);
% features=features(:,randperm(size(features,2)));

newfeatures=features;
newlabels=labels;
for ii=1:size(features,2)       %remove any Nan value in sample
    index=isnan(features(:,ii));
    if find(index)
        newfeatures((index),:)=[];
        newlabels(index)=[];
    end
end
% convert the labels into multiclass
multiclass=labelPreProcess(newlabels);
[trainInd,~,testInd]=dividerand(size(newfeatures,1),0.8,0,0.2); %randomly divide the data
traindata=newfeatures(trainInd,:);              %training data
trainlabels=multiclass(trainInd,:);                   %training labels
testdata=newfeatures(testInd,:);                %testing data
testlabels=multiclass(testInd,:);                     %testing label
%%
features_new=mySMOTE([features,newlabels],100,10,newlabels);
multiclass_new=labelPreProcess(features_new(:,end));
[NNacc,predictedLables_raw]=NNscript_new(features_new,multiclass_new);
predictedLables=vec2ind(predictedLables_raw);
disp(['Detection Accuracy = ',num2str(NNacc*100),'%'])

