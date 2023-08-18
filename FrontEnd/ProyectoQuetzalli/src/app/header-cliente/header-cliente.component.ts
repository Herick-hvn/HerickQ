import { Component, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { LandingPageClienteComponent } from '../landing-page-cliente/landing-page-cliente.component';
import { AuthService } from '../services/auth/auth.service';

@Component({
    selector: 'app-header-cliente',
    templateUrl: './header-cliente.component.html',
    styleUrls: ['./header-cliente.component.scss']
})
export class HeaderClienteComponent implements OnInit {
    public pushRightClass?: string;
    contador: any;
    producto?: any[]
    carrito2: any[]
    botton: boolean
    userEmail: string;
    userid: string;



    constructor(private authService: AuthService,public router: Router, private landing: LandingPageClienteComponent) {
        this.carrito2 = []
        this.botton = false
         // Recuperar el userEmail del local storage
         this.userEmail = localStorage.getItem('userEmail') || '';
         this.userid = localStorage.getItem('userid') || '';
         //alert(this.userid)

    }



    ngOnInit() {

        this.pushRightClass = 'push-right';
        setInterval(() => {
            this.contador = this.landing.contadorCarrito;
            //this.producto=this.landing.listaProductos;
        }, 2000);
    }

    ProductosCarrito() {
        this.carrito2 = this.landing.carrito
        if (this.carrito2.length > 0) {
            this.botton = true
        }
    }

    eliminarProductoCarrito(valor:any){
        this.landing.carrito = this.carrito2.filter(item => item.nombreProducto !== valor);
        this.carrito2 = this.landing.carrito
        if (this.carrito2.length == 0) {
            this.botton = false
        }
        this.contador=this.contador-1
        this.landing.contadorCarrito=this.contador
    }


    toggleSidebar() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle(this.pushRightClass);
    }

    rltAndLtr() {
        const dom: any = document.querySelector('body');
        dom.classList.toggle('rtl');
    }

    onLogout() {
        this.authService.logout();
        // Redirigir a la página de inicio de sesión después de cerrar sesión
        this.router.navigate(['/LoginComponent']);
    }

}
