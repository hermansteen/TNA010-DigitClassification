function Tp = calcTransformMatrix(number)
padding = zeros(16,1);
number = cat(1,number,padding');
padding = zeros(17,1);
number = cat(2,number, padding);
number = cat(2,padding, number);
padding = zeros(18,1);
number = cat(1, padding', number);

xdiv = zeros(16);
ydiv = zeros(16);

for i = 2:17 % rad
    for j = 2:17 % column
        ydiv(i-1,j-1) = (number(i+1,j) - number(i-1,j))/2; 
        xdiv(i-1,j-1) = (number(i,j+1) - number(i,j-1))/2;
    end
end

%ima(xdiv)
%ima(ydiv)

%ima(azip(:,:,1))

rot = zeros(16); % Rotation matrix
scale = zeros(16); % Scaling matrix
paraHyper = zeros(16); % Parallel Hyperbolic Transformation
diaHyper = zeros(16); % Diagonal Hyperbolic Transformation


for x = 1:16
    for y = 1:16
       rot(x,y) = y*xdiv(x,y) - x*ydiv(x,y);% Rotation
       scale(x,y) = x*xdiv(x,y) + y*ydiv(x,y); % Scaling
       paraHyper(x,y) = x*xdiv(x,y) - y*ydiv(x,y); % Parallel
       diaHyper(x,y) = y*xdiv(x,y) + x*ydiv(x,y); % Diagonal
    end
       
end

% Reshape transformation matrices to vectors 
rehsapeTrans = reshape(xdiv, [], 1);
reshapeThick = reshape(xdiv.*xdiv + ydiv.*ydiv, [], 1);
reshapeRot = reshape(rot, [], 1);
rehsapeScale = reshape(scale, [], 1);
reshapeParaHyper = reshape(paraHyper, [], 1);
reshapeDiaHyper = reshape(diaHyper, [], 1);

% Put all transformations vectos into one matrix
Tp = [rehsapeTrans reshapeThick reshapeRot rehsapeScale reshapeParaHyper reshapeDiaHyper];
end