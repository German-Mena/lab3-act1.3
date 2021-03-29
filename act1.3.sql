create database act1_3
GO
use act1_3
GO
/*create table tipoCliente(
	
	tipo varchar(60)
)
GO*/
create table nombreTipoCliente(
	nombre varchar(60),
	primary key(nombre)
)
create table cliente(
	id bigint identity(1,1),
	razonSocial varchar(60) not null,
	cuit varchar(20) not null unique,
	tipoCliente varchar(60) not null,
	primary key(id),
	foreign key (tipoCliente) references nombreTipoCliente(nombre)
)
GO
create table contacto(
	id bigint,
	mail varchar(60) not null,
	telefono int not null,
	celular int not null,
	primary key(id, mail, telefono, celular),
	foreign key (id) references cliente(id)
)
GO
create table proyecto(
	id varchar(10),
	nombre varchar(60) not null unique,
	cliente bigint,
	primary key(id),
	foreign key(cliente) references cliente(id)
)
GO
create table infoProyecto(
	id varchar(10),
	descripcion varchar(100),
	fechaInicio date not null check(fechaInicio < GETDATE()),
	fechaFin date check (fechaFin > GETDATE()),
	costo money not null check (costo > 0),
	vigente bit default (1),
	primary key(id),
	foreign key(id) references proyecto(id)
)






