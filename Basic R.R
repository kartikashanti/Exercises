#Nama dokumen: Basic R.R
#Penulis: Shanti
#Deskripsi: Latihan Dasar-dasar R

v_hobi_saya<-c("nari", "jalan-jalan", "makan")
v_hobi_saya

matrix_ganjil_saya<-matrix(c(1,3,5,7,9,11),byrow = T, nrow = 2)
matrix_ganjil_saya

df_harga_makanan<-data.frame(
  nama_makanan=c("Pizza", "Bakso", "Roti", "Mie Instan"),
  harga_makanan=c("100000", "25000", "10000", "3000") 
)
df_harga_makanan

list_saya<-list(v_hobi_saya,matrix_ganjil_saya, df_harga_makanan)
list_saya