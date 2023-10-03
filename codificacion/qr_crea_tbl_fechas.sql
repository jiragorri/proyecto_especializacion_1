create or alter view vw_tabla_fechas as
select distinct
	Fecha_venta,
	cast(Fecha_venta as Date) as Fecha,
	YEAR(Fecha_venta) as Anio,
	MONTH(Fecha_venta) as Mes,
	DAY(Fecha_venta) as Dia,
	DATEPART(QUARTER, Fecha_venta) AS Trimestre,
	DATENAME(MONTH, Fecha_venta) AS NombreMes,
	DATENAME(WEEKDAY, Fecha_venta) AS NombreDia

from [dbo].[Ventas];



