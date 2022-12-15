--SQL
USE Master;
GO
IF DB_ID (N'´Zapateria') IS NOT NULL 
	DROP DATABASE  Zapateria;
	GO 

   CREATE DATABASE Zapateria
	ON 
	 ( NAME  = Zapateria,
	   FILENAME = 'D:\Zapateria.mdf', 
	   SIZE = 10, 
	   MAXSIZE = 50,
	   FILEGROWTH = 5 )

LOG ON 
(NAME = Sales_log,
	FILENAME ='D:\Zapateria.ldf' , 
	SIZE = 5MB,
	MAXSIZE = 25MB,
	FILEGROWTH = 5MB)


GO 
USE Zapateria;
GO

--tablas-- 
CREATE TABLE Sucursal
(
    idSucursal int identity (1,1),
	telefono int not null,
	numeroexterior  VARCHAR (50) NOT NULL,
	direccion VARCHAR (50) NOT NULL,
	cp VARCHAR (50) NOT NULL,
	estatus BIT DEFAULT 1 NOT NULL,
); 
GO

CREATE TABLE Mantenimiento
(
	idMantenimiento int identity (1,1),
	tipomantenimiento VARCHAR(50) NOT NULL, 
	personaldemantenimiento VARCHAR(50) NOT NULL,
	idSucursal int not null,
	estatus BIT DEFAULT 1 NOT NULL,

);
GO 

