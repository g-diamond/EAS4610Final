%make potential function
Psi =[14,13,13,14,11;
11,12,14,13,10;
11,10,11,11, 9;
8, 9, 11,10, 8;
6, 8, 10, 7, 9];

Acc = ones(size(Psi));

%make accumulation function. Compare to website accumulation function.
%Note the last row of the website prediction contains an error. One arrow
%in the predicted flow direction is pointed the wrong way.

[channel,I] = d8alg(Psi,Acc,2,'plot');

%The predicted channel locations match with what you would expect from
%the accumulation plot?