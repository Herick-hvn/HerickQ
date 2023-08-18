import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { RecetasService } from 'src/app/services/recetas/recetas.service';
import { RecetaPulsera } from 'src/app/Interfaces/recetaPulsera';

@Component({
  selector: 'app-editar-receta',
  templateUrl: './editar-receta.component.html',
  styleUrls: ['./editar-receta.component.scss']
})
export class EditarRecetaComponent {
  selectedFile: File | null = null;
  rutaArchivo: string = ''; // Variable para almacenar la ruta de la imagen
  nombreArchivo: string = ''; // Variable para almacenar el nombre del archivo
  
  seleccionarFoto(event: any): void {
    this.selectedFile = event.target.files[0];
  
    if (this.selectedFile) {
      this.nombreArchivo = this.selectedFile.name; // Obtener el nombre del archivo
      this.rutaArchivo = 'assets/imagenesProductos/' + this.nombreArchivo; // Construir la ruta de la imagen
    }
  }

  receta: RecetaPulsera = {
    idRecetaPulsera: 0,
    nombre: '',
    descripcion: '',
    foto: this.rutaArchivo,
    costoProduccion: 0,
    precioVenta: 0,
    observaciones: '',
    estatus: '1'
  };

  constructor(
    private recetasService: RecetasService,
    public dialogRef: MatDialogRef<EditarRecetaComponent>,
    @Inject(MAT_DIALOG_DATA) public data: { recetaId: number }
  ) {
    this.obtenerReceta(data.recetaId);
  }

  obtenerReceta(id: number): void {
    this.recetasService.getReceta(id).subscribe(
      (receta: RecetaPulsera | null) => {
        if (receta !== null) {
          this.receta = receta;
        } else {
          console.error('No se pudo obtener la información de la receta.');
        }
      },
      (error) => {
        console.error('Error al obtener la información de la receta:', error);
      }
    );
  }

  guardarCambios(): void {
    this.recetasService.updateReceta(this.receta.idRecetaPulsera, this.receta).subscribe(
      () => {
        alert('Receta actualizada exitosamente');
        this.dialogRef.close();
      },
      (error) => {
        console.error('Error al actualizar receta:', error);
        alert('No se pudo actualizar la receta');
      }
    );
  }

  cancelar(): void {
    this.dialogRef.close();
  }

  formularioValido(): boolean {
    return this.receta.nombre && this.receta.descripcion && this.receta.foto && !isNaN(this.receta.costoProduccion) && !isNaN(this.receta.precioVenta) ? true : false;
  }
}
