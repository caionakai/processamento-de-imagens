# @Authors: Caio Cesar Hideo Nakai & Gabriel Choptian
# @Date: 08/2018

# para obter os valores de (r1,s1) e (r2,s2), bastou verificar no 
# histograma que a faixa de valores das abscissas seriam entre 95~135,
# ou seja, o intervalo entre r1 e r2 já estava mais ou menos definido,
# após esta descoberta, bastou  verificar qual seria o melhor intervalo das
# ordenadas, para isto, foram realizados alguns testes e foi encontrado
# o intervalo de 30~150, sendo r1=30 e s2=150. ç,ç

# carrega o pacote image
pkg load image;

# lê imagem
HIHI = imread ("pollen.jpg");
# cria matriz de zeros 889x889
matriz = zeros (889,889, "uint8");

# coordenadas para geração das funções
r1 = 97;
s1 = 30;
r2 = 126;
s2 = 150;

# func 1
y1 = @(x) ((s1/r1) * x);

# func 2
y2 = @(x) (s1 + ((s2-s1)/(r2-r1)) * (x - r1));

# func 3
y3 = @(x) (s2 + (((256-s2)/(256-r2)) * (x - r2)));

#?????????? ???! jyoudannnnn
vetor = zeros(1,256, "double");

for var = 1:256
  if(var < r1)
    temp = y1(var);
    
  elseif (var < r2)
    temp = y2(var);
    
  else
    temp = y3(var);
   
  endif
    
  vetor(var) = round(temp);
  
endfor

# loop para aplicar as alterações na nova imagem
for i = 1:889
  for j = 1:889
    matriz(i,j) = uint8(vetor(HIHI(i,j)));
  endfor
endfor

#plot(0:255,vetor);
imshow(matriz);
