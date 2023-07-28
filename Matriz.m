clearvars; close all; clc

pth = 'C:\Users\Lucas\Desktop\PSB\HVI -20210711T141207Z-001\HVI'

nombres = {};
labels = [];
ECG_pacientes = [];
fs = [];
QRSon = [];
QRSend = [];
T = [];
R = [];
Ton = [];
Tend = [];
Carpeta = dir(fullfile(pth,'*.mat'));
ECG = struct;

for i = 1:45
    paciente = Carpeta(i).name;
    load(paciente)
    
    NanQRSon = find(isnan(Pts.fiduciales.QRSon));
    NanQRSend = find(isnan(Pts.fiduciales.QRSend));
    registros = length(Pts.fiduciales.QRSon) + length(Pts.fiduciales.QRSend) - (length(NanQRSon) + length(NanQRSend));
    
    if (registros >= 10)
        nombres = [nombres,paciente(11:end-4)];
        labels = [labels,Pts.labels];
        fs = [fs,Pts.fm];
        fname1 = ['ECG','_',paciente(11:end-4)];
        fname2 = ['QRSon','_',paciente(11:end-4)];
        fname3 = ['QRSend','_',paciente(11:end-4)];
        fname4 = ['T','_',paciente(11:end-4)];
        fname5 = ['R','_',paciente(11:end-4)];
        fname6 = ['Ton','_',paciente(11:end-4)];
        fname7 = ['Tend','_',paciente(11:end-4)];
        ECG.(fname1)= Pts.ECG';
        ECG.(fname2)= Pts.fiduciales.QRSon';
        ECG.(fname3)= Pts.fiduciales.QRSend';
        ECG.(fname4)= Pts.fiduciales.T';
        ECG.(fname5)= Pts.fiduciales.R';
        ECG.(fname6)= Pts.fiduciales.Ton';
        ECG.(fname7)= Pts.fiduciales.Tend';
    end
end

HVI = struct;

HVI.nombres = nombres';
HVI.target = labels';
HVI.fs = fs';


