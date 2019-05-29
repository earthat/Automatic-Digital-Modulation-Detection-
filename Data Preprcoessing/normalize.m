function output= normalize(input)
for ii=1:size(input,2)
    output(:,ii)=(input(:,ii)-min(input(:,ii)))/(max(input(:,ii))-min(input(:,ii)));
end