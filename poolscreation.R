Samplelist <-read.table(file="listeoeufs.txt") #Load the list of samples

Z<-10 #X Maximum samples per pool
Y<-44 #Y pools to create  
for(X in 2:Z) #Repeat to the maximum pool size
{Pools<-as.data.frame(matrix(,X,Y))
for (i in 1:Y)#Repeat for the number of pools to create
{individuals<-sample.int(Y,X)  #Randomly draw X samples Y times    
Pools[,i]<- Samplelist[individuals,]} #Replace random numbers with samples names
Pools <- data.frame(Samples=unlist(Pools, use.names = FALSE))#Put all the samples in one column
Pools[,2] <- rep("/",nrow(Pools)) #Add / at the end of each row
Pools$reps<-rep(1:Y, each=X) # Add to wich pools each sample is part of
Pools<-Pools[c(3,1,2)]
write.table(Pools,file= paste("Poolslist",X,".txt", sep=""), quote = FALSE, row.names = FALSE, col.names = FALSE)#Export to a text file
}

