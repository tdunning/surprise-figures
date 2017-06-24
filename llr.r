llr = function(k) {2 * sum(k) * (H(k) - H(rowSums(k)) - H(colSums(k)))}
H = function(k) {N = sum(k) ; return (sum(k/N * log(k/N + (k==0))))}

rootLLR = function(k) {sqrt(llr(k)) * ifelse(k[1,1] > (k[1,1] + k[1,2])/sum(k) * (k[1,1]+k[2,1]), 1, -1)}

