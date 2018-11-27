pkg load image;

#carrega imagem na variavel hihi
HIHI = imread ("pratica5.png");


# funçao que retorna a media de uma imagem
function img = mediaImage(array_of_images, vezes)
  img = zeros(rows(array_of_images{1}),columns(array_of_images{1}));
  
  for i=1:vezes
    img =img+ array_of_images{i}/vezes;
  end
  
endfunction

# funçao que retorna uma imagem apos aplicar um ruido n vezes e calcula a 
# media das imagens com ruido
function imagem = fazTudo(img, tipo_ruido, variancia, vezes)

  for i=1:vezes
    array_of_images{i}=imnoise(img, tipo_ruido, 0, variancia);
  end
  imagem = mediaImage(array_of_images, vezes);


endfunction

# Qual a diferença?
# R: quanto maior o numero de amostras melhor a qualidade da imagem


figure, imshow(fazTudo(HIHI, "gaussian", 0.25, 8));
figure, imshow(fazTudo(HIHI, "gaussian", 0.25, 16));
figure, imshow(fazTudo(HIHI, "gaussian", 0.25, 64));
