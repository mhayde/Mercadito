use master
go 
create database Mercadito
go
use Mercadito
go
--CREACION de tablas

--crear tabla proveedor
create table Proveedor(
idProveedor int not null identity(1,1),
nombre varchar(250) not null,
constraint pkProveedor primary key(idProveedor)
)
go
--crear tabla cliente
create table Cliente(
idCliente int not null identity(1,1),
nombre varchar(250) not null,
constraint pkCliente primary key(idCliente)
)
go
--crear tabla tipo de pago
create table TipodePago(
idTipodePago int not null identity(1,1),
nombre varchar(250) not null,
constraint pkidTipodePago primary key(idTipodePago)
)
go
--crear tabla gastos
create table Gastos(
idGastos int not null identity(1,1),
nombre varchar(250) not null,
monto int null,
constraint pkGastos primary key(idGastos)
)
go
--tabla producto
create table Producto(
idProducto int not null identity(1,1),
nombre varchar(250) not null,
preciocompra int null,
precioventa int null,
Proveedorid int not null,
constraint pkProducto primary key(idProducto),
constraint fkProveedorProducto foreign key(Proveedorid)
references Proveedor(idProveedor)
)
go
--tabla de compras
create table Compras(
    idCompras int not null identity(1,1),
    cantidad
    Productoid
    TipodePagoid
    constraint pkCompras primary key(idCompras),
    constraint fkProductoCompras foreign key(Productoid)
    references Producto(idProducto)
    constraint fkTipodePagoCompras foreign key(TipodePagoid)
    references TipodePago(idTipodePago)
)
go
--tabla de ventas
create table Ventas(
    idVentas int not null identity(1,1),
    cantidad
    Productoid
    TipodePagoid
    Clienteid
    constraint pkVentas primary key(idVentas),
    constraint fkProductoVentas foreign key(Productoid)
    references Producto(idProducto)
    constraint fkTipodePagoVentas foreign key(TipodePagoid)
    references TipodePago(idTipodePago)
    constraint fkClienteVentas foreign key(Clienteid)
    references Cliente(idCliente)
)
go
create table Inventario(
existencia int null,
Productoid int null,
Comprasid int null,
Ventasid int null,
constraint fkProductoInventario foreign key(Productoid)
references Producto(idProducto)
constraint fkComprasInventario foreign key(Comprasid)
references Compras(idCompras)
constraint fkVentasInventario foreign key(Ventasid)
references Ventas(idVentas)
)
go
create table Pagos(
idPagos int not null identity(1,1),
Proveedorid int null,
monto int null,
constraint pkPagos primary key(idPagos),
constraint fkProveedorPago foreign key(Proveedorid)
references Proveedor(idProveedor)
)
go
create table Cobros(
idCobros int not null identity(1,1),
Clienteid int null,
monto int null,
constraint pkCobros primary key(idCobros),
constraint fkClientesPago foreign key(Clienteid)
references Cliente(idCliente)
)
go
create table Caja(
Compraid int not null identity(1,1),
Ventaid int null,
Gastoid int null,
Pagoid int null,
Cobroid int null,
constraint fkCompraCaja foreign key(Compraid)
references Compras(idCompras)
constraint fkVentasCaja foreign key(Ventaid)
references Ventas(idVentas)
constraint fkGastosCaja foreign key(Gastoid)
references Gastos(idGastos)
constraint fkPagoCaja foreign key(Pagoid)
references Pagos(idPagos)
constraint fkCobroCaja foreign key(Cobroid)
references Cobros(idCobros)
)

go
--insert de datos
insert Proveedor(nombre)
values
('Pepsi'),
('Cocacola'),
('Pan Bimbo'),
('Pan Centeno'),
('Yummies'),
('Sula'),
('Leyde'),
('Diana'),
('Fresimas'),
('El pueblo')
go
insert Cliente(nombre)
values
('Maria'),
('Jose'),
('Esteban'),
('Padre'),
('Madre'),
('Mikeyla'),
('Alejandra'),
('Sofia'),
('Victor'),
--cuenta personal en la cual se mostrara el gasto de la casa
('Casa')
go
insert TipodePago
values
--definir los tipos de pago asi los podemos mandar a caja
('Contado'),
('Credito')
go
insert Gastos
values
--definir los gastos
('Luz',300),
('Agua',400),
('Internet',500),
('Alcaldia',200)
go
insert Producto
values
('Pepsi 1.5 litros',15,19,1),
('Pepsi 2 litros',20,25,1),
('Pepsi 3 litros',30,35,1),
('Pepsi 3.5 litros',40,45,1),
('Cocacola 1.5 litros',15,19,2),
('Cocacola 2 litros',20,25,2),
('Cocacola 3 litros',30,35,2),
('Cocacola 3.5 litros',40,45,2),
('Semitas',15,19,3),
('Tostacas',15,19,3)
go
insert Compras
values
(13,1,1),
(13,2,1),
(13,1,1),
(13,2,1),
(13,3,1),
(13,4,1),
(13,5,1),
(13,6,1),
(13,1,1),
(13,2,1)
go
insert Ventas
values
(1,1,2,1),
(1,2,3,1),
(1,1,1,2),
(1,2,1,2),
(1,3,1,2),
(10,4,1,2),
(1,5,1,2),
(2,6,1,2),
(3,1,1,2),
(3,2,1,2)
go
insert Pagos
values
(1,1,200),
(1,2,300),
(1,1,10),
go
insert Cobros
values
(1,1,200),
(1,2,300),
(1,1,10),

select *from Producto