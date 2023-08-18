import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, of, switchMap } from 'rxjs';
import { RecetaPulsera } from 'src/app/Interfaces/recetaPulsera';


@Injectable({
  providedIn: 'root'
})
export class RecetasService {

  private apiUrl = 'https://localhost:7239/api/RecetaPulseras'; // Actualiza la URL según la ubicación de tu API

  constructor(private http: HttpClient) { }

  getRecetas(): Observable<RecetaPulsera[]> {
    return this.http.get<RecetaPulsera[]>(this.apiUrl);
  }

  addReceta(receta: RecetaPulsera): Observable<RecetaPulsera> {
    return this.http.post<RecetaPulsera>(this.apiUrl, receta);
  }

  updateReceta(id: number, receta: RecetaPulsera): Observable<RecetaPulsera> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.put<RecetaPulsera>(url, receta);
  }

  deleteReceta(id: number): Observable<any> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.delete(url);
  }

  reactivarReceta(id: number): Observable<any> {
    return this.getReceta(id).pipe(
      switchMap((receta) => {
        if (receta) {
          receta.estatus = '1'; // Cambiar el estado a "1" (activo)
          return this.updateReceta(id, receta); // Actualizar la receta
        } else {
          throw new Error(`Receta con ID ${id} no encontrada.`);
        }
      }),
      catchError((error) => {
        console.error('Error al reactivar la receta:', error);
        return of(null); // Devolver un observable con valor null en caso de error
      })
    );
  }

  getReceta(id: number): Observable<RecetaPulsera | null> {
    const url = `${this.apiUrl}/${id}`;
    return this.http.get<RecetaPulsera>(url).pipe(
      catchError(() => {
        return of(null); // Devolver null si no se encuentra la receta
      })
    );
  }
}
