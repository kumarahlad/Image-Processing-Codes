
% Image reading
x = double((imread('rose.jpeg')));

%Size of an image
[height, width,c] = size(x);

%Gray level colors of an image
B = 256;

% Quantized to L levels
L = 6;   % Can be changed
q = B / L;

%Quantizer characteristics
Q = zeros(256, 1);
for i = 0:255,
    Q(i+1, 1) = floor(i / q) *q + q/2 ;
end

%Output image intitialization
y = zeros(size(x));
for ch = 1:c
    for i = 1:height,
        for j = 1:width,
            y(i, j,ch) = Q(x(i,j,ch) + 1);
        end
    end
end

% Quantizer plot
figure; plot(0:255,Q);

%Quantized image
figure; imagesc(uint8(y))