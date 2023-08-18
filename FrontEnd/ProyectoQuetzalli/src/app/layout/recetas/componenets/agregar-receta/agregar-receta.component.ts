import { Component, OnInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { RecetasService } from 'src/app/services/recetas/recetas.service';
import { RecetaPulsera } from 'src/app/Interfaces/recetaPulsera';
import { Insumo } from 'src/app/Interfaces/Insumo';
import { InsumosService } from 'src/app/services/insumos/insumos.service';

@Component({
  selector: 'app-agregar-receta',
  templateUrl: './agregar-receta.component.html',
  styleUrls: ['./agregar-receta.component.scss']
})
export class AgregarRecetaComponent implements OnInit {
  mostrarFormularioInsumos: boolean = false; 

  listaInsumos: Insumo[] = []; // Lista de insumos disponibles
  nuevoInsumo: Insumo = { idinsumo: 0, nombreInsumo: '', idProveedor: 0, cantidad: 0, unidad: '', precio: 0, estatus: '1' };
  listaInsumosAgregados: Insumo[] = []; // Lista de insumos agregados

  constructor(
    private insumosService: InsumosService,
    private recetasService: RecetasService,
    public dialogRef: MatDialogRef<AgregarRecetaComponent>
  ) {}

  ngOnInit(): void {
    this.cargarListaInsumos();
  }

  cargarListaInsumos(): void {
    this.insumosService.getInsumos().subscribe(
      (insumos: Insumo[]) => {
        this.listaInsumos = insumos;
      },
      (error) => {
        console.error('Error al cargar la lista de insumos:', error);
      }
    );
  }

  agregarInsumo(): void {
    this.listaInsumosAgregados.push({ ...this.nuevoInsumo });
    this.limpiarInsumo();
  }

  limpiarInsumo(): void {
    this.nuevoInsumo = { idinsumo: 0, nombreInsumo: '', idProveedor: 0, cantidad: 0, unidad: '', precio: 0, estatus: '1' };
  }

  eliminarUltimoInsumo(): void {
    this.listaInsumosAgregados.pop();
  }

  calcularTotal(): void {
    let total = 0;
    for (const insumo of this.listaInsumosAgregados) {
      total += insumo.cantidad * insumo.precio;
    }
    alert(`Total: $${total.toFixed(2)}`);
  }

  crearReceta(): void {
    const nombre = (document.getElementById('nombre') as HTMLInputElement).value;
    const descripcion = (document.getElementById('descripcion') as HTMLTextAreaElement).value;
    const costoProduccion = parseFloat((document.getElementById('costoProduccion') as HTMLInputElement).value);
    const precioVenta = parseFloat((document.getElementById('precioVenta') as HTMLInputElement).value);

    const nuevaReceta: RecetaPulsera = {
      idRecetaPulsera: 0,
      nombre: nombre,
      descripcion: descripcion,
      foto: '', 
      costoProduccion: costoProduccion,
      precioVenta: precioVenta,
      observaciones: '', // Agrega tus observaciones aquí si es necesario
      estatus: '1', // Establecer el estatus como activo
    };

    this.recetasService.addReceta(nuevaReceta).subscribe(
      () => {
        alert('La receta se agregó correctamente');
        this.dialogRef.close();
      },
      (error) => {
        console.error('Error al agregar receta:', error);
        alert('No se pudo agregar la receta');
      }
    );
  }

  cancelar(): void {
    this.dialogRef.close();
  }

  formularioValido(): boolean {
    const nombre = (document.getElementById('nombre') as HTMLInputElement).value;
    const descripcion = (document.getElementById('descripcion') as HTMLTextAreaElement).value;
    const costoProduccion = parseFloat((document.getElementById('costoProduccion') as HTMLInputElement).value);
    const precioVenta = parseFloat((document.getElementById('precioVenta') as HTMLInputElement).value);

    return nombre && descripcion && !isNaN(costoProduccion) && !isNaN(precioVenta) ? true : false;
  }

  actualizarDatosInsumo(): void {
    const insumoSeleccionado = this.listaInsumos.find(insumo => insumo.idinsumo === this.nuevoInsumo.idinsumo);
    if (insumoSeleccionado) {
      if (typeof insumoSeleccionado.precio === 'number') {
        this.nuevoInsumo.precio = insumoSeleccionado.precio;
      } else {
        this.nuevoInsumo.precio = 0; // Valor por defecto si no es numérico
      }
      if (typeof insumoSeleccionado.unidad === 'string') {
        this.nuevoInsumo.unidad = insumoSeleccionado.unidad;
      } else {
        this.nuevoInsumo.unidad = ''; // Valor por defecto si no es una cadena
      }
    } else {
      this.nuevoInsumo.precio = 0;
      this.nuevoInsumo.unidad = '';
    }
  }
  
}
