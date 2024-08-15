Descripción del Proyecto de Análisis de Datos
Este repositorio contiene los scripts y datasets utilizados para el análisis de datos de inventario. El objetivo es realizar un análisis exploratorio de los datos (EDA) y preparar los datos para su carga y análisis en SQL Server (ELA).

Estructura de Archivos
/data: Contiene todos los archivos CSV utilizados en los análisis.
/scripts: Contiene scripts de Python para la limpieza y análisis de datos.
/docs: Documentación relacionada con el proyecto.
README.md: Descripción del proyecto, estructura y procesos de limpieza.
Descripción de los Datasets

Los datos están divididos en seis archivos CSV principales, con las siguientes características:


2017PurchasePricesDec.csv (Precio de Compras en Diciembre de 2017)

Filas: 12,261
Columnas: 9
Descripción de Columnas:
Brand: ID de la marca del producto.
Description: Descripción del producto.
Price: Precio de lista del producto.
Size: Tamaño del producto.
Volume: Volumen del producto.
Classification: Clasificación del producto.
PurchasePrice: Precio de compra del producto.
VendorNumber: Número del proveedor.
VendorName: Nombre del proveedor.


BegInvFINAL12312016.csv (Inventario Inicial al Final de 2016)
Filas: 206,529
Columnas: 9
Descripción de Columnas:
InventoryId: ID único del inventario.
Store: ID de la tienda.
City: Ciudad de la tienda.
Brand: ID de la marca.
Description: Descripción del producto.
Size: Tamaño del producto.
onHand: Unidades disponibles.
Price: Precio de venta.
startDate: Fecha de registro.


EndInvFINAL12312016.csv (Inventario Final al Final de 2016)
Filas: 224,489
Columnas: 9
Descripción de Columnas:
InventoryId: ID único del inventario.
Store: ID de la tienda.
City: Ciudad de la tienda.
Brand: ID de la marca.
Description: Descripción del producto.
Size: Tamaño del producto.
onHand: Unidades disponibles.
Price: Precio de venta.
endtDate: Fecha de registro.


InvoicePurchases12312016.csv (Compras con Factura al Final de 2016)
Filas: 5,543
Columnas: 10
Descripción de Columnas:
VendorNumber: Número del proveedor.
VendorName: Nombre del proveedor.
InvoiceDate: Fecha de la factura.
PONumber: Número de orden de compra.
PODate: Fecha de orden de compra.
PayDate: Fecha de pago.
Quantity: Cantidad comprada.
Dollars: Monto en dólares.
Freight: Costos de flete.
Approval: Aprobación de la compra.


PurchasesFINAL12312016.csv (Compras Finalizadas al Final de 2016)
Filas: 2,372,474
Columnas: 16
Descripción de Columnas: 
InventoryId: ID único del inventario.
Store: ID de la tienda.
Brand: ID de la marca.
Description: Descripción del producto.
Size: Tamaño del producto.
VendorNumber: Número del proveedor.
VendorName: Nombre del proveedor.
PONumber: Número de orden de compra.
PODate: Fecha de orden de compra.
ReceivingDate: Fecha de recepción.
InvoiceDate: Fecha de la factura.
PayDate: Fecha de pago.
PurchasePrice: Precio de compra.
Quantity: Cantidad comprada.
Dollars: Monto en dólares.
Classification: Clasificación del producto.


SalesFINAL12312016.csv (Ventas Finalizadas al Final de 2016)
Filas: 1,048,575
Columnas: 14
Descripción de Columnas:
InventoryId: ID único del inventario.
Store: ID de la tienda.
Brand: ID de la marca.
Description: Descripción del producto.
Size: Tamaño del producto.
SalesQuantity: Cantidad vendida.
SalesDollars: Ingresos por ventas.
SalesPrice: Precio de venta.
SalesDate: Fecha de venta.
Volume: Volumen del producto.
Classification: Clasificación del producto.
ExciseTax: Impuesto especial.
VendorNo: Número del proveedor.
VendorName: Nombre del proveedor.


Procedimientos de Limpieza Realizados
Los datos pasaron por varios procesos de limpieza para asegurar su calidad y precisión antes de su análisis:

Eliminación de Filas Duplicadas: Se revisaron y eliminaron las filas duplicadas en todos los datasets para asegurar la unicidad de los registros.
Tratamiento de Valores Nulos:
Se rellenaron los valores nulos en City con 'Desconocido' para mantener la integridad de los datos geográficos.
Se rellenaron los valores nulos en Approval con 'Frank Delahunt' asumiendo que todas las aprobaciones fueron realizadas por esta persona.
Corrección de Tipos de Datos: Se corrigieron los tipos de datos en columnas críticas como fechas y números para facilitar análisis posteriores.
Verificación de Consistencia: Se aseguró que los datos en columnas relacionadas fueran consistentes a lo largo de todos los datasets.
