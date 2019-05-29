%% This function load features and normalise them.
% The op matrix will be in format of
% _Image ID...... features (2-13)....... Feature label_
%%
function [Table]=tabledata(Table)

% normalise the features values which are from column 2 to 14 in the Table
% variable
features=Table(:,1:end-1);
cnt=1;
for ii=1:size(features,2) % remove those feature columns which are having more zeros
    index(ii)=numel(find(features(:,ii)));
    index_perc(ii)=(index(ii)/size(features,1))*100;
    if index_perc(ii)>50       % use only those features which have non zero values greater than 50%
        Table_final(:,cnt)=features(:,ii);
        if ii<size(Table,2)  % skipping the end label column
%             Table_final(:,cnt)= normalize(Table_final(:,cnt));% normalising the data
        end
        
        cnt=cnt+1;
    end
end
Table(:,1:end-1)= Table_final;

end