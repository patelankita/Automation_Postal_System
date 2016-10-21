function image = bound2im(b,M,N)
%bound2im converts a boundary to image
%check input
 if size(b,2) ~= 2
     error('The boundary must be of size np-by-2');
 end

%Make sure the coordinates are integers
b = round(b);

%Defaults
if nargin == 1
    Mmin = min(b(:,1)) - 1;
    Nmin = min(b(:,2)) - 1;
    H = max(b(:,1)) - min(b(:,1)) + 1; %Height of Boundary
    W = max(b(:,2)) - min(b(:,2)) + 1; %Width of Boundary
    M = H + Mmin;
    N = W + Nmin;
end

%Create the image
image = false(M,N);
linearIndex = sub2ind([M, N], b(:,1), b(:,2));
image(linearIndex) = 1;