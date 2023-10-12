library(DBI)
con <- dbConnect(odbc::odbc(), driver = "ODBC Driver 17 for SQL Server", 
    server = "DESKTOP-G6OUCN1", database = "Bases_Practica", 
    uid = "sa", pwd = "1234")
query <- "SELECT * FROM Bases_Practica.dbo.vw_informe_ventas_consolidado"
df <- dbGetQuery(con, query)
print(df)
library(ggplot2)

#bigotes
ggplot(data = df, aes(x = Estado_civil_vendedor, y = Salario_vendedor, fill = Estado_civil_vendedor)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Blues") +
  scale_x_discrete(position = "bottom") +  # Mover etiquetas a la parte inferior
  labs(x = "Estado Civil",
       y = "Salario") +
  theme(plot.title = element_text(hjust = 0.5)) +  # Centrar el título
  ggtitle("Distribución de Salarios ")

#prueba dispersión
ggplot(data = df)+
geom_point(mapping = aes(x =df$Edad_vendedor, y =df$Salario_vendedor,
                         color=df$Estado_civil_vendedor))

# barplot producto
tf <- sort(table(df$Producto),decreasing = FALSE)
barplot(tf,horiz = TRUE, main = "Venta por Producto", col = "blue")

prueba <- table(df$Pais_cliente)
print(prueba)

hist(df$Salario_vendedor, freq = FALSE, xlab = "Venta", main = "Histograma de Salarios")

Q1 <- quantile(x=df$Venta, 0.25)
Q2 <- quantile(x=df$Venta, 0.5)
Q3 <- quantile(x=df$Venta, 0.75)

barplot(table(df$Producto),names.arg = df$Ventas)
abline(h = Q1, col = "red")
abline(h = Q2, col = "blue")
abline(h = Q3, col = "green")

# Clasificación credito
to <- sort(table(df$Clasificacion_credito), decreasing = FALSE)
porcentajes <- round(prop.table(to) * 100,2)
bp <- barplot(to,horiz = TRUE, main = "Clasificación Credito", col = "blue")
text(to, bp, labels = paste(porcentajes, "%"), pos = 4, col = "black")


# Medidas de dispersión

Promedio_media <- mean(df$Venta)
print(Promedio_media)

Promedio_mediana <- median(df$Venta, na.rm = FALSE)
print(Promedio_mediana)

Promedio_de <- sd(df$Venta)
print(Promedio_de)


