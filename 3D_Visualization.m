% BME 3540 
% Project 3
% Submitted by: Rachel Bailey, Livia Baker, Tanner Mathes, Tyler Mathes,
% Meghan Weber
% Due: December 14th, 2017 12:00pm 

close all
clc

%% The first step is to load the data provided.
% CathodeElectrodes=load('CathodeElectrodes')
% AnodeElectrodes=load('AnodeElectrodes')
% GrayMatter=load('GrayMatter')
% AnodeGel=load('subject18_F3_anode-signagel-domain.txt');
% CathodeGel=load('subject18_F3_cathode-signagel-domain.txt');
% Skin=load('skin.txt')
addpath('C:\Users\Rache\OneDrive\Documents\MATLAB')
load('Proj3Data')
% I went ahead and named all the files AnodeElectrodes, CathodeElectrodes,
% and Gray Matter. I loaded the files in my command window. I read online
% that loading into the workspace and then saving the entire workspace
% loads the data in much quicker. That is why the loading data code is so
% simple. If you want to run the code yourself, make sure to change the
% path in the code and then save the workspace. 'test_new.mat' is the .mat
% file I saved the workspace as. I had to save the Skin data separately
% because the workspace would have been too large to save in the current
% version.

%% Determine the number of values in each data set
size_cathode=size(CathodeElectrodes);
% It can be seen that the cathode file has 1185921 rows and 4 columns. This
% matches what the file info says.
num_c=numel(CathodeElectrodes);
% The file has 4743684 values
size_anode=size(AnodeElectrodes);
% It can be seen that this file has 2064381 rows and 4 columns. This
% matches what the file info says.
num_a=numel(AnodeElectrodes);
% This file has 8257524 values
size_gray=size(GrayMatter);
% It can be seen that the gray matter file has 33670155 rows and 7 columns.
% This matches what the file info says.
num_gm=numel(GrayMatter);
% The file has 235,691,085 values