CREATE TABLE Representante
(
	idRepresentante  int identity (1,1),
	nombre VARCHAR(50) not null,
	direccion VARCHAR(50) not null,
	telefono INT NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO


CREATE TABLE Proveedor
(
	idProveedor int identity (1,1),
	nombre VARCHAR(50) not null,
	direccion VARCHAR(50) not null,
	telefono INT NOT NULL,
	idSucursal INT NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO

CREATE TABLE PagoServicio
(
	idPagoServicio int identity (1,1),
	tipodepagoservicio VARCHAR (50) NOT NULL,
	cantidad INT NOT NULL,
	servicio VARCHAR (50) NOT NULL,
	fecha  DATETIME  NOT NULL,
	idSucursal INT NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Mobiliario
(
	idMobiliario int identity (1,1),
	areapertenece VARCHAR (50) NOT NULL,
	cantida INT NOT NULL,
	idSucursal INT NOT NULL, 
	estatus bit default 1 not null,
);
GO

CREATE TABLE Departamento
(
	idDepartamento int identity (1,1),
	tipodepartamento VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Contrato
(
	idContrato int identity (1,1),
	tipocontrato VARCHAR (50) NOT NULL, 
	fecha DATETIME NOT NULL,
	idSucursal INT NOT NULL, 
	estatus BIT DEFAULT 1 NOT NULL,

);
GO
CREATE TABLE Inventario
(
	idInventario int identity (1,1),
	personalencargado VARCHAR (50) NOT NULL,
	tipoinventario VARCHAR (50) NOT NULL,
	fecha DATETIME NOT NULL,
	idBodega INT NOT  NULL, 
	estatus BIT DEFAULT 1 not null,
);
GO


CREATE TABLE ZonaDescarga
(
	idZonaDescarga int identity (1,1),
	horariodisponible DATETIME NOT NULL,
	idBodega INT NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO

CREATE TABLE Bodega
(
	idBodega int identity (1,1),
	capacidad  VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE MercanciaExtra
(
	idMercanciaExtra int identity (1,1),
	tipomercancia INT NOT NULL,
	fecha  DATETIME NOT NULL,
	idBodega INT NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Horario
(
	idHorario int identity (1,1),
	horasalida DATETIME NOT NULL,
	horaentrada DATETIME NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Sindicato
(
	idSindicato int identity (1,1),
	nombresindicato VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE TipoTransporte
(
	idTipoTransporte int identity (1,1),
	chofer VARCHAR (50) NOT NULL,
	numero int not null,
	fechasalida DATETIME NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Envio
(
	idEnvio  int identity (1,1), 
	direccion VARCHAR (50) NOT NULL,
	numero VARCHAR (50) not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Entrega
(
	idEntrega int identity (1,1),
	direccion VARCHAR (50) NOT NULL,
	nombre VARCHAR (50) NOT NULL,
	fecha DATETIME NOT NULL,
	idTipoTransporte INT NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Vigilancia
(
	idVigilancia int identity (1,1),
	numeroguardia INT NOT NULL,
	idSucursal INT NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Zapato
(
	idZapato int identity (1,1),
	tipozapato VARCHAR (50) NOT NULL,
	precio int not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Talla
(
	idTalla int identity (1,1),
	idZapato INT NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Marca
(
	idMarca int identity (1,1),
	nombremarca VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Coleccion
(
	idColeccion int identity (1,1),
	nombrecoleccion VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Publicidad
(
	idPublicidad int identity (1,1),
	tipopublicidad VARCHAR (50) NOT NULL,
	fechapublicidad DATETIME NOT NULL,
	idZapato int not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE MateriaPrima
(
	idMateriaPrima int identity (1,1),
	ubicacion VARCHAR (50) NOT NULL,
	calidad VARCHAR (50) not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Seccion
(
	idSeccion int identity (1,1), 
	nombreseccion VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Modelo
(
	idModelo int identity (1,1),
	preciomodelo INT NOT NULL,
	numeromodelo VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Venta
(
	idVenta int identity (1,1),
	nombreempleado VARCHAR (50) NOT NULL,
	folioventa INT NOT NULL,
	idZapato int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE PedidoLinea
(
	idPedidoLinea int identity (1,1),
	fechapedido varchar (50),
	estatus bit default 1 not null,
);
GO
CREATE TABLE Reembolso
(
	idReembolso int identity (1,1),
	cantidadreembolso INT NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Factura
(
	idFactura int identity (1,1),
	foliofactura VARCHAR (50) NOT NULL,
	fechafactura DATETIME NOT NULL,
	nombrefactura VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE TipoFacturacion
(
	idTipoFacturacion int identity (1,1),
	montofacturar INT NOT NULL,
	fechafacturacion DATETIME not null, 
	idFactura int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Compra
(
	idCompra int identity (1,1),
	cantidadcompra INT NOT NULL,
	fechacompra DATETIME NOT NULL,
	foliocompra VARCHAR (50) NOT NULL,
	idCliente int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Devolucion
(
	idDevolucion int identity (1,1),
	producto VARCHAR (50) NOT NULL,
	fechadevolucion DATETIME NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Apartado
(
	idApartado int identity (1,1),
	cantidad INT NOT NULL,
	producto VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Oferta
(
	idOferta  int identity (1,1),
	productoferta VARCHAR (50) NOT NULL,
	fechaoferta DATETIME NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE MetodoPago
(
	idMetodoPago int identity (1,1),
	pagotarjeta int  NOT NULL,
	pagoefectivo int NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Caja
(
	idCaja int identity (1,1),
	detallecaja VARCHAR (50) NOT NULL,
	numerocaja VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Cliente
(
	idCliente int identity (1,1),
	clientegeneral VARCHAR (50) NOT NULL,
	clienterevendedor VARCHAR (50) NOT NULL,
	idEstacionamiento VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Credito
(
	idCredito int identity (1,1),
	montocredito INT NOT NULL,
	idCliente INT NOT NULL, 
	estatus bit default 1 not null,
);
GO

CREATE TABLE Estacionamiento
(
	idEstacionamiento int identity (1,1),
	estacionamientocliente VARCHAR (50) NOT NULL,
	estacionamientoempleado VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Empleado
(
	idEmpleado int identity (1,1),
	nombre VARCHAR (50) NOT NULL,
	telefono INT NOT NULL,
	areaempleado VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Capacitacion
(
	idCapacitacion int identity (1,1),
	fechacapacitacion DATETIME NOT NULL,
	tipocapacitacion VARCHAR (50) NOT NULL,
	idEmpleado int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Puesto
(
	idPuesto int identity (1,1),
	nombrepuesto VARCHAR (50) NOT NULL,
	areapuesto VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Prestacion
(
	idPrestacion int identity (1,1),
	tipoprestacion VARCHAR (50) NOT NULL,
	estatus bit default 1 not null
);
GO

CREATE TABLE Nomina 
(
	idNomina int identity (1,1),
	fechanomina DATETIME  NOT NULL,
	numeronomina VARCHAR (50) NOT NULL,
	folionomina VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE Cotizacion
(
	idCotizacion int identity (1,1),
	productocotizacion VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE CorteCaja
(
	idCorteCaja int identity (1,1),
	empleadocorte VARCHAR (50) NOT NULL,
	fechacorte DATETIME NOT NULL,
	estatus bit default 1 not null,
);
GO


CREATE TABLE Ticket
(
	idTicket int identity (1,1),
	fecha DATETIME NOT NULL,
	idDevolucion int not null, 
	estatus bit default 1 not null,
);
GO



CREATE TABLE Vale
(
	idVale int identity (1,1),
	cantidadvale INT NOT NULL,
	idCliente int not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE TipoCalzado
(
	idTipoCalzado int identity (1,1),
	calzadohombre VARCHAR (50) NOT NULL,
	calzadomujer VARCHAR (50) NOT NULL,
	estatus bit default 1 not null,
);
GO

CREATE TABLE EmpleadoPrestacion
(
	idEmpleadoPrestacion int identity (1,1),
	idEmpleado int not null,
	idPrestacion int not null,
	estatus bit default 1 not null,
);
GO

CREATE TABLE EmpleadoHorario
(
	idEmpleadoHorario int identity (1,1),
	idEmpleado int not null,
	idHorario int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE SucursalDepartamento
(
	idSucursalDepartamento int identity (1,1),
	idSucursal int not null,
	idDepartamento int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE ClienteCotizacion
(
	idClienteCotizacion int identity (1,1),
	idCliente int not null,
	idCotizacion int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE ClienteApartado
(
	idClienteApartado int identity (1,1),
	idCliente int not null,
	idApartado int not null,
	fechaapartado varchar (50) not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE CompraOferta
(
	idCompraOferta int identity (1,1),
	idCompra int not null,
	idOferta int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE PedidoLineaEnvio
(
	idPedidoLineaEnvio int identity (1,1),
	idPedidoLinea int not null,
	idEnvio int not null,
	fechaenvio datetime not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE EnvioTipoTransporte
(
	idEnvioTipoTransporte int identity (1,1),
	idEnvio int not null,
	idTipoTransporte int not null,
	fechaenvio datetime not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE ZapatoMateriaPrima
(
	idZapatoMateriaPrima int identity (1,1),
	idZapato int not null,
	idMateriaPrima int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE ZapatoTipoCalzado
(
	idZapatoTipoCalzado int identity (1,1),
	idZapato int not null,
	idTipoCalzado int not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE CotizacionCliente
(
	idCotizacionCliente int identity (1,1),
	idCotizacion varchar (50) not null,
	idCliente varchar (50) not null,
	productocotizacion varchar (50) not null,
	estatus bit default 1 not null,
);
GO
CREATE TABLE CompraMetodoPago
(
	idCompraMetodoPago int identity (1,1),
	idCompra int not null,
	idMetodoPago int not null,
	fechacompra datetime not null,
	estatus bit default 1 not null,
);
GO


CREATE TABLE SucursalProveedor
(
	idSucursalProveedor int identity (1,1),
	idSucursal int not null,
	idProveedor int not null,
	estatus bit default 1 not null,
);
GO


--LLAVES PRIMARIAS
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)
ALTER TABLE Mantenimiento ADD CONSTRAINT PK_Mantenimiento PRIMARY KEY (idMantenimiento)
ALTER TABLE Representante ADD CONSTRAINT PK_Representante PRIMARY KEY (idRepresentante)
ALTER TABLE Proveedor ADD CONSTRAINT PK_Proveedor PRIMARY KEY (idProveedor)
ALTER TABLE PagoServicio ADD CONSTRAINT PK_PagoServicio PRIMARY KEY (idPagoServicio)
ALTER TABLE Mobiliario ADD CONSTRAINT PK_Mobiliario PRIMARY KEY (idMobiliario)
ALTER TABLE Departamento ADD CONSTRAINT PK_Departamento PRIMARY KEY (idDepartamento)
ALTER TABLE Contrato ADD CONSTRAINT PK_Contrato PRIMARY KEY (idContrato)
ALTER TABLE Inventario ADD CONSTRAINT PK_Inventario PRIMARY KEY (idInventario)
ALTER TABLE Bodega ADD CONSTRAINT PK_Bodega PRIMARY KEY (idBodega)
ALTER TABLE TipoTransporte ADD CONSTRAINT PK_TipoTransporte PRIMARY KEY (idTipoTransporte)
ALTER TABLE Envio ADD CONSTRAINT PK_Envio PRIMARY KEY (idEnvio)
ALTER TABLE Entrega ADD CONSTRAINT PK_Entrega PRIMARY KEY (idEntrega)
ALTER TABLE Vigilancia ADD CONSTRAINT PK_Vigilancia PRIMARY KEY (idVigilancia)
ALTER TABLE Zapato ADD CONSTRAINT PK_Zapato PRIMARY KEY (idZapato)
ALTER TABLE Talla ADD CONSTRAINT PK_Talla PRIMARY KEY (idTalla)
ALTER TABLE Marca ADD CONSTRAINT PK_Marca PRIMARY KEY (idMarca)
ALTER TABLE Coleccion ADD CONSTRAINT PK_Coleccion PRIMARY KEY (idColeccion)
ALTER TABLE Publicidad ADD CONSTRAINT PK_Publicidad PRIMARY KEY (idPublicidad)
ALTER TABLE MateriaPrima ADD CONSTRAINT PK_MateriaPrima PRIMARY KEY (idMateriaPrima)
ALTER TABLE Seccion ADD CONSTRAINT PK_Seccion PRIMARY KEY (idSeccion)
ALTER TABLE Modelo ADD CONSTRAINT PK_Modelo PRIMARY KEY (idModelo)
ALTER TABLE Venta ADD CONSTRAINT PK_Venta PRIMARY KEY (idVenta)
ALTER TABLE PedidoLinea ADD CONSTRAINT PK_PedidoLinea PRIMARY KEY (idPedidoLinea)
ALTER TABLE Reembolso ADD CONSTRAINT PK_Reembolso PRIMARY KEY (idReembolso)
ALTER TABLE Factura ADD CONSTRAINT PK_Factura PRIMARY KEY (idFactura)
ALTER TABLE TipoFacturacion ADD CONSTRAINT PK_TipoFacturacion PRIMARY KEY (idTipoFacturacion)
ALTER TABLE Compra ADD CONSTRAINT PK_Compra PRIMARY KEY (idCompra)
ALTER TABLE Devolucion ADD CONSTRAINT PK_Devolucion PRIMARY KEY (idDevolucion)
ALTER TABLE Apartado ADD CONSTRAINT PK_Apartado PRIMARY KEY (idApartado)
ALTER TABLE Oferta ADD CONSTRAINT PK_Oferta PRIMARY KEY (idOferta)
ALTER TABLE MetodoPago ADD CONSTRAINT PK_MetodoPago PRIMARY KEY (idMetodoPago)
ALTER TABLE Caja ADD CONSTRAINT PK_Caja PRIMARY KEY (idCaja)
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (idCliente)
ALTER TABLE Credito ADD CONSTRAINT PK_Credito PRIMARY KEY (idCredito)
ALTER TABLE Estacionamiento ADD CONSTRAINT PK_Estacionamiento PRIMARY KEY (idEstacionamiento)
ALTER TABLE Empleado ADD CONSTRAINT PK_Empleado PRIMARY KEY (idEmpleado)
ALTER TABLE Capacitacion ADD CONSTRAINT PK_Capacitacion PRIMARY KEY (idCapacitacion)
ALTER TABLE Puesto ADD CONSTRAINT PK_Puesto PRIMARY KEY (idPuesto)
ALTER TABLE Prestacion ADD CONSTRAINT PK_Prestacion PRIMARY KEY (idPrestacion)
ALTER TABLE Nomina ADD CONSTRAINT PK_Nomina PRIMARY KEY (idNomina)
ALTER TABLE Cotizacion ADD CONSTRAINT PK_Cotizacion PRIMARY KEY (idCotizacion)
ALTER TABLE ZonaDescarga ADD CONSTRAINT PK_ZonaDescarga PRIMARY KEY (idZonaDescarga)
ALTER TABLE CorteCaja ADD CONSTRAINT PK_CorteCaja PRIMARY KEY (idCorteCaja)
ALTER TABLE Ticket ADD CONSTRAINT PK_Ticket PRIMARY KEY (idTicket)
ALTER TABLE Horario ADD CONSTRAINT PK_Horario PRIMARY KEY (idHorario)
ALTER TABLE Vale ADD CONSTRAINT PK_Vale PRIMARY KEY (idVale)
ALTER TABLE MercanciaExtra ADD CONSTRAINT PK_MercanciaExtra PRIMARY KEY (idMercanciaExtra)
ALTER TABLE Sindicato ADD CONSTRAINT PK_Sindicato PRIMARY KEY (idSindicato)
ALTER TABLE TipoCalzado ADD CONSTRAINT PK_TipoCalzado PRIMARY KEY (idTipoCalzado)
ALTER TABLE SucursalDepartamento ADD CONSTRAINT PK_SucursalDepartamento PRIMARY KEY (idSucursalDepartamento)
ALTER TABLE EmpleadoPrestacion  ADD CONSTRAINT PK_EmpleadoPrestacion  PRIMARY KEY (idEmpleadoPrestacion)
ALTER TABLE EmpleadoHorario ADD CONSTRAINT PK_EmpleadoHorario PRIMARY KEY (idEmpleadoHorario)
ALTER TABLE ClienteCotizacion  ADD CONSTRAINT PK_ClienteCotizacion  PRIMARY KEY (idClienteCotizacion)
ALTER TABLE ClienteApartado ADD CONSTRAINT PK_ClienteApartado PRIMARY KEY (idClienteApartado)
ALTER TABLE CompraMetodoPago  ADD CONSTRAINT PK_CompraMetodoPago PRIMARY  KEY (idCompraMetodoPago)
ALTER TABLE CompraOferta ADD CONSTRAINT PK_CompraOferta PRIMARY KEY (idCompraOferta)
ALTER TABLE PedidoLineaEnvio  ADD CONSTRAINT PK_PedidoLineaEnvio PRIMARY KEY (idPedidoLineaEnvio)
ALTER TABLE EnvioTipoTransporte ADD CONSTRAINT PK_EnvioTipoTransporte PRIMARY KEY (idEnvioTipoTransporte)
ALTER TABLE ZapatoMateriaPrima  ADD CONSTRAINT PK_ZapatoMateriaPrima PRIMARY KEY (idZapatoMateriaPrima)
ALTER TABLE ZapatoTipoCalzado ADD CONSTRAINT PK_ZapatoTipoCalzado PRIMARY KEY (idZapatoTipoCalzado)
ALTER TABLE SucursalProveedor ADD CONSTRAINT PK_SucursalProveedor PRIMARY KEY (idSucursalProveedor)


--------LLAVES FORANEAS

--Capacitacion
ALTER TABLE Capacitacion ADD CONSTRAINT FK_CapacitacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)

-- Contrato
ALTER TABLE Contrato ADD CONSTRAINT FK_ContratoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Compra
ALTER TABLE Compra ADD CONSTRAINT FK_CompraCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--Credito
ALTER TABLE Credito ADD CONSTRAINT FK_CreditoCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--Entrega 
ALTER TABLE Entrega ADD CONSTRAINT FK_EntregaTipoTransporte FOREIGN KEY (idTipoTransporte) REFERENCES
TipoTransporte(idTipoTransporte)

--TipoFacturacion
ALTER TABLE TipoFacturacion ADD CONSTRAINT FK_TipoFacturacionFactura FOREIGN KEY (idFactura) REFERENCES
Factura(idFactura)

--Inventario
ALTER TABLE Inventario ADD CONSTRAINT FK_InventarioBodega FOREIGN KEY (idBodega) REFERENCES
Bodega(idBodega)

--Talla
ALTER TABLE  Talla ADD CONSTRAINT FK_TallaZapato FOREIGN KEY (idZapato) REFERENCES
Zapato(idZapato)

--Ticket
ALTER TABLE  Ticket ADD CONSTRAINT FK_TicketDevolucion FOREIGN KEY (idDevolucion) REFERENCES
Devolucion(idDevolucion)

---Mobiliario 
ALTER TABLE Mobiliario ADD CONSTRAINT FK_MobiliarioSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal (idSucursal)

--Publicidad
ALTER TABLE Publicidad ADD CONSTRAINT FK_PublicidadZapato FOREIGN KEY (idZapato) REFERENCES
Zapato (idZapato)

--MercanciaExtra
ALTER TABLE MercanciaExtra ADD CONSTRAINT FK_MercanciaExtraBodega FOREIGN KEY (idBodega) REFERENCES
Bodega (idBodega)

---Mantenimiento 
ALTER TABLE Mantenimiento ADD CONSTRAINT FK_MantenimientoSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal (idSucursal)

--PagoServicio
ALTER TABLE PagoServicio ADD CONSTRAINT FK_PagoServicioSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Proveedor
ALTER TABLE Proveedor ADD CONSTRAINT FK_ProveedorSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--Vale
ALTER TABLE Vale ADD CONSTRAINT FK_ValeCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

--Venta
ALTER TABLE Venta ADD CONSTRAINT FK_VentaZapato FOREIGN KEY (idZapato) REFERENCES
Zapato(idZapato)

--Vigilancia
ALTER TABLE Vigilancia ADD CONSTRAINT FK_VigilanciaSucursal FOREIGN KEY (idSucursal) REFERENCES
Sucursal(idSucursal)

--ZonaDescarga
ALTER TABLE ZonaDescarga ADD CONSTRAINT FK_ZonaDescargaBodega FOREIGN KEY (idBodega) REFERENCES
Bodega(idBodega)

-----Estacionamiento

ALTER TABLE Estacionamiento ADD CONSTRAINT FK_EstacionamientoEmpleado FOREIGN KEY (idBodega) REFERENCES
Bodega(idBodega)
-------SUCURSALDEPARTAMENTO

ALTER TABLE SucursalDepartamento ADD CONSTRAINT FK_SucursalDepartamentoDepartamento FOREIGN KEY (idDepartamento) REFERENCES
Departamento (idDepartamento)

ALTER TABLE SucursalProveedor ADD CONSTRAINT FK_SucursalProveedorProveedor FOREIGN KEY (idProveedor) REFERENCES
Proveedor (idProveedor)

-----EMPLEADOPRESTACION

ALTER TABLE EmpleadoPrestacion ADD CONSTRAINT FK_EmpleadoPrestacionPrestacion FOREIGN KEY (idPrestacion) REFERENCES
Prestacion (idPrestacion)

ALTER TABLE EmpleadoPrestacion ADD CONSTRAINT FK_EmpleadoPrestacionEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado (idEmpleado)

ALTER TABLE EmpleadoNomina ADD CONSTRAINT FK_EmpladoNominaNomina FOREIGN KEY (idNomina) REFERENCES
Nomina (idNomina)
ALTER TABLE EmpleadoNomina ADD CONSTRAINT FK_EmpleadoNominaEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado (idEmpleado)

ALTER TABLE EmpleadoHorario ADD CONSTRAINT FK_EmpleadoHorarioHorario FOREIGN KEY (idHorario) REFERENCES
Horario(idHorario) 
ALTER TABLE EmpleadoHorario ADD CONSTRAINT FK_EmpleadoHorarioEmpleado FOREIGN KEY (idEmpleado) REFERENCES
Empleado(idEmpleado)

-----CLIENTECOTIZACION

--ClienteCotizacion
ALTER TABLE ClienteCotizacion ADD CONSTRAINT FK_ClienteCotizacionCotizacion FOREIGN KEY (idCotizacion) REFERENCES
Cotizacion(idCotizacion)
ALTER TABLE ClienteCotizacion ADD CONSTRAINT FK_ClienteCotizacionCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)
--CLIENTEAPARTADO
ALTER TABLE ClienteApartado ADD CONSTRAINT FK_ClienteApartadoApartado FOREIGN KEY (idApartado) REFERENCES
Apartado(idApartado)

ALTER TABLE ClienteApartado ADD CONSTRAINT FK_ClienteApartadoCliente FOREIGN KEY (idCliente) REFERENCES
Cliente(idCliente)

-------COMPRAMETODOPAGO

ALTER TABLE CompraMetodoPago ADD CONSTRAINT FK_CompraMetodoPagoMetodoPago FOREIGN KEY (idMetodoPago) REFERENCES
MetodoPago(idMetodoPago)
ALTER TABLE CompraMetodoPago ADD CONSTRAINT FK_CompraMetodoPagoCompra FOREIGN KEY (idCompra) REFERENCES
MetodoPago(idMetodoPago)
-----COMPRAOFERTA
ALTER TABLE CompraOferta ADD CONSTRAINT FK_CompraOfertaOferta FOREIGN KEY (idOferta) REFERENCES
Oferta(idOferta)
ALTER TABLE CompraOferta ADD CONSTRAINT FK_CompraOfertaCompra FOREIGN KEY (idCompra) REFERENCES
Compra(idCompra)

------PEDIDOLINEAENVIO

ALTER TABLE PedidoLineaEnvio ADD CONSTRAINT FK_PedidoLineaEnvioEnvio FOREIGN KEY (idEnvio) REFERENCES
Envio(idEnvio)
ALTER TABLE PedidoLineaEnvio ADD CONSTRAINT FK_PedidoLineaEnvioPedidoLinea FOREIGN KEY (idPedidoLinea) REFERENCES
PedidoLinea(idPedidoLinea)


---ENVIOTIPOTRANSPORTE

ALTER TABLE EnvioTipoTransporte ADD CONSTRAINT FK_EnvioTipoTransporteTipoTransporte FOREIGN KEY (idTipoTransporte) REFERENCES
TipoTransporte(idTipoTransporte)
ALTER TABLE EnvioTipoTransporte ADD CONSTRAINT FK_EnvioTipoTransporteEnvio FOREIGN KEY (idEnvio) REFERENCES
Envio (idEnvio)

--------------ZAPATOMATERIAPRIMA
--ZAPATONATERIAORUNA
ALTER TABLE ZapatoMateriaPrima ADD CONSTRAINT FK_ZapatoMateriaPrimaMateriaPrima FOREIGN KEY (idMateriaPrima) REFERENCES
MateriaPrima(idMateriaPrima)
ALTER TABLE ZapatoMateriaPrima ADD CONSTRAINT FK_ZapatoMateriaPrimaZapato FOREIGN KEY (idZapato) REFERENCES
Zapato(idZapato)
--------ZAPATOCALZADO
ALTER TABLE ZapatoTipoCalzado ADD CONSTRAINT FK_ZapatoTipoCalzadoTipoCalzado FOREIGN KEY (idTipoCalzado) REFERENCES
TipoCalzado(idTipoCalzado)
ALTER TABLE ZapatoTipoCalzado ADD CONSTRAINT FK_ZapatoTipoCalzadoZapato FOREIGN KEY (idZapato) REFERENCES
Zapato(idZapato)



-----INDICES


CREATE INDEX IX_Apartado ON Apartado(idApartado)
CREATE INDEX IX_Bodega ON Bodega(idBodega)
CREATE INDEX IX_Caja ON Caja(idCaja)
CREATE INDEX IX_Capacitacion ON Capacitacion(idCapacitacion)
CREATE INDEX IX_Cliente ON Cliente(idCliente)
CREATE INDEX IX_Colección ON Coleccion(idColeccion)
CREATE INDEX IX_Compra ON Compra(idCompra)
CREATE INDEX IX_Contrato ON Contrato(idContrato)
CREATE INDEX IX_CorteCaja ON CorteCaja(idCorteCaja)
CREATE INDEX IX_Cotizacion ON Cotizacion(idCotizacion)
CREATE INDEX IX_Credito ON Credito(idCredito)
CREATE INDEX IX_Departamento ON Departamento(idDepartamento)
CREATE INDEX IX_Devolucion ON Devolucion(idDevolucion)
CREATE INDEX IX_Empleado ON Empleado(idEmpleado)
CREATE INDEX IX_Entrega ON Entrega(idEntrega)
CREATE INDEX IX_Envio ON Envio(idEnvio)
CREATE INDEX IX_Estacionamiento ON Estacionamiento(idEstacionamiento)
CREATE INDEX IX_Factura ON Factura(idFactura)
CREATE INDEX IX_Horario ON Horario(idHorario)
CREATE INDEX IX_Inventario ON Inventario(idInventario)
CREATE INDEX IX_Mantenimiento ON Mantenimiento(idMantenimiento)
CREATE INDEX IX_Marca ON Marca(idMarca)
CREATE INDEX IX_MateriaPrima ON MateriaPrima(idMateriaPrima)
CREATE INDEX IX_MetodoPago ON MetodoPago(idMetodoPago)
CREATE INDEX IX_Mobiliario ON Mobiliario(idMobiliario)
CREATE INDEX IX_Modelo ON Modelo(idModelo)
CREATE INDEX IX_Nomina ON Nomina(idNomina)
CREATE INDEX IX_Oferta ON Oferta(idOferta)
CREATE INDEX IX_PagoServicio ON PagoServicio(idPagoServicio)
CREATE INDEX IX_PedidoLinea ON PedidoLinea(idPedidoLinea)
CREATE INDEX IX_Prestacion ON Prestacion(idPrestacion)
CREATE INDEX IX_Proveedor ON Proveedor(idProveedor)
CREATE INDEX IX_Publicidad ON Publicidad(idPublicidad)
CREATE INDEX IX_Puesto ON Puesto(idPuesto)
CREATE INDEX IX_Representante ON Representante(idRepresentante)
CREATE INDEX IX_Seccion ON Seccion(idSeccion)
CREATE INDEX IX_Sindicato ON Sindicato(idSindicato)
CREATE INDEX IX_Sucursal ON Sucursal(idSucursal)
CREATE INDEX IX_Talla ON Talla(idTalla)
CREATE INDEX IX_Ticket ON Ticket(idTicket)
CREATE INDEX IX_TipoCalzado ON TipoCalzado(idTipoCalzado)
CREATE INDEX IX_TipoFacturacion ON TipoFacturacion(idTipoFacturacion)
CREATE INDEX IX_TipoTransporte ON TipoTransporte(idTipoTransporte)
CREATE INDEX IX_Vale ON Vale(idVale)
CREATE INDEX IX_Venta ON Venta(idVenta)
CREATE INDEX IX_Vigilancia ON Vigilancia(idVigilancia)
CREATE INDEX IX_Zapato ON Zapato(idZapato)
CREATE INDEX IX_ZonaDescarga ON ZonaDescarga(idZonaDescarga)
CREATE INDEX IX_SucursalDepartamento ON SucursalDepartamento(idSucursalDepartamento)
CREATE INDEX IX_EmpleadoPrestacion ON EmpleadoPrestacion(idEmpleadoPrestacion)
CREATE INDEX IX_EmpleadoHorario ON EmpleadoHorario(idEmpleadoHorario)
CREATE INDEX IX_ClienteCotizacion ON ClienteCotizacion(idClienteCotizacion)
CREATE INDEX IX_CompraMetodoPago ON CompraMetodoPago(idCompraMetodoPago)
CREATE INDEX IX_CompraOferta ON CompraOferta(idCompraOferta)
CREATE INDEX IX_ClienteApartado ON ClienteApartado(idClienteApartado)
CREATE INDEX IX_PedidoLineaEnvio ON PedidoLineaEnvio(idPedidoLineaEnvio)
CREATE INDEX IX_EnvioTipoTransporte ON EnvioTipoTransporte(idEnvioTipoTransporte)
CREATE INDEX IX_ZapatoMateriaPrima ON ZapatoMateriaPrima(idZapatoMateriaPrima)
CREATE INDEX IX_ZapatoTipoCalzado ON ZapatoTipoCalzado(idZapatoTipoCalzado)
CREATE INDEX IX_SucursalProveedor ON SucursalProveedor(idSucursalProveedor)

----------APARTADO
INSERT INTO Apartado (cantidad, producto) values(1, 'producto1')
GO
INSERT INTO Apartado (cantidad, producto) values(2, 'producto2')
GO
INSERT INTO Apartado (cantidad, producto) values(3, 'producto3')
GO
INSERT INTO Apartado (cantidad, producto) values(4, 'producto4')
GO
INSERT INTO Apartado (cantidad, producto) values(5, 'producto5')
GO
INSERT INTO Apartado (cantidad, producto) values(6, 'producto6')
GO
INSERT INTO Apartado (cantidad, producto) values(7, 'producto7')
GO
INSERT INTO Apartado (cantidad, producto) values(8, 'producto8')
GO
INSERT INTO Apartado (cantidad, producto) values(9, 'producto9')
GO
INSERT INTO Apartado (cantidad, producto) values(10, 'producto10')
GO

-----BODEGA
INSERT INTO Bodega (capacidad) values('capacidad1')
GO
INSERT INTO Bodega (capacidad) values ('capacidad2')
GO
INSERT INTO Bodega (capacidad) values('capacidad3')
GO
INSERT INTO Bodega (capacidad) values ('capacidad4')
GO
INSERT INTO Bodega (capacidad) values('capacidad5')
GO
INSERT INTO Bodega (capacidad) values ('capacidad6')
GO
INSERT INTO Bodega (capacidad) values('capacidad7')
GO
INSERT INTO Bodega (capacidad) values ('capacidad8')
GO
INSERT INTO Bodega (capacidad) values('capacidad9')
GO
INSERT INTO Bodega (capacidad) values ('capacidad10')
GO

--------CAJA

INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja1','detallecaja1')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja2','detallecaja2')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja3','detallecaja3')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja4','detallecaja4')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja5','detallecaja5')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja6','detallecaja6')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja7','detallecaja7')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja8','detallecaja8')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja9','detallecaja9')
GO
INSERT INTO Caja (numerocaja, detallecaja) values ('numerocaja10','detallecaja10')
GO

----------CAPACITACION

INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2002', 'capacitacion1','1','1')
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2022','capacitacion2','2','2') 
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2002', 'capacitacion3','3','3')
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2022','capacitacion4','4','4') 
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2002', 'capacitacion5','5','5')
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2022','capacitacion6','6','6') 
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2002', 'capacitacion7','7','7')
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2022','capacitacion8','8','8') 
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2002', 'capacitacion9','9','9')
GO
INSERT INTO Capacitacion (fechacapacitacion, tipocapacitacion, idEmpleado, estatus) values ('04/12/2022','capacitacion10','10','10') 
GO

----------CLIENTE
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral1', 'clienterevendedor1')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral2', 'clienterevendedor2')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral3', 'clienterendedor3')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral4', 'clienterevendedor4')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral5', 'clienterendedor5')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral6', 'clienterevendedor6')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral7', 'clienterendedor7')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral8', 'clienterevendedor8')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral9', 'clienterendedor9')
GO
INSERT INTO Cliente (clientegeneral, clienterevendedor) values ('clientegeneral10', 'clienterendedor10')
GO

----------COLECCION
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion1')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion2')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion3')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion4')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion5')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion6')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion7')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion8')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion9')
GO
INSERT INTO Coleccion (nombrecoleccion) values ('nombrecoleccion10')
GO

----COMPRA
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (1, '04/12/2022', '1','1','1')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (2, '04/12/2022', '2','2','2')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (3, '04/12/2022', '3','3','3')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (4, '04/12/2022', '4','4','4')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (5, '04/12/2022', '5','5','5')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (6, '04/12/2022', '6','6','6')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (7, '04/12/2022', '7','7','7')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (8, '04/12/2022', '8','8','8')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (9, '04/12/2022', '9','9','9')
GO
INSERT INTO Compra (cantidadcompra, fechacompra, foliocompra, idCliente, estatus) values (10, '04/12/2022', '10','10','10')
GO

--------CONTRATO
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato1', '1','1')
GO 
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato2', '2','2')
GO
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato3', '3','3')
GO 
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato4','4','4')
GO
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato5', '5','5')
GO 
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato6', '6','6')
GO
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato7','7','7')
GO 
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato8','8','8')
GO
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato9','9','9')
GO 
INSERT INTO Contrato (fecha, tipocontrato, idSucursal, estatus) values ('04/12/2022', 'tipocontrato10', '10','10')
GO

---------CORTECAJA
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte1', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte2', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte3', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte4', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte5', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte6', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte7', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte8', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte9', 04/12/2022)
GO
INSERT INTO Cortecaja (empleadocorte, fechacorte) values('empleadocorte10', 04/12/2022)
GO

-----COTIZACION

INSERT INTO Cotizacion (productocotizacion) values('productocotizacion1')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion2')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion3')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion4')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion5')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion6')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion7')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion8')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion9')
GO
INSERT INTO Cotizacion (productocotizacion) values('productocotizacion10')
GO

---------CREDITO
INSERT INTO Credito (montocredito, idCliente, estatus) values (1, '1','1')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (2,'2','2')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (3,'3','3')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (4,'4','4')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (5,'5','5')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (6,'6','6')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (7,'7','7')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (8,'8','8')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (9,'9','9')
GO
INSERT INTO Credito (montocredito, idCliente, estatus) values (10,'10','10')
GO

---------DEPARTAMENTO

INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento1')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento2')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento3')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento4')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento5')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento6')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento7')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento8')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento9')
GO
INSERT INTO Departamento (tipodepartamento) values ('tipodepartammento10')
GO

---------DEVOLUCION
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto1',  04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto2', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto3', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto4', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto5', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto6', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto7', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto8', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto9', 04/12/2022)
GO
INSERT INTO Devolucion (producto, fechadevolucion) values ('producto10', 04/12/2022)
GO

----------EMPLEADO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre1', 1, 'areaempleado1')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre2', 2, ' areaempleado2')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre3', 3, 'areaempleado3')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre4', 4,' areaempleado4')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre5', 5, 'areaempleado5')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre6', 6,' areaempleado6' )
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre7', 7, 'areaempleado7')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre8', 8, 'areaempleado8')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre9', 9, 'areaempleado9')
GO
INSERT INTO Empleado (nombre,telefono, areaempleado) values ('nombre10', 10, 'areaempleado10')
GO

----ENTREGA
INSERT INTO Entrega (direccion,fecha, nombre, idTipoTransporte, estatus) values ('direccion1', 04/12/2022, 'nombre1','1','1')
GO
INSERT INTO  Entrega (direccion, fecha, nombre, idTipoTransporte, estatus) values ('direccion2', 04/12/2022,'nombre2','2','2')
GO
INSERT INTO Entrega (direccion,fecha, nombre, idTipoTransporte, estatus) values ('direccion3', 04/12/2022, 'nombre3','3','3')
GO
INSERT INTO Entrega (direccion, fecha, nombre, idTipoTransporte, estatus) values ('direccion4', 04/12/2022, 'nombre4','4','4')
GO
INSERT INTO Entrega (direccion,fecha, nombre, idTipoTransporte, estatus) values ('direccion5', 04/12/2022, 'nombre5','5','5')
GO
INSERT INTO Entrega (direccion, fecha, nombre, idTipoTransporte, estatus) values ('direccion6', 04/12/2022, 'nombre6','6','6')
GO
INSERT INTO Entrega (direccion,fecha, nombre, idTipoTransporte, estatus) values ('direccion7', 04/12/2022, 'nombre7','7','7')
GO
INSERT INTO Entrega (direccion, fecha, nombre, idTipoTransporte, estatus) values ('direccion8', 04/12/2022, 'nombre8','8','8')
GO
INSERT INTO Entrega (direccion,fecha, nombre, idTipoTransporte, estatus) values ('direccion9', 04/12/2022, 'nombre9','9','9')
GO
INSERT INTO  Entrega (direccion, fecha, nombre, idTipoTransporte, estatus) values ('direccion10', 04/12/2022, 'nombre10','10','10')
GO

-----ENVIO

INSERT INTO Envio (direccion, numero) values ('direccion1', 'numero1')
GO
INSERT INTO Envio (direccion, numero) values ('direccion2', 'numero2' )
GO
INSERT INTO Envio (direccion, numero) values ('direccion3', 'numero3')
GO
INSERT INTO Envio (direccion, numero) values ('direccion4', 'numero4' )
GO
INSERT INTO Envio (direccion, numero) values ('direccion5', 'numero5')
GO
INSERT INTO Envio (direccion, numero) values ('direccion6', 'numero6' )
GO
INSERT INTO Envio (direccion, numero) values ('direccion7', 'numero7')
GO
INSERT INTO Envio (direccion, numero) values ('direccion8', 'numero8' )
GO
INSERT INTO Envio (direccion, numero) values ('direccion9', 'numero9')
GO
INSERT INTO Envio (direccion, numero) values ('direccion10', 'numero10' )
GO

-----ESTACIONAMIENTO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente1', 'estacionamientoempleado1')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente2', 'estacionamientoempleado2')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente3', 'estacionamientoempleado3')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente4', 'estacionamientoempleado4')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente5', 'estacionamientoempleado5')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente6', 'estacionamientoempleado6')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente7', 'estacionamientoempleado7')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente8', 'estacionamientoempleado8')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente9', 'estacionamientoempleado9')
GO
INSERT INTO Estacionamiento (estacionamientocliente, estacionamientoempleado) values ('estacionamientocliente10', 'estacionamientoempleado10')
GO

----------factura
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura1', 04/12/2022,'nombrefactura1')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura2', 04/12/2022,'nombrefactura2 ')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura3', 04/12/2022,'nombrefactura3')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura4', 04/12/2022,'nombrefactura4')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura5', 04/12/2022,'nombrefactura5')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura6', 04/12/2022,'nombrefactura6')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura7', 04/12/2022,'nombrefactura7')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura8', 04/12/2022,'nombrefactura8')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura9', 04/12/2022,'nombrefactura9')
GO
INSERT INTO Factura (foliofactura, fechafactura, nombrefactura) values ('foliofactura10', 04/12/2022,'nombrefactura10')
GO

------HORARIO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO
INSERT INTO Horario (horaentrada, horasalida) values ('8:10', '8:00')
GO

------------INVENTARIO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado1', 04/12/2022, 'tipoinventario','1','1')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus)values ('personalinventario2', 04/12/2022, 'tipoinventario2','2','2')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado3', 04/12/2022, 'tipoinventario3','3','3')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado4', 04/12/2022, 'tipoinventario4','4','4')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus)values ('personalinventario5', 04/12/2022, 'tipoinventario5','5','5')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado6', 04/12/2022, 'tipoinventario6','6','6')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado7', 04/12/2022, 'tipoinventario7','7','7')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus)values ('personalinventario8', 04/12/2022, 'tipoinventario8','8','8')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado9', 04/12/2022, 'tipoinventario9','9','9')
GO
INSERT INTO Inventario (personalencargado, fecha, tipoinventario, idBodega, estatus) values ('personalencargado10', 04/12/2022, 'tipoinventario10','10','10')
GO

---SUCURSAL 
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(1, 'numeroexterior1', 'direccion1', 'cp1')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(2, 'numeroexterior2', 'direccion2', 'cp2')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(3, 'numeroexterior3', 'direccion3', 'cp3')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(4, 'numeroexterior4', 'direccion4', 'cp4')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(5, 'numeroexterior5', 'direccion5', 'cp5')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(6, 'numeroexterior6', 'direccion6', 'cp6')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(7, 'numeroexterior7', 'direccion7', 'cp7')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(8, 'numeroexterior8', 'direccion8', 'cp8')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(9, 'numeroexterior9', 'direccion9', 'cp9')
GO
INSERT INTO Sucursal (telefono,numeroexterior, direccion, cp) values(10, 'numeroexterior10', 'direccion10', 'cp10')
GO

-----------MANTENIMIENTO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento1','personalmantenimiento1','1','1')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento2', 'personaldemantenimento2','2','2')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento3','personalmantenimiento3','3','3')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento4', 'personaldemantenimento4','4','4')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento5','personalmantenimiento5','5','5')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento6', 'personaldemantenimento6','6','6')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento7','personalmantenimiento7','7','7')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento8', 'personaldemantenimento8','8','8')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento9','personalmantenimiento9','9','9')
GO
INSERT INTO Mantenimiento (tipomantenimiento, personaldemantenimiento, idSucursal, estatus) values ('tipomantenimiento10', 'personaldemantenimento10','10','10')
GO

-----------REPRESENTANTE 
INSERT INTO Representante(nombre, telefono, direccion) values ('nombre1', 1 , 'direccion1')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre2', 2 , 'direccion2')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre3', 3 ,'direccion3')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre4', 4 ,  'direeccion4')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre5', 5 ,'direccion5')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre6', 6 , 'direccion6')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre7', 7 ,'direccion7')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre8', 8 ,'direccion8')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre9', 9 ,'direcccion9')
GO
INSERT INTO Representante (nombre, telefono, direccion) values ('nombre10', 10 , 'direccion10')
GO

-------------PROVEEDOR

INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre1', 1 , 'direccion1','1','1')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre2', 2 , 'direccion2','2','2')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre3', 3 , 'direccion3','3','3')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre4', 4 , 'direccion4','4','4')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre5', 5 , 'direccion5','5','5')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre6', 6 , 'direccion6','6','6')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre7', 7 , 'direccion7','7','7')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre8', 8 , 'direccion8','8','8')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre9', 9 , 'direccion9','9','9')
GO
INSERT INTO Proveedor (nombre, telefono, direccion,idSucursal, estatus) values ('nombre10', 10 , 'direccion10','10','10')
GO

