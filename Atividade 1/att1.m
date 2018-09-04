# @Authors: Caio Cesar Hideo Nakai & Gabriel Choptian 
# @Date: 08/2018

# carrega o pacote image
pkg load image;

# leitura das imagens
A = imread ("tungsten_filament_shaded.tif");
B = imread ("tungsten_sensor_shading.tif");

# converte formato
AD = im2double(A);
BD = im2double(B);

# aplica operacao
CD = AD ./ BD;

# exibe nova imagem
imshow(CD);