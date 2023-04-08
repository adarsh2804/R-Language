#################################################################################
# Image Compression using PCA
#################################################################################

install.packages("jpeg")
library(jpeg)

img = readJPEG("demo.jpg")     # 816X1088 size
dim(img)

r = img[,,1]
g = img[,,2]
b = img[,,3]

View(r)

?prcomp

img.r.pca = prcomp(r, center = F)
img.g.pca = prcomp(g, center = F)
img.b.pca = prcomp(b, center = F)

rgb.pca = list(img.r.pca, img.g.pca, img.b.pca)

ncomp = 200
R = img.r.pca$x[,1:ncomp]%*%t(img.r.pca$rotation[,1:ncomp])
G = img.g.pca$x[,1:ncomp]%*%t(img.g.pca$rotation[,1:ncomp])
B = img.b.pca$x[,1:ncomp]%*%t(img.b.pca$rotation[,1:ncomp])

R = ifelse(R<0, 0, ifelse(R>1, 1, R))
G = ifelse(G<0, 0, ifelse(G>1, 1, G))
B = ifelse(B<0, 0, ifelse(B>1, 1, B))

pca_img = array(c(R,G,B), dim = c(dim(img)[1:2],3))

summary(pca_img)

writeJPEG(pca_img, "demo_write.jpg")