-----PAGOSERVICIO

INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago1', 'servicio1', 1, 04/12/2022, '1','1')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago2', 'servicio2', 2, 04/12/2022,'2','2')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha ,idSucursal, estatus) values ('tipopago3', 'servicio3', 3, 04/12/2022,'3','3')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha ,idSucursal, estatus) values ('tipopago4', 'servicio4', 4, 04/12/2022,'4','4')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago5', 'servicio5', 5, 04/12/2022,'5','5')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago6', 'servicio6', 6, 04/12/2022,'6','6')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago7', 'servicio7', 7, 04/12/2022,'7','7')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago8', 'servicio8', 8, 04/12/2022,'8','8')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago9', 'servicio9', 9, 04/12/2022,'9','9')
GO
INSERT INTO PagoServicio (tipodepagoservicio, servicio, cantidad, fecha,idSucursal, estatus) values ('tipopago10', 'servicio10', 10, 04/12/2022, '10','10')
GO

-----MOBILIARIO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece1', 1,'1','1')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece2', 2,'2','2')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece3', 3,'3','3')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece4', 4,'4','4')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece5', 5,'5','5')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece6', 6,'6','6')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece7', 7,'7','7')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece8', 8,'8','8')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece9', 9,'9','9')
GO
INSERT INTO Mobiliario (areapertenece,cantida, idSucursal, estatus) values ('areapertenece10', 10,'10','10')
GO

