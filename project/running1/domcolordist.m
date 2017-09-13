function [ total ] = domcolordist( colors1, colors2)
%DOMCOLORDIST Summary of this function goes here
%   Detailed explanation goes here

Td = 0.15 * sqrt(3*255*255);
alpha = 1.5;
dmax = alpha * Td;
total = 0;

for i = 1:size(colors1, 1)
    pi = colors1(i, 1);
    total = total + pi*pi;
end

for j = 1:size(colors2, 1)
    pj = colors2(j, 1);
    total = total + pj*pj;
end

%fprintf('total = %3.3f\n', total);

for i = 1:size(colors1, 1)
    for j = 1:size(colors2, 1)
        c1 = colors1(i, 2:4);
        c2 = colors2(j, 2:4);
        r = c1(1) - c2(1);
        g = c1(2) - c2(2);
        b = c1(3) - c2(3);
        dkl = sqrt(r*r + g*g + b*b);
        pi = colors1(i, 1);
        pj = colors1(j, 1);
        if dkl <= Td
            akl = 1 - dkl / dmax;
        else
            akl = 0;
        end
        %fprintf('dkl = %3.3f, akl = %3.3f\n', dkl, 2*akl*pi*pj);
        total = total - 2 * akl * pi * pj;
    end
end

end
