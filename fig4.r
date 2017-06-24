source("llr.r")

n = 10000
p0 = 0.01
n1 = 1000
n2 = 10000
z = data.frame(
    k1 = as.numeric(gl(50, 1, n))-1,
    k2 = as.numeric(gl(200, 50, n))-1,
    llr = rep(0, n)
)
z$w1 = dbinom(z$k1, size=n1, p=p0)
z$w2 = dbinom(z$k2, size=n2, p=p0)
z$w = z$w1 * z$w2

for (i in 1:n) {
    z$llr[i] = llr(matrix(c(z$k1[i], n1 - z$k1[i], z$k2[i], n2 - z$k2[i]), nrow=2))
}
i = order(z$llr)
z = z[i,]
z$q = cumsum(z$w)

pdf('fig4.pdf', width=6, height=6)
par(mar=c(4,5,1,1))
plot(z$llr, log10(1-z$q), type='l', ylim=c(-7,0), xlim=c(0,30), ylab=NA, xlab=NA, yaxt='n')
axis(2, at=c(-7:0), las=2)
mtext(expression(-2 ~ log ~ lambda), side=1, line=3, cex=1.3)
mtext(expression(log10~(1-P)), side=2, line=2.5, cex=1.3)
lines(z$llr, log10(1-pchisq(z$llr, df=1)), col='red')
dev.off()


