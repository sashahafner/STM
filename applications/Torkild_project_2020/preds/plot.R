# Plots temperature predictions
# S. Hafner
# 2020

# Normal simulation
d10n <- read.table('temp_10Cn.txt', header = FALSE, skip = 2)
d30n <- read.table('temp_30Cn.txt', header = FALSE, skip = 2)
names(d10n) <- names(d30n) <- c('dos', 'doy', 'smass', 'depth', 'air', 'wall', 'floor', 'slurry')

# Slow simulation (less heat transfer)
d10s <- read.table('temp_10Cs.txt', header = FALSE, skip = 2)
d30s <- read.table('temp_30Cs.txt', header = FALSE, skip = 2)
names(d10s) <- names(d30s) <- c('dos', 'doy', 'smass', 'depth', 'air', 'wall', 'floor', 'slurry')

# Fast simulation (more heat transfer)
d10f <- read.table('temp_10Cf.txt', header = FALSE, skip = 2)
d30f <- read.table('temp_30Cf.txt', header = FALSE, skip = 2)
names(d10f) <- names(d30f) <- c('dos', 'doy', 'smass', 'depth', 'air', 'wall', 'floor', 'slurry')

pdf('slurry_temp.pdf', height = 8, width = 4)
  par(mfrow = c(3, 1), mar = c(4, 4.5, 2, 1))

  plot(slurry ~ dos, data = d10n, type = 'l', ylim = c(0, 32), xlab = '', ylab = expression('Temperature'~(degree*C)), main = 'Best guess')
  lines(slurry ~ dos, data = d30n, type = 'l', col = 'red')
  grid()
  legend('topright', c('Slurry 10C', 'Slurry 30C'), lty = c(1, 1, 2), col = c('black', 'red', 'gray45'))

  plot(slurry ~ dos, data = d10s, type = 'l', ylim = c(0, 32), xlab = '', ylab = expression('Temperature'~(degree*C)), main = 'Low')
  lines(slurry ~ dos, data = d30s, type = 'l', col = 'red')
  grid()

  plot(slurry ~ dos, data = d10f, type = 'l', ylim = c(0, 32), xlab = '', ylab = expression('Temperature'~(degree*C)), main = 'High')
  lines(slurry ~ dos, data = d30f, type = 'l', col = 'red')
  grid()

dev.off()

pdf('other_temps.pdf', height = 4, width = 4)
  plot(air ~ dos, data = d10n, type = 'l', ylim = c(0, 32), xlab = 'Day of simulation', ylab = expression('Temperature'~(degree*C)))
  lines(floor ~ dos, data = d10n, type = 'l', col = 'brown', lty = 1)
  lines(wall ~ dos, data = d10n, type = 'l', col = 'green', lty = 1)
  grid()
  legend('topright', c('Air', 'Wall', 'Floor'), lty = c(1, 1, 1), col = c('black', 'green', 'brown'))
dev.off()
