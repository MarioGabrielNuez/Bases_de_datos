select * from empleado;
select * from cliente;
select * from pedido;

select * from cliente inner join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
select cliente.nombre_cliente, concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) 
  from cliente 
  right join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
  where puesto = 'Representante Ventas'
  order by cliente.nombre_cliente asc;
  
select cliente.nombre_cliente, concat_ws(" ", empleado.nombre, empleado.apellido1, empleado.apellido2) from cliente inner join empleado on cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

SELECT nombre, concat(precio_venta, '€') as Precio_unitario, concat(round(((precio_venta * 10) / 100), 2), '€') as IVA FROM producto;

SELECT nombre, concat(precio_unidad, '€') as Precio, concat(round(((precio_unidad * 10) / 100), 2), '€') as IVA, concat(precio_venta, '€') as PVP FROM producto inner join detalle_pedido on detalle_pedido.codigo_producto = producto.codigo_producto;

select gama, nombre_cliente from detalle_pedido inner join producto on producto.codigo_producto = detalle_pedido.codigo_producto
												inner join pedido on detalle_pedido.codigo_pedido = pedido.codigo_pedido
												inner join cliente on cliente.codigo_cliente = pedido.codigo_cliente;

select * from detalle_pedido right join producto on producto.codigo_producto = detalle_pedido.codigo_producto where isnull(codigo_pedido);    

select gama, nombre_cliente, fecha_pago, id_transaccion, total from detalle_pedido inner join producto on producto.codigo_producto = detalle_pedido.codigo_producto
												inner join pedido on detalle_pedido.codigo_pedido = pedido.codigo_pedido
												inner join cliente on cliente.codigo_cliente = pedido.codigo_cliente
                                                left join pago on pago.codigo_cliente = cliente.codigo_cliente
                                                where isnull(id_transaccion);
                                
