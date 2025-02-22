import { Component, OnInit } from '@angular/core';
import axios from 'axios';
import { UsersService } from 'src/app/services/users.service';

@Component({
  selector: 'app-cultivos',
  templateUrl: './cultivos.component.html',
  styleUrls: ['./cultivos.component.scss'],
})
export class CultivosComponent  implements OnInit {

  // Listado: Cultivos-Plaga
  listCultPlags:any

  // Form-Edit-Plaga: Nombre Plaga
  name_plaga:string = ''
  // Detect-Error: Form Plaga 
  error_name_plaga:boolean = false

  constructor(public usersService:UsersService) { }

  ngOnInit() {
    this.listCultivoPlaga()
  }
 

  historiCultivos:any
  async fetchupdateCultivoPlaga(id:number){


    const res:any = await axios.get(`${this.usersService.UrlfetchupdateCultivoPlaga(id)}`);
        
        this.historiCultivos = res.data
        // Mapear el array para formatear cada fecha
        this.historiCultivos = res.data.map( (resgistro:any) => {
          const fechaFormateada = resgistro.fecha_ultima_deteccion ? this.setFecha(resgistro.fecha_ultima_deteccion) : "Fecha no válida";
          return {
            ...resgistro,
            fecha_ultima_deteccion: fechaFormateada
          };
        });

    // await this.usersService.fetchupdateCultivoPlaga(id)
    // .subscribe(
      // (res:any) => {
      //   this.historiCultivos = res
      //   // Mapear el array para formatear cada fecha
      //   this.historiCultivos = res.map( (resgistro:any) => {
      //     const fechaFormateada = resgistro.fecha_ultima_deteccion ? this.setFecha(resgistro.fecha_ultima_deteccion) : "Fecha no válida";
      //     return {
      //       ...resgistro,
      //       fecha_ultima_deteccion: fechaFormateada
      //     };
      //   });
      // }
  // );
  }


  // Listar Cultivos + Plagas
  async listCultivoPlaga(){

    const res = await axios.get(`${this.usersService.UrlListCultivoPlaga()}`);
    this.listCultPlags = res.data    
    this.listCultPlags = this.listCultPlags.map((obj:any) => {
      return {
        ...obj,
        fecha_ultima_deteccion: this.formatDate(obj.fecha_ultima_deteccion)
      };
    });

    // await this.usersService.listCultivoPlaga()
    //   .subscribe(
    //     (res:any) => {
    //       this.listCultPlags = res
    //       console.log(this.listCultPlags)
    //       this.listCultPlags = this.listCultPlags.map((obj:any) => {
    //         return {
    //           ...obj,
    //           fecha_ultima_deteccion: this.formatDate(obj.fecha_ultima_deteccion)
    //         };
    //       });
    //     }
    // );
  } 

  // Setear Fechas: dd/mm/yy
  formatDate(dateString:any) {
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Los meses empiezan en 0
    const year = String(date.getFullYear()); // Obtener los últimos 2 dígitos del año
  
    return `${day}/${month}/${year}`;
  }
  // Retornar fecha de hoy 
  dateToday() {
    const now = new Date();
    const day = String(now.getDate()).padStart(2, '0');
    const month = String(now.getMonth() + 1).padStart(2, '0'); // Los meses empiezan en 0
    const year = now.getFullYear();
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const formattedDateTime = `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
    return formattedDateTime;
}


  // Form: Cultivo + Plaga
  async plaga_update(modalE:any, id_cultivo:number){
    if(!(this.name_plaga == "Sin Plagas")){
      this.name_plaga = this.pipeTextExample(this.name_plaga)   
    }

    // Verificar Caracteres Especiales
    const ErrorCarect = this.verificarCaracteresEspeciales(this.name_plaga) 
    if(ErrorCarect){
      this.error_name_plaga = true
    }else{
      this.error_name_plaga = false
    }

    if(this.name_plaga && (this.error_name_plaga == false)){
      // Data Formulario
      const data = {
        id: id_cultivo,
        nombre_plaga: this.name_plaga,
        fecha_ultima_deteccion: this.dateToday()
      } 

      const res = await axios.put(`${this.usersService.UrlUpdateCultivoPlaga(data.id)}`, data);
      this.listCultivoPlaga()
      console.log(res)
      // 
      this.error_name_plaga = false
      this.name_plaga = ""
      modalE.dismiss()


      // await this.usersService.updateCultivoPlaga(data.id, data)
      // .subscribe(
      //   (res:any) => {
      //     this.listCultivoPlaga()
      //     console.log(res)
      //     // ...
      //     this.error_name_plaga = false
      //     this.name_plaga = ""
      //     modalE.dismiss()
      //   }
      // );


    }else{
      this.error_name_plaga = true
    }
  }

  // Asignacion Text Lit
  TextsinPlagas(){
    this.name_plaga = "Sin Plagas"
  }

  // Pipe: Text 
  pipeTextExample(string:any) { 
    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
  }

  // Verificar Carecteres especiales
  verificarCaracteresEspeciales(entrada:any) { 
    const regex = /[^a-zA-Z0-9 ]/; 
    return regex.test(entrada); 
  }


  // Resetear Valores
  resetInput(){
    this.name_plaga = ""
    this.error_name_plaga = false

  }

  setFecha(dateString:any) {
      // Convertir la cadena de fecha a un objeto Date
      const date = new Date(dateString);
      
      // Extraer el día, mes y año
      const day = String(date.getUTCDate()).padStart(2, '0');
      const month = String(date.getUTCMonth() + 1).padStart(2, '0'); // Los meses empiezan en 0
      const year = date.getUTCFullYear();
      
      // Formatear la fecha como dd-mm-yyyy
      const formattedDate = `${day}-${month}-${year}`;
      
      return formattedDate;
  
  }


  
}



