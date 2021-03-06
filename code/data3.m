function k1 = data3()
a = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\Flair\";
b = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T1C\";
c = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T1\";
d = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T2\";
e = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\LG\Flair\";
f = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\LG\T1C\";
g = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\LG\T1\";
h = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\LG\T2\";
a1 = dir(a);
n = numel(a1)-2;
e2 = dir(e);
n1 = numel(e2)-2;
% disp(n);
k = [];
for i = 1:n
    disp(i);
    X1 = a + "Flair MRI (" + i + ").jpg";
    X2 = b + "T1C MRI (" + i + ").jpg";
    X3 = c + "T1 MRI (" + i + ").jpg";
    X4 = d + "T2 MRI (" + i + ").jpg";
    try
        [MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter] = datah3(X1,X2,X3,X4);
    
        k = [k;MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter, "HG"];
    catch
        disp(i);
%         fprintf('Inconsistent data in iteration %d, skipped.\n', i);
    end
end
for i = 1:n1
    disp(i);
    X1 = e + "Flair MRI (" + i + ").jpg";
    X2 = f + "T1C MRI (" + i + ").jpg";
    X3 = g + "T1 MRI (" + i + ").jpg";
    X4 = h + "T2 MRI (" + i + ").jpg";
    try
        [MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter] = datah3(X1,X2,X3,X4);
        k = [k;MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter, "LG"];
    catch
        disp(i);
%         fprintf('Inconsistent data in iteration %d, skipped.\n', i);
    end
end
k1 = k;
% X1 = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\Flair\Flair MRI (150).jpg";
% X2 = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T1C\T1C MRI (150).jpg";
% X3 = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T1\T1 MRI (150).jpg";
% X4 = "D:\kirtiraj\Project implementation\Updated dataset\Training\Image\HG\T2\T2 MRI (150).jpg";
end

% function [MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter] = svm(X1,X2,X3,X4)
% k1 = main(X1,X2);
% k2 = main(X3,X4);
% k3 = main(k1,k2);
% k4 = segmentation(k3);
% d = regionprops('table',k4,'MajorAxisLength','MinorAxisLength','Eccentricity','Circularity','EquivDiameter');
% [~,maxidx] = max(d.MajorAxisLength);
% a = d(maxidx,:);
% % [MajorAxisLength,MinorAxisLength,Eccentricity,Circularity,EquivDiameter] = table2array(d(maxidx,:));
% MajorAxisLength = a.MajorAxisLength;
% MinorAxisLength = a.MinorAxisLength;
% Eccentricity = a.Eccentricity;
% Circularity = a.Circularity;
% EquivDiameter = a.EquivDiameter;
% end

