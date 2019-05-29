function acc=evaluate(index,trainigdata ,trainiglabels,testingdata,testinglabels)
newtrainigdata=trainigdata(:,find(index));
newtestingdata=testingdata(:,find(index));
% create a neural network
n=10; % no og hidden neurons
net = feedforwardnet(n);

% configure the neural network for this dataset
net = configure(net, newtrainigdata', trainiglabels');
y=sim(net,newtestingdata');
y=round(y);
cp=classperf(testinglabels,y);
acc=cp.CorrectRate;