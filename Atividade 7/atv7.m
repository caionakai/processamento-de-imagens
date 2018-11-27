# atividade quatro
pkg load image;

#carrega imagem na variavel hihi
HIHI = imread ("pratica7.png");
HIHI = im2double(HIHI);

#filtro = imread("filtro.png");

P=rows(HIHI)*2;
Q=columns(HIHI)*2;
x = fft2(HIHI, P,Q);

y =fftshift(x);

fig = uint8(abs(y));
figure, imshow(fig);
imwrite(fig, 'espectro.png');
filtro = imread ("filtro.png");


figure, imshow(im2uint8(filtro));

multi = y.*im2double(filtro);

z = ifftshift(multi);

uhu = ifft2(z);

final = real(uhu);

finaldeverdade = final(1:P/2,1:Q/2); 
figure, imshow(HIHI);
figure, imshow(im2uint8(finaldeverdade));
imwrite(im2uint8(finaldeverdade), 'finaldeverdade.png');

#finaldeverdade = filtro(1:P/2,1:Q/2); 

#figure, imshow(im2uint8(finaldeverdade));