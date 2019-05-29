function multiclass=labelPreProcess(newlabels)
% converting into multiclass
[class]=unique(newlabels);
multiclass=zeros([size(newlabels,1),numel(class)]);
for ii=1:numel(class)
    multiclass(newlabels==class(ii),ii)=1;
end