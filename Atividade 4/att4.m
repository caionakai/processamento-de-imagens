# atividade quatro
pkg load image;

#carrega imagem na variavel hihi
HIHI = imread ("pratica4.jpg");

# Convert image to double precision. 
HIHI_DOUBLE = im2double(HIHI);
HIHI_DOUBLE2 = im2double(HIHI);


# cria o filtro (matriz com 1 9x9)
filtro = zeros(9,9, "double")+1;

# adiciona linhas e colunas na imagem
lol = padarray (HIHI_DOUBLE, [4 4],'replicate');



# adiciona o filtro na imagem
# esta linha está errada, pois não é o filtro que é dividido 
y = filter2 (filtro, lol, 'valid')/81;

# filtro de sobel
Fgx = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
Fgy = [-1, 0, 1; -2, 0, 2; -1, 0, 1];

# adiciona padding na imagem para aplicar o filtro de sobel
newHihiComPaddingPara3x3 = padarray (HIHI_DOUBLE2, [1 1],'replicate');

# aplica o filtro de sobel 
gx = filter2 (Fgx, newHihiComPaddingPara3x3, 'valid');
gy = filter2 (Fgy, newHihiComPaddingPara3x3, 'valid');

# calcula a magnitude do gradiente
sobel = abs(gx) + abs(gy);

# printa a imagem
imshow(sobel)

# Exiba a imagem resultante do passo 4 e observe a borda da imagem. O que
# aconteceu? Responda essa pergunta nos comentários do código.
# Resposta: A imagem ficou suavizada deixando a impressão de que está borrada.
