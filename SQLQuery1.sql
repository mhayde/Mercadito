use master
go 
create database Mercadito
go
use Mercadito
go

create table Proveedor(
idProveedor int not null identity(1,1),
nombre varchar(250) not null,
constraint pkProveedor primary key(idProveedor)
)
go
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
create table Inventario(
Productoid int null,
existencia int null,
constraint fkInventarioProducto foreign key(Productoid)
references Producto(idProducto)
)
go
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
('Semitas',15,19,3)



select *from Producto