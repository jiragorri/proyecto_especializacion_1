library(DBI)
con <- dbConnect(odbc::odbc(), driver = "ODBC Driver 17 for SQL Server", 
    server = "DESKTOP-G6OUCN1", database = "Bases_Practica", 
    uid = "sa", pwd = "1234")
query <- "SELECT * FROM Bases_Practica.dbo.vw_informe_ventas_consolidado"
df <- dbGetQuery(con, query)
print(df)
library(ggplot2)

ggplot(data = na.omit(df), mapping = aes(x = df$Estado_civil_vendedor, y = df$Salario_vendedor)) +
  geom_boxplot()