%% Extract the X,Y,Z vector location from CathodeElectrode
% For the code of extracting the different XYZ locations, you can use the
% (:,#) code. This code tells you to extract the data of all rows from
% column '#'. It is a convenient way to extract these locations.
%X-Vector of Cathode
xc=CathodeElectrodes(:,1);
%Y-Vector of Cathode
yc=CathodeElectrodes(:,2);
%Z-Vector of Cathode
zc=CathodeElectrodes(:,3);

%% Extract the X,Y,Z vector location from AnodeElectrodes
%X-Vector of Anode
xa=AnodeElectrodes(:,1);
%Y-Vector of Anode
ya=AnodeElectrodes(:,2);
%Z-Vector of Anode
za=AnodeElectrodes(:,3);

%% Extract the X,Y,Z vector location from GrayMatter
%X-Vector of GrayMatter
xgm=GrayMatter(:,1);
%Y-Vector of Cathode
ygm=GrayMatter(:,2);
%Z-Vector of Cathode
zgm=GrayMatter(:,3);

%% Extract the X,Y,Z vector location from Anode and Cathode Gel
%X vector of anode Gel
xag=AnodeGel(:,1);
%Y vector of anode Gel
yag=AnodeGel(:,2);
%Z vector of anode Gel
zag=AnodeGel(:,3);

%X vector of cathode Gel
xcg=CathodeGel(:,1);
%Y vector of cathode Gel
ycg=CathodeGel(:,2);
%Z vector of cathode Gel
zcg=CathodeGel(:,3);

%% Extract the X,Y,Z vectors in Skin data
xskin=Skin(:,1);
yskin=Skin(:,2);
zskin=Skin(:,3);

%% Using unique and Reshape for cathode data
% the unique function returns the unique values in the array. It will not
% repeat the values, and it will become sorted. We then used the length
% funciton to determine how many unique values were in the array. The
% reshape function then will reshape the original array into a new array
% with dimensions from the unique function. 
un_xc=unique(xc);
l_xc=length(un_xc);
un_yc=unique(yc);
l_yc=length(un_yc);
un_zc=unique(zc);
l_zc=length(un_zc);
cathode_X=reshape(xc,l_xc,l_yc,l_zc);
cathode_Y=reshape(yc,l_xc,l_yc,l_zc);
cathode_Z=reshape(zc,l_xc,l_yc,l_zc);
cathode_density=reshape(CathodeElectrodes(:,4),l_xc,l_yc,l_zc);

%% Using Unique and Reshape for Anode Data

un_xa=unique(xa);
l_xa=length(un_xa);
un_ya=unique(ya);
l_ya=length(un_ya);
un_za=unique(za);
l_za=length(un_za);
anode_X=reshape(xa,l_xa,l_ya,l_za);
anode_Y=reshape(ya,l_xa,l_ya,l_za);
anode_Z=reshape(za,l_xa,l_ya,l_za);
anode_density=reshape(AnodeElectrodes(:,4),l_xa,l_ya,l_za);

%% Using Unique and Reshape for Gray Matter Data
un_xgm=unique(xgm);
l_xgm=length(un_xgm);
un_ygm=unique(ygm);
l_ygm=length(un_ygm);
un_zgm=unique(zgm);
l_zgm=length(un_zgm);
graym_X=reshape(xgm,l_xgm,l_ygm,l_zgm);
graym_Y=reshape(ygm,l_xgm,l_ygm,l_zgm);
graym_Z=reshape(zgm,l_xgm,l_ygm,l_zgm);
graym_density=reshape(GrayMatter(:,4),l_xgm,l_ygm,l_zgm);

%% using unique and reshape for Anode and Cathode Gel
%Anode Data
un_xag=unique(xag);
l_xag=length(un_xag);
un_yag=unique(yag);
l_yag=length(un_yag);
un_zag=unique(zag);
l_zag=length(un_zag);
AnGel_X=reshape(xag,l_xag,l_yag,l_zag);
AnGel_Y=reshape(yag,l_xag,l_yag,l_zag);
AnGel_Z=reshape(zag,l_xag,l_yag,l_zag);
AnGel_density=reshape(AnodeGel(:,4),l_xag,l_yag,l_zag);

%Cathode Gel Data
un_xcg=unique(xcg);
l_xcg=length(un_xcg);
un_ycg=unique(ycg);
l_ycg=length(un_ycg);
un_zcg=unique(zcg);
l_zcg=length(un_zcg);
CathGel_X=reshape(xcg,l_xcg,l_ycg,l_zcg);
CathGel_Y=reshape(ycg,l_xcg,l_ycg,l_zcg);
CathGel_Z=reshape(zcg,l_xcg,l_ycg,l_zcg);
CathGel_density=reshape(CathodeGel(:,4),l_xcg,l_ycg,l_zcg);

%% unique and reshape for skin data
un_xskin=unique(xskin);
l_xskin=length(un_xskin);
un_yskin=unique(yskin);
l_yskin=length(un_yskin);
un_zskin=unique(zskin);
l_zskin=length(un_zskin);
Skin_X=reshape(xskin,l_xskin,l_yskin,l_zskin);
Skin_Y=reshape(yskin,l_xskin,l_yskin,l_zskin);
Skin_Z=reshape(zskin,l_xskin,l_yskin,l_zskin);
Skin_density=reshape(Skin(:,4),l_xskin,l_yskin,l_zskin);

%% Isosurface
% isosurface is a function that computes geometry for the data sets.
% Isosurface has different structures located within it, including face,
% vertices, and facevertexcdata. These structures will then be used within
% the patch command. 

%Gray Matter Data
I=isnan(graym_density);
new_graym_density=graym_density;
new_graym_density(I)=0;

%Anode Electrode Data
IAE=isnan(anode_density);
new_anode_density=anode_density;
new_anode_density(IAE)=0;

%Cathode Electrode Data
ICE=isnan(cathode_density);
new_cathode_density=cathode_density;
new_cathode_density(ICE)=0;

%Anode Gel Data
IAG=isnan(AnGel_density);
new_AnGel_density=AnGel_density;
new_AnGel_density(IAG)=0;

%Cathod Gel Data
ICG=isnan(CathGel_density);
new_CathGel_density=CathGel_density;
new_CathGel_density(ICG)=0;

% Skin Data
IS=isnan(Skin_density);
new_Skin_density=Skin_density;
new_Skin_density(IS)=0;

% Isosurface for each data section

Fv_C=isosurface(cathode_X, cathode_Y, cathode_Z, ~isnan(cathode_density),.01,new_cathode_density);
Fv_A=isosurface(anode_X, anode_Y, anode_Z, ~isnan(anode_density),.01,new_anode_density);
Fv_GM=isosurface(graym_X, graym_Y, graym_Z, ~isnan(graym_density),.01, new_graym_density);

%% Isosurface for anode and cathode gel
Fv_AG=isosurface(AnGel_X, AnGel_Y, AnGel_Z, ~isnan(AnGel_density),.01, new_AnGel_density);
FV_CG=isosurface(CathGel_X, CathGel_Y, CathGel_Z, ~isnan(CathGel_density),.01, new_CathGel_density);

%% Isosurfce for skin data
Fv_Skin=isosurface(Skin_X, Skin_Y, Skin_Z, ~isnan(Skin_density),.01,new_Skin_density);
%% Patch
% Patch will use the structures formed from the isosurface functions to
% fill those structures to form filled polygons. It will connect all the
% vertices to form those polygons. You can set each patch function to a
% different color, which is helpful since the electrodes and gray matter
% have to be dfferent colors.
% 
% RGB is just the numbers / 255
figure
PAT=patch('Faces',Fv_GM.faces,'Vertices',Fv_GM.vertices,'FaceVertexCData', Fv_GM.facevertexcdata);
PAT.FaceColor='interp';
%PAT.FaceColor=[.502,.502,.502]; %this will turn the gray matter the color gray
PAT.EdgeColor='none';
%colormap('hot(10)')
colormap autumn
caxis([0,.001])
h=colorbar;
ylabel(h, 'Density Map')
camlight
view(-102,11)

figure 

%Comment for now but put it back for the skin
PCE=patch('Faces',Fv_C.faces,'Vertices',Fv_C.vertices,'FaceVertexCData', Fv_C.facevertexcdata);
PCE.FaceColor=[0,1,0]; %this will turn the cathodes green
PCE.EdgeColor='none';


PAE=patch('Faces',Fv_A.faces,'Vertices',Fv_A.vertices,'FaceVertexCData', Fv_A.facevertexcdata);
PAE.FaceColor=[107/255,66/255,38/255]; %this will turn the anodes brown
PAE.EdgeColor='none';

hold on 
PAG=patch('Faces',Fv_AG.faces,'Vertices',Fv_AG.vertices,'FaceVertexCData',Fv_AG.facevertexcdata);
PAG.FaceColor='blue';
PAG.EdgeColor='none';

hold on 
PCG=patch('Faces',FV_CG.faces,'Vertices',FV_CG.vertices,'FaceVertexCData',FV_CG.facevertexcdata);
PCG.FaceColor='blue';
PCG.EdgeColor='none';

hold on
PS=patch('Faces',Fv_Skin.faces,'Vertices',Fv_Skin.vertices,'FaceVertexCData',Fv_Skin.facevertexcdata);
Ps.FaceColor=[219/255,147/255,112/255];
PS.EdgeColor='none';

camlight('left')
camlight('right')

view(-150,-14)
hold off

