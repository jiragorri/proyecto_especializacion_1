create or alter view vw_informe_ventas_consolidado

as

select 
	v.*, 
	c.Nombre as Nombre_cliente,
	c.Direccion as Direccion_cliente,
	c.Pais as Pais_cliente,
	c.Telefono as Telefono_cliente,
	pr.Producto as Producto,
	z.Zona as Zona_venta,
	ve.Apellido as Apellido_Vendedor,
	ve.Nombre as Nombre_vendedor,
	ve.Edad as Edad_vendedor,
	ve.Estado_Civil as Estado_civil_vendedor,
	ve.Salario as Salario_vendedor,
	ve.Telefono as Telefono_vendedor,
	tf.Fecha as Fecha_de_venta,
	tf.Anio as Anio_de_venta,
	tf.Dia as Dia_de_venta,
	tf.Mes as Mes_de_venta,
	tf.NombreDia as Nombre_dia,
	tf.NombreMes as Nombre_mes,
	tf.Trimestre as Trimestre
from Ventas v
left join Clientes c
	on v.ID_Cliente = c.ID_Cliente
left join Zona z
	on v.ID_zona = z.ID_zona
left join Producto pr
	on v.ID_Producto = pr.ID_Producto
left join Vendedor ve
	on v.ID_Vendedor = ve.ID_Vendedor
left join vw_tabla_fechas tf
	on v.Fecha_venta = tf.Fecha_venta 
	

