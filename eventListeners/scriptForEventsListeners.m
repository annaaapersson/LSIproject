% X = 1:10;
% Y = 1:10;
% data = struct('XData', X, 'YData', Y);
% eventData = MyEventData(data);
% l = addlistener(a, 'MyEvent', @(evtSrc,evtData)dsip(evtData.Data));

M = myClass;
myListener = addlistener(M, 'myEvent', @myListenerCallback);
getDataAndNotify(M)