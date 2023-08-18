import { Component, Input, TemplateRef } from '@angular/core';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';


@Component({
    selector: 'app-modal-agregar-pedido',
    templateUrl: './modal-agregar-pedido.component.html',
    styleUrls: ['./modal-agregar-pedido.component.scss']
})


/**
 * Nombre del archivo: ModalEditarProductosComponent
 * Descripción: Controlador del componente modal
 * Autor: Sarahi Calderon S.
 * Fecha de creación: 26/07/2023
 * Última modificación por: Sarahi Calderon S.
 * Fecha de última modificación: 26/07/2023
 */


export class ModalAgregarPedidoComponent {

    closeResult?: string;
    //editaProductos: PostProductos[]

    nombreProducto?: string;
    descripcion?: string;
    foto: string='';
    costoProduccion?: number;
    precioVenta?: number;
    observaciones?: string;
    cantidad?: number;
    estatus?: number;
    @Input() datosProducto: any;
CP: any;


    /*     "nombreProducto": "", 
        "descripcion": "",
        "foto": "string",
        "costoProduccion":,
        "precioVenta": ,
        "observaciones": "string",
        "idStock": ,
        "estatus": "string" */

    constructor(private modalService: NgbModal,) {



    }

    //Función para editar producto 
    public EditarProductoModal() {
        this.estatus = 1;
        const nombreArchivo = this.foto.replace(/^.*\\/, "");
        const rutaArchivo = 'assets/imagenesProductos/' + nombreArchivo;

        /*         this.editaProductos.push({
                    'nombreProducto': this.nombreProducto,
                    "descripcion": this.descripcion,
                    "foto": rutaArchivo,
                    "costoProduccion": this.costoProduccion,
                    "precioVenta": this.precioVenta,
                    "observaciones": this.observaciones,
                    "idStock": this.cantidad,
                    "estatus": this.estatus
                }); */

        /*         this.productos.EditarProducto(this.editaProductos, this.datosProducto.idproductos);
        
                this.nombreProducto = "";
                this.descripcion = "";
                this.foto = "";
                this.costoProduccion = 0;
                this.precioVenta = 0;
                this.observaciones = "";
                this.cantidad = 0;
                this.modalService.dismissAll();
            } */

        /*  
        
            private getDismissReason(reason: any): string {
                if (reason === ModalDismissReasons.ESC) {
                    return 'by pressing ESC';
                } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
                    return 'by clicking on a backdrop';
                } else {
                    return `with: ${reason}`;
                }
            }
         */

    }
    open(content: TemplateRef<any>) {
        this.modalService.open(content).result.then(
            (result) => {
                this.closeResult = `Closed with: ${result}`;
            },
            (reason) => {
                this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
            }
        );
    }

    private getDismissReason(reason: any): string {
        if (reason === ModalDismissReasons.ESC) {
            return 'by pressing ESC';
        } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
            return 'by clicking on a backdrop';
        } else {
            return `with: ${reason}`;
        }
    }

}
