USE [QuetzalliDB]
GO
/****** Object:  Table [dbo].[avisos]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avisos](
	[idavisos] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [nvarchar](45) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[nivelMinimoExistencias] [decimal](5, 0) NOT NULL,
	[prioridad] [int] NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_avisos_idavisos] PRIMARY KEY CLUSTERED 
(
	[idavisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avisos_insumos]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avisos_insumos](
	[idavisos_productos] [int] IDENTITY(1,1) NOT NULL,
	[idaviso] [int] NOT NULL,
	[idinsumos] [int] NOT NULL,
 CONSTRAINT [PK_avisos_insumos_idavisos_productos] PRIMARY KEY CLUSTERED 
(
	[idavisos_productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[avisos_productos]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[avisos_productos](
	[idavisos_productos] [int] IDENTITY(1,1) NOT NULL,
	[idaviso] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
 CONSTRAINT [PK_avisos_productos_idavisos_productos] PRIMARY KEY CLUSTERED 
(
	[idavisos_productos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[idbitacora] [int] IDENTITY(391,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[movimiento] [nvarchar](50) NOT NULL,
	[modulo] [nvarchar](50) NOT NULL,
	[observaciones] [nvarchar](max) NOT NULL,
	[fecha] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_bitacora_idbitacora] PRIMARY KEY CLUSTERED 
(
	[idbitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idcliente] [int] IDENTITY(24,1) NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_cliente_idcliente] PRIMARY KEY CLUSTERED 
(
	[idcliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[idEmpleados] [int] IDENTITY(1,1) NOT NULL,
	[rfc] [nvarchar](45) NOT NULL,
	[idPuesto] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
 CONSTRAINT [PK_empleado_idEmpleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horario]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horario](
	[idhorario] [int] IDENTITY(1,1) NOT NULL,
	[horaInicio] [datetime2](0) NOT NULL,
	[horaFin] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_horario_idhorario] PRIMARY KEY CLUSTERED 
(
	[idhorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insumo]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insumo](
	[idinsumo] [int] IDENTITY(8,1) NOT NULL,
	[nombreInsumo] [nvarchar](100) NOT NULL,
	[idProveedor] [int] NOT NULL,
	[idStock] [int] NOT NULL,
	[unidad] [nvarchar](10) NOT NULL,
	[precio] [real] NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_insumo_idinsumo] PRIMARY KEY CLUSTERED 
(
	[idinsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insumo_lote]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insumo_lote](
	[idproducto_lote] [int] IDENTITY(1,1) NOT NULL,
	[idInsumo] [int] NOT NULL,
	[idLote] [int] NOT NULL,
 CONSTRAINT [PK_insumo_lote_idproducto_lote] PRIMARY KEY CLUSTERED 
(
	[idproducto_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[librorecetas]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[librorecetas](
	[idlibroRecetas] [int] IDENTITY(14,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idInsumo] [int] NOT NULL,
	[cantidadInsumo] [real] NULL,
 CONSTRAINT [PK_librorecetas_idlibroRecetas] PRIMARY KEY CLUSTERED 
(
	[idlibroRecetas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lote]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lote](
	[idstockInsumo] [int] IDENTITY(1,1) NOT NULL,
	[noLote] [nvarchar](10) NOT NULL,
	[fechaCaducidad] [date] NOT NULL,
	[obesrvaciones] [nvarchar](max) NOT NULL,
	[fechaObtencion] [date] NOT NULL,
	[cantidad] [real] NOT NULL,
	[unidad] [nvarchar](5) NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_lote_idstockInsumo] PRIMARY KEY CLUSTERED 
(
	[idstockInsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mesa]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mesa](
	[idmesas] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](45) NOT NULL,
	[descripcion] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_mesa_idmesas] PRIMARY KEY CLUSTERED 
(
	[idmesas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_venta]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_venta](
	[idorden_venta] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NOT NULL,
	[fechaVenta] [datetime2](0) NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_orden_venta_idorden_venta] PRIMARY KEY CLUSTERED 
(
	[idorden_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_venta_producto]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_venta_producto](
	[idorden_venta_producto] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [real] NOT NULL,
	[unidad] [datetime2](0) NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
	[id_orden_venta] [int] NOT NULL,
	[idproducto] [int] NOT NULL,
 CONSTRAINT [PK_orden_venta_producto_idorden_venta_producto] PRIMARY KEY CLUSTERED 
(
	[idorden_venta_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[idPedidos] [int] IDENTITY(27,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[fechaPedido] [datetime2](0) NOT NULL,
	[fechaEntrega] [datetime2](0) NULL,
	[codigo] [int] NOT NULL,
	[estatus] [int] NOT NULL,
 CONSTRAINT [PK_pedido_idPedidos] PRIMARY KEY CLUSTERED 
(
	[idPedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido_producto]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido_producto](
	[idpedido_producto] [int] IDENTITY(19,1) NOT NULL,
	[cantidad] [real] NOT NULL,
	[unidad] [nvarchar](10) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idPedidos] [int] NOT NULL,
 CONSTRAINT [PK_pedido_producto_idpedido_producto] PRIMARY KEY CLUSTERED 
(
	[idpedido_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[idpersona] [int] IDENTITY(22,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[apellidoP] [nvarchar](100) NOT NULL,
	[apellidoM] [nvarchar](100) NOT NULL,
	[telefono] [nvarchar](45) NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_persona_idpersona] PRIMARY KEY CLUSTERED 
(
	[idpersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[idproductos] [int] IDENTITY(5,1) NOT NULL,
	[nombreProducto] [nvarchar](45) NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
	[foto] [nvarchar](max) NOT NULL,
	[costoProduccion] [real] NOT NULL,
	[precioVenta] [real] NOT NULL,
	[observaciones] [nvarchar](max) NOT NULL,
	[cantidad] [int] NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_producto_idproductos] PRIMARY KEY CLUSTERED 
(
	[idproductos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto_lote]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_lote](
	[idproducto_lote] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idLote] [int] NOT NULL,
 CONSTRAINT [PK_producto_lote_idproducto_lote] PRIMARY KEY CLUSTERED 
(
	[idproducto_lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idproveedor] [int] IDENTITY(6,1) NOT NULL,
	[nombreEmpresa] [nvarchar](45) NOT NULL,
	[nombreContacto] [nvarchar](45) NOT NULL,
	[correo] [nvarchar](45) NOT NULL,
	[telefono] [nvarchar](45) NOT NULL,
	[estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_proveedor_idproveedor] PRIMARY KEY CLUSTERED 
(
	[idproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puesto]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puesto](
	[idpuesto] [int] IDENTITY(1,1) NOT NULL,
	[nombrePuesto] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_puesto_idpuesto] PRIMARY KEY CLUSTERED 
(
	[idpuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservacion]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservacion](
	[idreservacion] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[idMesa] [int] NOT NULL,
	[idHorario] [int] NOT NULL,
 CONSTRAINT [PK_reservacion_idreservacion] PRIMARY KEY CLUSTERED 
(
	[idreservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(4,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_role_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[idstock] [int] IDENTITY(14,1) NOT NULL,
	[cantidadDisonible] [real] NOT NULL,
 CONSTRAINT [PK_stock_idstock] PRIMARY KEY CLUSTERED 
(
	[idstock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(24,1) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[rol] [nvarchar](max) NOT NULL,
	[active] [smallint] NULL,
	[confirmed_at] [datetime2](0) NULL,
 CONSTRAINT [PK_user_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [user$email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 19/07/2023 08:26:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[userId] [int] NULL,
	[roleId] [int] NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recetas_pulseras](
    [IdRecetaPulsera] [int] IDENTITY(1,1) NOT NULL,
    [Nombre] [nvarchar](max) NOT NULL,
    [Descripcion] [nvarchar](max) NOT NULL,
    [Foto] [nvarchar](max) NOT NULL,
    [CostoProduccion] [real] NOT NULL,
    [PrecioVenta] [real] NOT NULL,
    [Observaciones] [nvarchar](max) NOT NULL,
    [Estatus] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_recetas_pulseras_IdRecetaPulsera] PRIMARY KEY CLUSTERED 
(
    [IdRecetaPulsera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pulsera_material](
	[idPulseraMaterial] [int] IDENTITY(1,1) NOT NULL,
	[idRecetaPulsera] [int] NOT NULL,
	[idMaterial] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_pulsera_material_idPulseraMaterial] PRIMARY KEY CLUSTERED 
(
	[idPulseraMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO