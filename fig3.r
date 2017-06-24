source("llr.r")

n = 1000
p = 0.01
n1 = 100
n2 = 10000
z = data.frame(
    k1 = 1:5,
    k2 = as.numeric(gl(200, 25, n))-1,
    llr = rep(0, n),
    chi2 = rep(0, n)
)

x2 = function(data) {
    total = sum(data)
    m = dim(data)[1]
    n = dim(data)[2]
    p.row = rowSums(data) / total
    p.col = colSums(data) / total
    expected = matrix(p.row, nrow=m, ncol=n, byrow=F) * matrix(p.col, nrow=m, ncol=n, byrow=T)
    expected = total * expected
    sum((data-expected)^2/expected)
}

for (i in 1:n) {
    table = matrix(c(z$k1[i], n1 - z$k1[i], z$k2[i], n2 - z$k2[i]), nrow=2)
    z$llr[i] = llr(table)
    z$chi2[i] = x2(table)
}

pdf('fig3.pdf', width=5, height=6)
par(mar=c(4,5,1,1))
plot(chi2 ~ llr, z, cex=0.5, xlim=c(0,47), ylim=c(0,500),ylab=NA, xlab=NA, yaxt='n')
mtext(expression(-2 ~ log ~ lambda), side=1, line=3, las=1, cex=1.3)
mtext(expression(chi^2), side=2, line=3, las=2, cex=1.3)
axis(2, at=seq(0,500,by=100), las=2)
dev.off()
