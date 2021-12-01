%% Script for loading in DEM data and setting missing data to NaN
clc; clear
info=georasterinfo("gt30w100n40.dem");
[A,R]=readgeoraster(['gt30w100n40.dem'],'OutputType','double');
m=(-9999); %missing data indicator
A(A==m)=nan;

%% mapping the data
% [lat,lon]=geographicGrid(R);
% usamap(R.LatitudeLimits,R.LongitudeLimits)
% % surfm(lat,lon,DEM_Data)
% geoshow(A,R,'DisplayType','surface')
% demcmap(A)


%%% mapping subset of data
%SE US
% lat_lim=[30 40];
% lon_lim=[-100 -80]; 
% RasterSize=[1200,2400];
% 
% R2=georefcells(lat_lim,lon_lim,RasterSize)
% R2.ColumnsStartFrom='north'
% R2.GeographicCRS=R.GeographicCRS
% 
% A2=A(1:1200,1:2400);
%  
% usamap(R2.LatitudeLimits,R2.LongitudeLimits);
% geoshow(A2,R2,'DisplayType','surface');
% demcmap(A2);

%Appalachia
% lat_lim=[32.5 40];
% lon_lim=[-87.5 -77.5]; 
% RasterSize=[900,1200];
% 
% R2=georefcells(lat_lim,lon_lim,RasterSize)
% R2.ColumnsStartFrom='north'
% R2.GeographicCRS=R.GeographicCRS
% 
% A2=A(1:900,1501:2700);
%  
% usamap(R2.LatitudeLimits,R2.LongitudeLimits);
% geoshow(A2,R2,'DisplayType','surface');
% demcmap(A2);

% % Mount Mitchell

lat_lim=[35.0 38.0];
lon_lim=[-83 -80]; 
RasterSize=[120*diff(lat_lim),120*diff(lon_lim)];

R2=georefcells(lat_lim,lon_lim,RasterSize)
R2.ColumnsStartFrom='north'
R2.GeographicCRS=R.GeographicCRS

latX=[(120*(40-lat_lim(2))+1):120*(40-lat_lim(1))];
lonX=[120*(100-abs(lon_lim(1)))+1:120*(100-abs(lon_lim(2)))];
A2=A(latX,lonX);
 
usamap(R2.LatitudeLimits,R2.LongitudeLimits);
geoshow(A2,R2,'DisplayType','surface');
demcmap(A2);