------ZONA DESCARGA

INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (1,'1','1')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (2,'2','2')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (3,'3','3')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (4,'4','4')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (5,'5','5')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (6,'6','6')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (7,'7','7')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (8,'8','8')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (9,'9','9')
GO
INSERT INTO ZonaDescarga (horariodisponible, idBodega, estatus) values (10,'10','10')
GO

-------------MERCANCIA EXTRA

INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '1','1','1')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '2','2','2')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '3','3','3')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '4','4','4')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '5','5','5')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '6','6','6')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '7','7','7')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '8','8','8')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '9','9','9')
GO
INSERT INTO MercanciaExtra( fecha, tipomercancia, idBodega, estatus) values ('04/12/2022', '10','10','10')
GO

-----SINDICATO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato1')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato2')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato3')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato4')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato5')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato6')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato7')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato8')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato9')
GO
INSERT INTO Sindicato (nombresindicato) values ('nombresindicato10')
GO

--------------TIPOTRANSPORTE

INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer1', '04/12/2022', 1 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer2', '04/12/2022', 2 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer3', '04/12/2022', 3 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer4', '04/12/2022', 4 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer5', '04/12/2022', 5 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer6', '04/12/2022', 6 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer7', '04/12/2022', 7 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer8', '04/12/2022', 8 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer9', '04/12/2022', 9 )
GO
INSERT INTO  TipoTransporte (chofer, fechasalida,numero) values ('chofer10', '04/12/2022', 10 )
GO

