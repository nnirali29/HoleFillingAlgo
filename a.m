function a(filename)
a = imread(filename);
I = im2bw(a);
subplot(2,1,1)
imshow(a);
 
[r,c]=size(a);
% acmp=bitcmp(a,1);

acmp =imcomplement(I);

b=[0 1 0
   1 1 1
   0 1 0];
 x2=imdilate(I,b);
    for i=1:r
        for j=1:c
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
while(~isequal(I,x2))
   I=x2;
   x2=imdilate(I,b);
    for i=1:r
        for j=1:c
            if(x2(i,j)==acmp(i,j))
            x2(i,j)=acmp(i,j);
            else
                x2(i,j)=0;
            end
        
        end
    end
end
x2=x2+I;

subplot(2,1,2)
imshow(x2);