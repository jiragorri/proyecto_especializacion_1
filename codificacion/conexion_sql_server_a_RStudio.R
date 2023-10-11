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