---------------VIGILANCIA
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (1, '1', '1')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (2, '2','2')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (3,'3','3')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (4, '4','4')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (5, '5', '5')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (6,'6','6')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (7, '7','7')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (8, '8','8')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (9,'9','9')
GO
INSERT INTO Vigilancia (numeroguardia, idSucursal, estatus) values (10,'10','10')
GO

-----------MARCA
INSERT INTO  Marca (nombremarca) values ('nombremarca1')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarc2')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca3')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca4')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca5')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca6')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca7')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca8')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca9')
GO
INSERT INTO  Marca (nombremarca) values ('nombremarca10')
GO

-----------PUBLICIDAD
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad1','1','1')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad2','2','2')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad3','3','3')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad4','4','4')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad5','5','5')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad6','6','6')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad7','7','7')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad8','8','8')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad9','9','9')
GO
INSERT INTO Publicidad (fechapublicidad, tipopublicidad, idZapato, estatus) values ('04/12/2022', 'tipopublicidad10','10','10')
GO

-----------MATERIAPRIMA

INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion1', 'calidad1')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion2', 'calidad2')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion3', 'calidad3')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion4', 'calidad4')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion5', 'calidad5')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion6', 'calidad6')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion7', 'calidad7')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion8', 'calidad8')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion9', 'calidad9')
GO
INSERT INTO MateriaPrima (ubicacion, calidad) values ('ubicacion10', 'calidad10')
GO

