create or alter view vw_revision_pagos_vs_ventas

as

select 
	P.ID_pago,
	P.ID_venta,
	cast(V.Fecha_venta as Date) as Fecha_venta,
	cast(P.Fecha_pago as Date) as Fecha_pago,
	max(CONVERT(int,V.Venta)) as Venta,
	sum(convert(int,REPLACE(P.Pago,'.',''))) as Pago,
	max(CONVERT(int,V.Venta)) - sum(convert(int,REPLACE(P.Pago,'.',''))) as Diferencia_Pago_Venta,
	datediff(day,cast(V.Fecha_venta as Date),cast(P.Fecha_pago as Date)) as Dias_de_mora
from Pago P
left join Ventas V
	on P.ID_venta = V.ID_Venta
group by 
	P.ID_pago,
	P.ID_venta,
	Fecha_venta,
	Fecha_pago