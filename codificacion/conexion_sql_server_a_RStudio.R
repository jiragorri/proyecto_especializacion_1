library(DBI)
con <- dbConnect(odbc::odbc(), driver = "ODBC Driver 17 for SQL Server", 
    server = "DESKTOP-G6OUCN1", database = "Bases_Practica", 
    uid = "sa", pwd = "1234")
query <- "SELECT * FROM Bases_Practica.dbo.vw_informe_ventas_consolidado"
df <- dbGetQuery(con, query)
print(df)