-------------SECCION
INSERT INTO Seccion (nombreseccion) values ('nombreseccion1')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion2')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion3')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion4')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion5')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion6')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion7')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion8')
GO 
INSERT INTO Seccion (nombreseccion) values ('nombreseccion9')
GO
INSERT INTO Seccion (nombreseccion) values ('nombreseccion10')
GO

---------------MODELO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (100, 'numeromodelo1')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (200, 'numeromodelo2')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (300, 'numeromodelo3')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (400, 'numeromodelo4')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (500, 'numeromodelo5')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (600, 'numeromodelo6')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (700, 'numeromodelo7')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (800, 'numeromodelo8')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (900, 'numeromodelo9')
GO
INSERT INTO Modelo (preciomodelo, numeromodelo) values (1000, 'numeromodelo10')
GO

-----------ZAPATO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato1', '100')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato2', '200')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato3', '300')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato4', '400')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato5', '500')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato6', '600')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato7', '700')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato8', '800')
GO
INSERT INTO Zapato(tipozapato, precio) values ('tipozapato9', '900')
GO
INSERT INTO Zapato (tipozapato, precio) values ('tipozapato10', '1000')
GO


---------VENTA
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado1', 1,'1','1')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado2', 2,'2','2')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado3', 3,'3','3')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado4', 4,'4','4')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado5', 5,'5','5')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado6', 6,'6','6')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado7', 7,'7','7')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado8', 8,'8','8')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado9', 9,'9','9')
GO
INSERT INTO Venta (nombreempleado, folioventa, idZapato, estatus) values ('nombreempleado10', 10,'10','10')
GO

------------PEDIDOLINEA
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO
INSERT INTO PedidoLinea (fechapedido) values ('04/12/2022')
GO

----------REEMBOLSO

INSERT INTO Reembolso (cantidadreembolso) values (1)
GO
INSERT INTO Reembolso (cantidadreembolso) values (2)
GO
INSERT INTO Reembolso (cantidadreembolso) values (3)
GO
INSERT INTO Reembolso (cantidadreembolso) values (4)
GO
INSERT INTO Reembolso (cantidadreembolso) values (5)
GO
INSERT INTO Reembolso (cantidadreembolso) values (6)
GO
INSERT INTO Reembolso (cantidadreembolso) values (7)
GO
INSERT INTO Reembolso (cantidadreembolso) values (8)
GO
INSERT INTO Reembolso (cantidadreembolso) values (9)
GO
INSERT INTO Reembolso (cantidadreembolso) values (10)
GO


--TALLA

INSERT INTO Talla (idZapato, estatus) values ('1','1')
GO
INSERT INTO Talla (idZapato, estatus) values ('2','2')
GO
INSERT INTO Talla (idZapato, estatus) values ('3','3')
GO
INSERT INTO Talla (idZapato, estatus) values ('4','4')
GO
INSERT INTO Talla (idZapato, estatus) values ('5','5')
GO
INSERT INTO Talla (idZapato, estatus) values ('6','6')
GO
INSERT INTO Talla (idZapato, estatus) values ('7','7')
GO
INSERT INTO Talla ( idZapato, estatus) values ('8','8')
GO
INSERT INTO Talla ( idZapato, estatus) values ('9','9')
GO
INSERT INTO Talla (idZapato, estatus) values ('10','10')
GO

-------------TIPOFACTURACION
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (100, 04/12/2022,'1','1')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (200, 04/12/2022,'2','2')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (300, 04/12/2022,'3','3')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (400, 04/12/2022,'4','4')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (500, 04/12/2022,'5','5')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (600, 04/12/2022,'6','6')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (700, 04/12/2022,'7','7')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (800, 04/12/2022,'8','8')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (900,04/12/2022,'9','9')
GO
INSERT INTO TipoFacturacion (montofacturar, fechafacturacion, idFactura, estatus) values (1000, 04/12/2022,'10','10')
GO

------------------OFERTA

INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta1')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta2')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta3')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta4')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta5')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta6')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta7')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta8')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta9')
GO
INSERT INTO Oferta (fechaoferta, productoferta) values ('04/12/2022', 'productooferta10')
GO

--------------METODOPAGO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (1, 1)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (2,2)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (3,3)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (4,4)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (5,5)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (6,6)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (7,7)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (8,8)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (9,9)
GO
INSERT INTO MetodoPago (pagoefectivo, pagotarjeta) values (10,10)
GO

-------------PUESTO

INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto1', 'areapuesto1')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto2', 'areapuesto2')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto3', 'areapuesto3')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto4', 'areapuesto4')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto5', 'areapuesto5')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto6', 'areapuesto6')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto7', 'areapuesto7')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto8', 'areapuesto8')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto9', 'areapuesto9')
GO
INSERT INTO Puesto (nombrepuesto, areapuesto) values ('nombrepuesto10', 'areapuesto10')
GO

------------PRESTACION
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion1')
GO

INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion1')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion2')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion3')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion4')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion5')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion6')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion7')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion8')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion9')
GO
INSERT INTO Prestacion (tipoprestacion) values ('´tipoprestacion10')
GO
--------NOMINA
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina1', 'folionomina1')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina2', 'folionomina2')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina3', 'folionomina3')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina4', 'folionomina4')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina5', 'folionomina5')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina6', 'folionomina6')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina7', 'folionomina7')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina8', 'folionomina8')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina9', 'folionomina9')
GO
INSERT INTO Nomina (fechanomina, numeronomina, folionomina) values ('04/12/2022', 'numeronomina10', 'folionomina10')
GO

------------TICKET
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','1','1')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','2','2')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','3','3')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','4','4')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','5','5')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','6','6')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','7','7')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','8','8')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','9','9')
GO
INSERT INTO Ticket (fecha, idDevolucion, estatus) values ('04/12/2022','10','10')
GO

---------------VALE
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (100, '1','1')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (200,'2','2')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (300,'3','3')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (400,'4','4')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (500,'5','5')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (600,'6','6')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (700,'7','7')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (800,'8','8')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (900,'9','9')
GO
INSERT INTO Vale (cantidadvale, idCliente, estatus) values (1000,'10','10')
GO

-----------TIPO DE CALZADO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre1', 'calzadomujer1')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre2', 'calzadomujer2')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre3', 'calzadomujer3')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre4', 'calzadomujer4')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre5', 'calzadomujer5')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre6', 'calzadomujer6')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre7', 'calzadomujer7')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre8', 'calzadomujer8')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre9', 'calzadomujer9')
GO
INSERT INTO TipoCalzado(calzadohombre, calzadomujer) values ('calzadohonmbre10', 'calzadomujer10')
GO
-------------------SUCURSALDEPARTAMENTO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('1', '1', '1')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('2', '2', '2')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('3', '3', '3')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('4', '4', '4')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('5', '5', '5')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('6', '6', '6')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('7', '7', '7')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('8', '8', '8')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('9', '9', '9')
GO
INSERT INTO SucursalDepartamento(idSucursal,idDepartamento, estatus) values ('10', '10', '10')
GO

