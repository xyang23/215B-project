lalonde <- data.frame()
for (file in list.files(path="data/", pattern="*.txt")) {
  df <- read.table(paste('data', file, sep='/'))
  colnames(df) <- c('treatment', 'age', 'education', 'black', 'hispanic', 
                    'married', 'nodegree', 're74', 're75', 're78')
  
  name <- strsplit(strsplit(file, '\\.')[[1]][1], '_')[[1]]
  df$group <- ifelse(name[2] == 'controls', name[1], name[2])
  
  if (nrow(lalonde) == 0) {
    lalonde <- df
  } else {
    lalonde <- rbind(lalonde, df)
  }
}
remove(df)
remove(file)
remove(name)

lalonde$u74 = as.integer(lalonde$re74 == 0)#as.factor()
lalonde$u75 = as.integer(lalonde$re75 == 0)#as.factor()

#lalonde$treatment <- as.factor(lalonde$treatment)
#lalonde$black <- as.factor(lalonde$black)
#lalonde$hispanic <- as.factor(lalonde$hispanic)
#lalonde$married <- as.factor(lalonde$married)
#lalonde$nodegree <- as.factor(lalonde$nodegree)