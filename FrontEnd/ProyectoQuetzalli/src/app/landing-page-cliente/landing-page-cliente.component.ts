import { Component, Input } from '@angular/core';
import { Productos } from '../Interfaces/productos';
import { Pedido } from '../Interfaces/pedido';
import { ServiciosProductosService } from '../services/Productos/servicios-productos.service';
import { ServiciosPedidoService } from '../services/Pedido/servicios-pedido.service';




@Component({
  selector: 'app-landing-page-cliente',
  templateUrl: './landing-page-cliente.component.html',
  styleUrls: ['./landing-page-cliente.component.scss']
})
export class LandingPageClienteComponent {

  listaProductos: Productos[];
  carritoProductos: Productos[];
  imageWidth: number = 120;
  imageMargin: number = 30;
  contadorCarrito: number = 0;
  pedido: Pedido[]

  EntregaDate: string;
  PedidotDate: Date = new Date();
  pedidoDataFormat: string = this.PedidotDate.toISOString();

  randomCode?: string;
  carrito: any[];
  receivedValue?: string;

  constructor(private ServiceProductos: ServiciosProductosService, private Servicepedido: ServiciosPedidoService) {
    this.pedido = []
    this.listaProductos = [];
    this.CargarProductos()
    this.carritoProductos = []
    this.carrito=[]

    const oneDayInMilliseconds = 24 * 60 * 60 * 1000; // 1 día en milisegundos
    const nextDayTimestamp = this.PedidotDate.getTime() + oneDayInMilliseconds;
    this.EntregaDate = new Date(nextDayTimestamp).toISOString();


  }

  //Contador para icono de carrito
  incrementCounter(contador: number): number {
    return this.contadorCarrito = this.contadorCarrito + contador;
  }

  //Agregar Producto a carrito
  productoCarrito(producto: any): any {
    this.carrito.push(
      {
        "nombreProducto": producto.nombreProducto,
        "foto": producto.foto,
        "precioVenta": producto.precioVenta,
      }
    )
    return this.carrito;
  }

  //Función para cargar los productos
  public CargarProductos() {
    this.ServiceProductos.getProductos(`https://localhost:7239/api/Productos`).subscribe(respuesta => {
      let arrayRespuesta;
      arrayRespuesta = respuesta as any[];


      for (let i = 0; i < 50; i++) {//Se agregan los datos a la lista de productos
        if(arrayRespuesta[i].estatus == 1){
          const puntoIndex = arrayRespuesta[i].descripcion.indexOf('.');
          if (puntoIndex !== -1) {
            this.listaProductos.push({
              "idproductos": arrayRespuesta[i].idproductos,
              "nombreProducto": arrayRespuesta[i].nombreProducto,
              "descripcion": arrayRespuesta[i].descripcion.substring(0, puntoIndex + 1),
              "foto": arrayRespuesta[i].foto,
              "costoProduccion": arrayRespuesta[i].costoProduccion,
              "precioVenta": arrayRespuesta[i].precioVenta,
              "observaciones": arrayRespuesta[i].observaciones,
              "idStock": arrayRespuesta[i].idStock,
              "estatus": arrayRespuesta[i].estatus
            });
          }
        }
      }
    })
  }

  //Funcion para agregar PEDIDO al servidor
  agregarPedido(pedidoModal: any) {
    this.pedido = pedidoModal

    this.randomCode = this.generateRandomCode();
    const numeroCode = parseInt(this.randomCode);

    console.log(this.pedidoDataFormat, this.EntregaDate, this.randomCode)
    var stringPedido
    stringPedido = {
      "idPedidos": 0,
      "idCliente": 0,
      "fechaPedido": this.pedidoDataFormat,
      "fechaEntrega": this.EntregaDate,
      "codigo": numeroCode,
      "estatus": 1
    }
    const jsonPedido = JSON.stringify(stringPedido);


    this.Servicepedido.postPedido(`https://localhost:7239/api/Pedidos`, jsonPedido).subscribe(
      (respuesta) => {
        /*         this.showAlert = true;
                setTimeout(() => {
                  this.showAlert = false;
                  window.location.reload();
                }, 2000); */
      },
    );
  }

  generateRandomCode(): string {
    const length = 5; // Longitud del código
    let code = '';
    const characters = '0123456789';

    for (let i = 0; i < length; i++) {
      const randomIndex = Math.floor(Math.random() * characters.length);
      code += characters.charAt(randomIndex);
    }

    return code;
  }
}
