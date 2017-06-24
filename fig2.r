source("llr.r")

p = 0.01
n1 = 1000
n2 = 1000
n0 = 400
k0 = 10
step = 20
k1 = seq(from=k0, to=n0, by=step)
z = data.frame(
    k1 = k1,
    k2 = floor(n1 * rep(seq(40,800,by=5)/1000, each=length(k1))),
    llr = 0,
    chi2 = 0
)
n = dim(z)[1]

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

pdf('fig2.pdf', width=5, height=6)
par(mar=c(4,5,1,1))
plot(llr ~ chi2, z, cex=0.7, xlim=c(0,200), ylim=c(0,200),ylab=NA, xlab=NA, yaxt='n')
mtext(expression(-2 ~ log ~ lambda), side=1, line=3, las=1, cex=1.3)
mtext(expression(chi^2), side=2, line=3, las=2, cex=1.3)
axis(2, at=seq(0,200,by=50), las=2)
dev.off()
