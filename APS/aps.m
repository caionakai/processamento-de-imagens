# APS PROCESSAMENTO DE IMAGENS
# Autores:
# Caio Cesar Hideo Nakai 1816403
# Gabriel Choptian 1816420

# carrega o pacote image
pkg load image;

#carrega imagem na variavel hihi
HIHI = imread ("Imagem.jpg");

# exibe a imagem original
figure, imshow(HIHI);

# transforma do rgb para o hsv
teste = rgb2hsv(HIHI);

# separa os tres canais, HUE, SATURATION, VALUE em t1, t2, t3 respectivamente
t1 = teste(:,:,1);
t2 = teste(:,:,2);
t3 = teste(:,:,3);

# duplica a quantidade de linhas e colunas para passar na funçao fft2
P=rows(t3)*2;
Q=columns(t3)*2;

# faz o zero padding na imagem e aplica a transformada rápida de Fourier 2D sobre a imagem de entrada
x = fft2(t3, P,Q);

# centraliza a transformada de Fourier da imagem movendo a frequência zero
y =fftshift(x);


# converte o resultado para uint8
fig = uint8(abs(y));


# escreve a imagem do espectro no disco
imwrite(fig, 'espectro.png');

# faz a leitura do filtro e armazena na variavel filtro
filtro = imread ("filtro_cn.png");


# se descomentar mostra o filtro
#figure, imshow(im2uint8(filtro));

# faz a multiplicação elemento por elemento para aplicar o filtro
multi = y.*im2double(filtro);

# descentraliza a matriz e move a frequência zero para sua posição original
z = ifftshift(multi);

# aplica a transformada inversa rápida de Fourier
uhu = ifft2(z);

# pega a parte real
final = real(uhu);

# corta a imagem 
t3_new = abs(im2double(final(1:P/2,1:Q/2)));

# aplica transformação de potência
t3_new = t3_new.^0.78;

# monta as dimensoes
nani = cat(3, t1, t2, t3_new);

# converte de hsv para rgb
w = hsv2rgb(abs(nani));

# exibe a imagem
figure, imshow(w);

# escreve a imagem no disco
imwrite(im2uint8(w), 'temp.png');
