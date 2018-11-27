pkg load image;

#calcula distancia euclidiana
function dist = distEucli(u,v,P,Q)
  dist = sqrt((u-(P/2))^2 + (v-(Q/2))^2);
endfunction

# filtro passa-baixa gaussiano
function filtro = lpgf(P,Q,D0)
  for i = 0:P-1
    for j = 0:Q-1
      filtro(i+1,j+1) = e^(-((distEucli(i,j,P,Q))^2)/(2*(D0)^2));
    endfor
  endfor
endfunction


HIHI = imread ("pratica6.png");
HIHI = im2double(HIHI);

P=rows(HIHI)*2;
Q=columns(HIHI)*2;

x = fft2(HIHI, P,Q);
# Qual a dimensão da transformada?
# O dobro, porque e´ feito o zero padding.

y =fftshift(x);


figure, imshow(uint8(abs(y)));

filtro = lpgf(P,Q,20);

figure, imshow(im2uint8(filtro));

multi = y.*filtro;

z = ifftshift(multi);

uhu = ifft2(z);

final = real(uhu);

finaldeverdade = final(1:P/2,1:Q/2); 

figure, imshow(im2uint8(finaldeverdade));
