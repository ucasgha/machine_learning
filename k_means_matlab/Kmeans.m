  %% Prepare Workspace

close all; clear; clc;

%% Load Data

A = double(imread('bird_small.tiff'));
A = A/255;

%% Variables

K = 16;
iterations = 10;
img_size = size(A);

x = reshape(A, size(A,1) * size(A,2), 3);
m = size(x,1);
n = size(x,2);

%% Initialize the centroids

[initial_centroids] = initialize(K,x);


%% Compute K means

idx = run_means(x, initial_centroids, iterations, K, m,n);

%% Compute New Centroids 

centroids = computeCentroids(x,idx,K, n);


%% Recover

X_recovered = centroids(idx,:);


X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

subplot(1, 2, 1);
imagesc(A); 
title('Original');

subplot(1, 2, 2);
imagesc(X_recovered);
title('Compressed');
