function g = sigmoidGradient(a)

g = nnSigmoid(a).* (1-nnSigmoid(a));


end