-------EMPLEADOPRESTACION
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('1', '1', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('2', '2', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('3', '3', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('4', '4', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('5', '5', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('6', '6', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('7', '7', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('8', '8', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('9', '9', '1')
GO
INSERT INTO EmpleadoPrestacion(idEmpleado, idPrestacion, estatus) values('10', '10', '1')
GO

----------------EMPLEADOHORARIO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('1', '1','1')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('2', '2','2')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('3', '3','3')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('4', '4','4')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('5', '5','5')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('6', '6','6')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('7', '7','7')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('8', '8','8')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('9', '9','9')
GO
INSERT INTO EmpleadoHorario (idEmpleado, idHorario, estatus) values ('10', '10','10')
GO

--------COTIZACIONCLIENTE
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion, estatus) values ('1', '1', 'productocotizacion1', '1')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion, estatus) values ('2', '2', 'productocotizacion2', '2')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion, estatus) values ('3', '3', 'productocotizacion3', '3')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion, estatus) values ('4', '4', 'productocotizacion4', '4')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion,  estatus) values ('5', '5', 'productocotizacion5', '5')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente,productocotizacion, estatus) values ('6', '6', 'productocotizacion6', '6')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion, estatus) values ('7', '7', 'productocotizacion7', '7')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente,productocotizacion , estatus) values ('8', '8', 'productocotizacion8', '8')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion ,estatus) values ('9', '9', 'productocotizacion9', '9')
GO
INSERT INTO CotizacionCliente (idCotizacion, idCliente, productocotizacion,  estatus) values ('10', '10', 'productocotizacion10', '10')
GO

----------COMPRA METODOPAGO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra, estatus) values ('1', '1', 04/12/2022, '1')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra, estatus) values ('2', '2',04/12/2022,'2')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago,fechacompra, estatus) values ('3', '3', 04/12/2022, '3')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago,fechacompra, estatus) values ('4', '4', 04/12/2022, '4')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago,fechacompra, estatus) values ('5', '5',04/12/2022, '5')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago,fechacompra, estatus) values ('6', '6', 04/12/2022, '6')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra,estatus) values ('7', '7',04/12/2022, '7')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra,estatus) values ('8', '8', 04/12/2022, '8')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra,estatus) values ('9', '9', 04/12/2022, '9')
GO
INSERT INTO CompraMetodoPago (idCompra, idMetodoPago, fechacompra,estatus) values ('10', '10', 04/12/2022, '10')
GO

---------COMPRAOFERTA
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('1','1','1')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('2','2','2')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('3','3','3')
GO	
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('4','4','4')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('5','5','5')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('6','6','6')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('7','7','7')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('8','8','8')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('9','9','9')
GO
INSERT INTO CompraOferta (idCompra, idOferta, estatus) values ('10','10','10')
GO

------------CLIENTEAPARTADO
INSERT INTO ClienteApartado (idCliente, idApartado,fechaapartado,  estatus) values ('1','1','1', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado, estatus) values ('2','2','2', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado, estatus) values ('3','3','3', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado, estatus) values ('4','4','4', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado,  estatus) values ('5','5','5', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado,fechaapartado,  estatus) values ('6','6','6', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado, estatus) values ('7','7','7', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado, fechaapartado, estatus) values ('8','8','8', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado,fechaapartado,  estatus) values ('9','9','9', 04/12/2022)
GO
INSERT INTO ClienteApartado (idCliente, idApartado,fechaapartado,  estatus) values ('10','10','10', 04/12/2022)
GO

-------------PEDIDOLINEAENVIO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio,  estatus) values ('1','1',04/12/2022, '1' )
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio, estatus) values ('2','2',04/12/2022,'2')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio,  estatus) values ('3','3',04/12/2022,'3')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio , estatus) values ('4','4',04/12/2022,'4')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio,  estatus) values ('5','5', 04/12/2022, '5')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio ,estatus) values ('6','6',04/12/2022,'6')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio,  estatus) values ('7','7',04/12/2022,'7')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio ,estatus) values  ('8','8',04/12/2022,'8')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio , estatus) values ('9','9',04/12/2022,'9')
GO
INSERT INTO PedidoLineaEnvio (idPedidoLinea, idEnvio, fechaenvio , estatus) values ('10','10',04/12/2022, '10')
GO

----------ENVIOTIPOTRANSPORTE
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio , estatus) values ('1','1', 04/12/2022, '1')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio ,estatus) values ('2','2', 04/12/2022, '2')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio,  estatus) values ('3','3', 04/12/2022, '3')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio,  estatus) values ('4','4', 04/12/2022, '4')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte,fechaenvio ,  estatus) values ('5','5', 04/12/2022, '5')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio, estatus) values ('6','6', 04/12/2022, '6')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte,fechaenvio , estatus) values ('7','7', 04/12/2022, '7')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte,fechaenvio , estatus) values ('8','8', 04/12/2022, '8')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio, estatus) values ('9','9', 04/12/2022, '9')
GO
INSERT INTO EnvioTipoTransporte (idEnvio, idTipoTransporte, fechaenvio,  estatus) values ('1','1', 04/12/2022, '10')
GO
----------ZAPATO MATERIAPRIMA
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('1','1','1' )
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('2','2','2')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('3','3','3')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('4','4','4')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('5','5','5')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('6','6','6')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('7','7','7')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('8','8','8')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('9','9','9')
GO
INSERT INTO ZapatoMateriaPrima (idZapato, idMateriaPrima, estatus) values ('10','10','10')
GO
---------ZAPATOTIPOCALZADO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('1','1','1')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('2','2','2')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('3','3','3')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('4','4','4')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('5','5','5')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('6','6','6')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('7','7','7')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('8','8','8')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('9','9','9')
GO
INSERT INTO ZapatoTipoCalzado (idZapato, idTipoCalzado, estatus) values ('10','10','10')
GO

----APARTADO
SELECT *FROM Apartado
UPDATE Apartado SET producto = 'Apartado1' WHERE idApartado = 1
GO
SELECT *FROM Apartado
--DELETE FROM Apartado WHERE idApartado = 1
GO
SELECT *FROM Apartado

----BODEGA
SELECT *FROM Bodega
UPDATE Bodega SET capacidad = 'Bodega1'  WHERE idBodega = 1
GO
SELECT *FROM Bodega 
--DELETE FROM Bodega WHERE idBodega = 1
GO
SELECT *FROM Bodega

---------CAJA
SELECT *FROM Caja
UPDATE Caja SET numerocaja = '2' WHERE idCaja = 2
GO
SELECT *FROM Caja
DELETE FROM Caja WHERE idCaja = 1
GO
SELECT *FROM Caja

------capacitacion

SELECT *FROM Capacitacion
UPDATE Capacitacion SET tipocapacitacion = 'tipocapacitacion1' WHERE idCapacitacion = 1
GO
SELECT *FROM Capacitacion
DELETE FROM Capacitacion WHERE idCapacitacion = 1
GO
SELECT *FROM Capacitacion

------cliente
SELECT *FROM Cliente
UPDATE Cliente SET clientegeneral = 'clientegeneral1' WHERE idCliente = 1
GO
SELECT *FROM Cliente
--DELETE FROM Cliente WHERE idCliente = 1
GO
SELECT *FROM Cliente

------COLECCION
SELECT *FROM Coleccion
UPDATE Coleccion SET nombrecoleccion = 'nombrecoleccion1' WHERE idColeccion = 1
GO
SELECT *FROM Coleccion
DELETE FROM Coleccion WHERE idColeccion = 1
GO
SELECT *FROM Coleccion

------------------------COMPRA
SELECT *FROM Compra
UPDATE Compra SET cantidadcompra = 1 WHERE idCompra = 1
GO
SELECT *FROM Compra
--DELETE FROM Compra WHERE idCompra = 1
GO
SELECT *FROM Compra

--------------CONTRATO
SELECT *FROM Contrato
UPDATE Contrato SET tipocontrato = 'tipocontrato1' WHERE idContrato = 1
GO
SELECT *FROM Contrato
DELETE FROM Contrato WHERE idContrato = 1
GO
SELECT *FROM Contrato

------------CORTECAJA

SELECT *FROM CorteCaja
UPDATE CorteCaja SET empleadocorte = 'empleadocorte1' WHERE idCorteCaja = 1
GO
SELECT *FROM CorteCaja 
DELETE FROM CorteCaja WHERE idCorteCaja = 1
GO
SELECT *FROM CorteCaja

------------COTIZACION
SELECT *FROM Cotizacion
UPDATE Cotizacion SET productocotizacion = 'productocotizacion1' WHERE idCotizacion = 1
GO
SELECT *FROM Cotizacion
DELETE FROM Cotizacion WHERE idCotizacion = 1
GO
SELECT *FROM Cotizacion

----------------CREDITO
SELECT *FROM Credito
UPDATE Credito SET montocredito = 1 WHERE idCredito = 1
GO
SELECT *FROM Credito
DELETE FROM Credito WHERE idCredito = 1
GO
SELECT *FROM Credito

----------------------DEPARTAMENTO

SELECT *FROM Departamento
UPDATE Departamento SET tipodepartamento = 'tipodepartamento1' WHERE idDepartamento = 1
GO
SELECT *FROM Departamento
--DELETE FROM Departamento WHERE idDepartamento = 1
GO
SELECT *FROM Departamento
-----------DEVOLUCION
SELECT *FROM Devolucion
UPDATE Devolucion SET producto = 'producto' WHERE idDevolucion = 1
GO
SELECT *FROM Devolucion
--DELETE FROM Devolucion WHERE idDevolucion = 1
GO
SELECT *FROM Devolucion
--------------------------EMPLEADO
SELECT *FROM Empleado
UPDATE Empleado SET areaempleado = 'areaempleado1' WHERE idEmpleado = 1
GO
SELECT *FROM Empleado
--DELETE FROM Empleado WHERE idEmpleado = 1
GO
SELECT *FROM Empleado
-------------------ENTREGA
SELECT *FROM Entrega
UPDATE Entrega SET direccion = 'direccion1' WHERE idEntrega = 1
GO
SELECT *FROM Entrega
DELETE FROM Entrega WHERE idEntrega = 1
GO
SELECT *FROM Entrega

--------------ENVIO
SELECT *FROM Envio
UPDATE Envio SET direccion = 'direccion1' WHERE idEnvio = 1
GO
SELECT *FROM Envio
--DELETE FROM Envio WHERE idEnvio = 1
GO
SELECT *FROM Envio

