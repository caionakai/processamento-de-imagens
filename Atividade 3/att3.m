# atividade tres
pkg load image;

HIHI = imread ("imagem.jpg");
[count, x] = imhist(HIHI);

MN = rows(HIHI)*columns(HIHI);
#pr(rows(count));

matriz = zeros (rows(HIHI),columns(HIHI), "uint8");

for i = 1:rows(count) 
  pr(i,1) = count(i)/MN;
endfor

for s = 1:rows(count)
  sk(s) = 0;
  for j = 1:s
    sk(s) = sk(s) + (pr(j) * rows(count));
  endfor 
endfor



for i = 1:rows(HIHI)
  for j = 1:columns(HIHI)
    matriz(i,j) = uint8(round(sk(HIHI(i,j))));
  endfor
endfor

# Plote o gráfico de T(r).
plot(sk)

#imhist(matriz)
#imshow(matriz);

#4. Salvar a imagem em disco após a equalização do histograma.
imwrite (matriz, "HIHI.jpg");