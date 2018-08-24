

% Reading an image
I = double(imread('rose.jpeg'));

% Check size of an image
[j, k,c] = size(I);

%Scale for CCD size
scale = 5;
x_new = round(j./scale);
y_new = round(k./scale);
 
%Determine the ratio of the old dimensions compared to the new dimensions

x_scale = round(j./x_new);
y_scale = round(k./y_new);

%Declare and initialize an output image buffer
M = zeros(x_new,y_new,c);
 
%Generate the output image
for ch = 1:c
    for count1 = 1:x_new
        for count2 = 1:y_new
            M(count1,count2,ch) = I(count1.*x_scale,count2.*y_scale,ch);
        end
    end
end

%Display the two images side-by-side  
subplot(1,2,1); imagesc(uint8(I)); axis tight;
subplot(1,2,2); imagesc(uint8(M)); axis tight;