---------ESTACIONAMIENTO
SELECT *FROM Estacionamiento
UPDATE Estacionamiento SET estacionamientocliente = 'estacionamientocliente1' WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento
DELETE FROM Estacionamiento WHERE idEstacionamiento = 1
GO
SELECT *FROM Estacionamiento

------------FACTURA

SELECT *FROM Factura
UPDATE Factura SET foliofactura = 'foliofactura1' WHERE idFactura = 1
GO
SELECT *FROM Factura
--DELETE FROM Factura WHERE idFactura = 1
GO
SELECT *FROM Factura

---------Horario

SELECT *FROM Horario
UPDATE Horario SET horaentrada = 04/10/2022 WHERE idHorario = 1
GO
SELECT *FROM Horario
--DELETE FROM Horario WHERE idHorario = 1
GO
SELECT *FROM Horario

---------INVENTARIO
SELECT *FROM Inventario
UPDATE Inventario SET tipoinventario = 'tipoinventario' WHERE idInventario = 1
GO
SELECT *FROM Inventario
DELETE FROM Inventario WHERE idInventario = 1
GO
SELECT *FROM Inventario

-----MANTENIMIENTO
SELECT *FROM Mantenimiento
UPDATE Mantenimiento SET tipomantenimiento = 'tipomantenimiento' WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento
DELETE FROM Mantenimiento WHERE idMantenimiento = 1
GO
SELECT *FROM Mantenimiento
-------------------MARCA
SELECT *FROM Marca
UPDATE Marca SET nombremarca = 'nombreMarca1' WHERE idMarca = 1
GO
SELECT *FROM Marca
DELETE FROM Marca WHERE idMarca = 1
GO
SELECT *FROM Marca

----------MATERIAPRIMA
SELECT *FROM MateriaPrima
UPDATE MateriaPrima SET calidad = 'calidadMateriaPrima1' WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima
--DELETE FROM MateriaPrima WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima

------------MERCANCIAEXTRA
SELECT *FROM MateriaPrima
UPDATE MateriaPrima SET calidad = 'calidad' WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima
--DELETE FROM MateriaPrima WHERE idMateriaPrima = 1
GO
SELECT *FROM MateriaPrima

--------METODOPAGO
SELECT *FROM MetodoPago
UPDATE MetodoPago SET pagotarjeta = 1 WHERE idMetodoPago = 1
GO
SELECT *FROM MetodoPago
--DELETE FROM MetodoPago WHERE idMetodoPago = 1
GO
SELECT *FROM MetodoPago
----------MOBILIARIO
SELECT *FROM Mobiliario
UPDATE Mobiliario SET areapertenece = 'areapertenece1' WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario
DELETE FROM Mobiliario WHERE idMobiliario = 1
GO
SELECT *FROM Mobiliario
--------MODELO
SELECT *FROM Modelo
UPDATE Modelo SET numeromodelo = 'numeromodelo1' WHERE idModelo = 1
GO
SELECT *FROM Modelo
DELETE FROM Modelo WHERE idModelo = 1
GO
SELECT *FROM Modelo
-----NOMINA
SELECT *FROM Nomina
UPDATE Nomina SET folionomina = 'folionomina1' WHERE idNomina = 1
GO
SELECT *FROM Nomina
DELETE FROM Nomina WHERE idNomina = 1
GO
SELECT *FROM Nomina

-------------OFERTA
SELECT *FROM Oferta
UPDATE Oferta SET productoferta = 'productooferta1' WHERE idOferta = 1
GO
SELECT *FROM Oferta
--DELETE FROM Oferta WHERE idOferta = 1
--GO
SELECT *FROM Oferta

-------PAGOSERVICIO
SELECT *FROM PagoServicio
UPDATE PagoServicio SET servicio = 'tipopagoservicio1' WHERE idPagoServicio = 1
GO
SELECT *FROM PagoServicio
DELETE FROM PagoServicio WHERE idPagoServicio = 1
GO
SELECT *FROM PagoServicio

-----PEDIDOLINEA
SELECT *FROM PedidoLinea
UPDATE PedidoLinea SET fechapedido = 'fechapedido1' WHERE idPedidoLinea = 1
GO
SELECT *FROM PedidoLinea
--DELETE FROM PedidoLinea WHERE idPedidoLinea = 1
GO
SELECT *FROM PedidoLinea

-----PRESTACION
SELECT *FROM Prestacion
UPDATE Prestacion SET tipoprestacion = 'tipoprestacion1' WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion
--DELETE FROM Prestacion WHERE idPrestacion = 1
GO
SELECT *FROM Prestacion
---------PROVEEDOR
SELECT *FROM Proveedor
UPDATE Proveedor SET nombre = 'nombre1' WHERE idProveedor = 1
GO
SELECT *FROM Proveedor
DELETE FROM Proveedor WHERE idProveedor = 1
GO
SELECT *FROM Proveedor
-----------PUBLICIDAD
SELECT *FROM Publicidad
UPDATE Publicidad SET tipopublicidad = 'tipoPublicidad1' WHERE idPublicidad = 1
GO
SELECT *FROM Publicidad
DELETE FROM Publicidad WHERE idPublicidad = 1
GO
SELECT *FROM Publicidad
---------------PUESTO
SELECT *FROM Puesto
UPDATE Puesto SET nombrepuesto = 'nombrepuesto1' WHERE idPuesto = 1
GO
SELECT *FROM Puesto
DELETE FROM Puesto WHERE idPuesto = 1
GO
SELECT *FROM Puesto

---------REEMBOLSO
SELECT *FROM Reembolso
UPDATE Reembolso SET cantidadreembolso = 1 WHERE idReembolso = 1
GO
SELECT *FROM Reembolso
DELETE FROM Reembolso WHERE idReembolso = 1
GO
SELECT *FROM Reembolso

--------------REPRESENTANTE
SELECT *FROM Representante
UPDATE Representante SET direccion = 'direccion1' WHERE idRepresentante = 1
GO
SELECT *FROM Representante
DELETE FROM Representante WHERE idRepresentante = 1
GO
SELECT *FROM Representante

----------SECCION
SELECT *FROM Seccion
UPDATE Seccion SET nombreseccion = 'nombreseccion1' WHERE idSeccion = 1
GO
SELECT *FROM Seccion
DELETE FROM Seccion WHERE idSeccion = 1
GO
SELECT *FROM Seccion
---------SINDICATO
SELECT *FROM Sindicato
UPDATE Sindicato SET nombresindicato = 'nombresindicato1' WHERE idSindicato = 1
GO
SELECT *FROM Sindicato
DELETE FROM Sindicato WHERE idSindicato = 1
GO
SELECT *FROM Sindicato

-------------SUCURSAL
SELECT *FROM Sucursal
UPDATE Sucursal SET direccion = 'direccion1' WHERE idSucursal = 1
GO
SELECT *FROM Sucursal
--DELETE FROM Sucursal WHERE idSucursal = 1
GO
SELECT *FROM Sucursal


------------TICKET
SELECT *FROM Ticket 
UPDATE Ticket SET fecha = 04/12/2022 WHERE idTicket = 1
GO
SELECT *FROM Ticket
DELETE FROM Ticket WHERE idTicket = 1
GO
SELECT *FROM Ticket

------TIPOCALZADO
SELECT *FROM TipoCalzado 
UPDATE TipoCalzado SET calzadohombre = 'calzadohombre1' WHERE idTipoCalzado = 1
GO
SELECT *FROM TipoCalzado
--DELETE FROM TipoCalzado WHERE idTipoCalzado = 1
GO
SELECT *FROM TipoCalzado

--------TIPOFACTURA
SELECT *FROM TipoFacturacion
UPDATE TipoFacturacion SET  montofacturar = 1 WHERE idTipoFacturacion = 1
GO
SELECT *FROM TipoFacturacion
DELETE FROM TipoFacturacion WHERE idTipoFacturacion = 1
GO
SELECT *FROM TipoFacturacion

---------TIPOTRANSPORTE
SELECT *FROM Tipotransporte
UPDATE Tipotransporte SET  chofer = 'chofer1' WHERE idTipotransporte = 1
GO
SELECT *FROM Tipotransporte
--DELETE FROM Tipotransporte WHERE idTipotransporte = 1
GO
SELECT *FROM Tipotransporte
------------VALE
SELECT *FROM Vale
UPDATE Vale SET  cantidadvale = 1 WHERE idVale = 1
GO
SELECT *FROM Vale
DELETE FROM Vale WHERE idVale = 1
GO
SELECT *FROM Vale
---------VENTA
SELECT *FROM Venta
UPDATE Venta SET nombreempleado = 'nombreempleado1' WHERE idVenta = 1
GO
SELECT *FROM Venta
DELETE FROM Venta WHERE idVenta = 1
GO
SELECT *FROM Venta

-----VIGILANCIA
SELECT *FROM Vigilancia
UPDATE Vigilancia SET numeroguardia = 1 WHERE idVigilancia = 1
GO
SELECT *FROM Vigilancia
DELETE FROM Vigilancia WHERE idVigilancia = 1
GO
SELECT *FROM Vigilancia
--------ZAPATO
SELECT *FROM Zapato
UPDATE Zapato SET tipozapato = 'tipozapato1' WHERE idZapato = 1
GO
SELECT *FROM Zapato
--DELETE FROM Zapato WHERE idZapato = 1
GO
SELECT *FROM Zapato

--------ZONADESCARGA
SELECT *FROM ZonaDescarga
UPDATE ZonaDescarga SET horariodisponible = 1 WHERE idZonaDescarga = 1
GO
SELECT *FROM ZonaDescarga
DELETE FROM ZonaDescarga WHERE idZonaDescarga = 1
GO
SELECT *FROM ZonaDescarga


