xm = function(m,n=100) {(n-sqrt(n^2  - 4 *m * n))/2/n}

pdf(width=5, height=4, file='fig1.pdf')
x = seq(0,30,0.01)
par(mar=c(2,4,1,1))
plot(c(),c(),xlim=c(0,33),ylim=c(0,0.19),yaxt='n',xaxt='n',ylab=NA, xlab=NA)

axis(1,at=c(0,10,20,30), labels=c("0.00", "10.00", "20.00", "30.00"))
axis(2,at=seq(0,0.18,by=0.02),las=2)
n = 10000
for (m in c(5,10,20)){
    p = m / n
    lines(x,dnorm(x,m=m,s=sqrt(n * p * (1-p))), lwd=2)
    lines(0:30,dbinom(0:30,size=n, prob=m/n), lwd=2, col='black', lty=2)
}
legend(17, 0.18, lty=c(1,2), legend=c("Normal", "Binomial"))
dev.off()
