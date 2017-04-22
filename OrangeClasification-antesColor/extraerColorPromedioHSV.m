%function [ output_args ] = extraerColorPromedioHSV()
function [ valorH, valorS, valorV ] = extraerColorPromedioHSV( imagenNombreColor, imagenNombreMascara)
% Extraer color promedio de una imagen, utilizando una silueta para
% cuantificar el color y los valores que se extraen. 
% El resultado se trabaja en el espacio de color HSV.


% -----------------------------------------------------------------------
%clc; clear all; close all;
PRIMER_PLANO=1;
%imagenNombreColor='/home/usuario/ml/tmpToLearn/001.jpg_rm1.jpg';
%imagenNombreMascara='/home/usuario/ml/tmpToLearn/001.jpg_sN1.jpg';


%Lectura de la imagen con fondo
IRecorteRGB=imread(imagenNombreColor);
IRecorteHSV=rgb2hsv(IRecorteRGB); % hsv

IMascaraC=imread(imagenNombreMascara);

% Binarizar
umbral=graythresh(IMascaraC);
IMascara=im2bw(IMascaraC,umbral);


[filasTope, columnasTope, ~]=size(IRecorteRGB);

sumaH=double(0.0);
sumaS=double(0.0);
sumaV=double(0.0);
contadorPixeles=double(0.0);

%fprintf('contador= %f ; sumaR= %f sumaG= %f sumaB= %f\n', contadorPixeles, sumaH, sumaS, sumaV);

%recorrer la imagen mascara
for f=1:1:filasTope
    for c=1:1:columnasTope
%        % Leer de la imagen mascara si el valor es diferente a cero
%        fprintf('%.2i %.2i \n',f,c);        
        pixelMascara=IMascara(f,c);

        if pixelMascara == PRIMER_PLANO

            sumaH=double(IRecorteHSV(f,c,1))+sumaH;
            sumaS=double(IRecorteHSV(f,c,2))+sumaS;
            sumaV=double(IRecorteHSV(f,c,3))+sumaV; 

            contadorPixeles=contadorPixeles+1;
%            valorH=double(sumaH/contadorPixeles);            
%           fprintf('pp, H= %f S= %f V= %f contador= %f ; sumaR= %f sumaG= %f sumaB= %f valorH=%f \n', double(IRecorteHSV(f,c,1)), double(IRecorteHSV(f,c,2)), double(IRecorteHSV(f,c,3)), contadorPixeles, sumaH, sumaS, sumaV, valorH);            
        end %if        
    end %for columnas
end %for filas

%fprintf('H= %i S= %i V= %2i Contador=%i \n',sumaH, sumaS, sumaV,contadorPixeles);        

valorH=double(sumaH/contadorPixeles);
valorS=double(sumaS/contadorPixeles);
valorV=double(sumaV/contadorPixeles);

%fprintf('H= %f S= %f V= %f \n', valorH, valorS, valorV);


% -----------------------------------------------------------------------
end %fin de la funcion
