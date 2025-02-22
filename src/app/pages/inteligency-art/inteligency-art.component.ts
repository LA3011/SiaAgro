import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { UsersService } from 'src/app/services/users.service';
import { NgModel } from '@angular/forms';
import { ValidateService } from 'src/app/services/validate.service';


@Component({
  selector: 'app-inteligency-art',
  templateUrl: './inteligency-art.component.html',
  styleUrls: ['./inteligency-art.component.scss'],
})
export class InteligencyArtComponent  implements OnInit {

  // Modal-Asignacion Cultivos  
  btnCutivo:boolean = true;
  opcionUpdateCultPLaga:boolean = false
  confirmUpdateCultivo:boolean = false

  // color btn Fab
  colorFab:any = "medium"

  // Direccion IP
  ipAdress:any;

  // Carga Info. Usuario
  userPass = {};

  // Styles [btn, spinners, msj]
  statusImage = "Empezar Detección";
  buttonArtify = false;
  isDisabled = false;
  spinner2 = false; 
  spinner = false;

  // [InfoDeteccionIA, ControladorModalesIA] 
  dataSet:any
  dataSetModal:any
  messageTarget = '' 
  
  // manejo estado de los Inputs
  status = "";
  hidden = false;
  imageSrc!: any;
  selectedFile!: File;
  selectedImage: string = "";
  isDisabledPosicImag = false;
  
  // Controlador, Response Detecion
  isModalOpen:any

  // Controlador, Conexión APIs
  isModalOpenAPI=false
  
  constructor(
    private http: HttpClient, 
    public usersService:UsersService,
    public validateService:ValidateService
  ){}

  ngOnInit() {
    this.validateService.SessionRedirectOne('/login');     // Func. Validación [Redirecciona al no Estar Reg.]
    this.userPass = this.validateService.valSession().status; // Info. Estado-Usuarios
    console.log(`User Session: ${this.userPass}`);
    console.log(`User Data: ${this.validateService.valSession().data }`);

    this.listCultivoPlaga() // listar cultivos-Plagas
    this.ipAdress = this.usersService.AddressAPIs() + "/inteligencyArtificial"
  }
 
  // [Conexion API]
  handleModalDismiss() {
    this.isModalOpenAPI = false; // cerrar modal [Conexion API]
  }

  // Carga-Image Input
  onFileSelected(event: any) {
    this.status = "";
    this.selectedFile = <File>event.target.files[0];
    this.hidden = true;
    if (event.target.files && event.target.files[0]) {
      const file = event.target.files[0];
      const reader = new FileReader();
      reader.onload = e => this.imageSrc = reader.result;
      reader.readAsDataURL(file);
      this.buttonArtify = false;
    }
  }

  // Upload-Image-Server
  async uploadFile() {
    this.spinner2 = true;
    this.isDisabledPosicImag = true;
    const formData = new FormData();
    formData.append('fileImage', this.selectedFile);
    
    fetch(this.ipAdress, {
      method: 'POST',
      body: formData,
    })
    .then(response => {
        console.log('🟢 Preparing "Button" Detection 🤖');
        this.setReset();
        this.intelify();
    })
    .catch(error => {
      this.isModalOpenAPI = true;
      this.setReset();
      console.error('Error al subir la imagen:', error);
    });
    // await this.usersService.uploadFile(formData).subscribe(
    //   (res) => {
    //     console.log('Image Uploading successfully:', res);
    //     console.log('🟢 Preparing "Button" Detection 🤖');
    //     this.setReset();
    //     this.intelify();

    //   },(error) => {
    //     this.isModalOpenAPI = true;
    //     this.setReset();
    //     console.error('Error al subir la imagen:', error);
    //   }
    // );
  }

  // Inicializar btn DetecciónIA
  setReset(){
    this.spinner = false;
    this.spinner2 = false;
    this.isDisabledPosicImag = false;
    this.isDisabled = false;
    this.buttonArtify = true;
  }

  // Detection Imagen
  async intelify() {
    this.spinner = true;
    this.isDisabled = true;
    this.statusImage = "Detectar";
    await this.usersService.artify().subscribe(
        (res) => {
          this.messageTarget = res;
          this.setReset();
          this.test();
           
        },(erro) =>{
          console.error('Error al subir la imagen');
          this.isModalOpenAPI = true;
          this.setReset();
        }
    );
  }  

  // Modal-Response-Detecion
  test(){
    this.dataSetBD();
  }
  setOpen(isOpen: boolean) { 
    this.isModalOpen = isOpen;
  }
  async dataSetBD(){
    // Detection-Image-BD
    const dataSet = this.messageTarget
    await this.usersService.dataSetBD(dataSet)
      .subscribe(
        (res:any) => {
          if(res.msj){
            this.setOpen(true)
            return this.dataSetModal = false
          }
          this.dataSet = res;
          this.dataSetModal = true 

          // llamar func. Registro Deteccion
          this.optionsPlagaDetec()

          return this.setOpen(true) 



          // console.log(this.dataSet.rows[0]) // BaseData DataSet
        }
    );
  } 



  // Listado Cultivo-Plaga
  listCultPlags:any
  async listCultivoPlaga(){
    await this.usersService.listCultivoPlaga()
      .subscribe(
        (res:any) => {
          this.listCultPlags = res
        }
    );
  }

  // Select Cultivo - Plaga
  selectedCultPlag:any
  onSelectChangeCult(event: any) { 
    this.selectedCultPlag = event.detail.value; 

    const [nombre, espacio] = this.selectedCultPlag.split(" - ");
    const cultInfo = { 
      nombre: nombre.trim(),
      espacio: espacio.trim()
    }
    this.detailsCultivoPlaga(cultInfo.espacio)
  }

  // Detalle Cultivo-Plaga
  detailsCult:any = {
    fecha_ultima_deteccion: '--/--/--',
    nombre_plaga: '-----',
    status: '-----'
  }
  async detailsCultivoPlaga(idEspacio:string){
    await this.usersService.detailsCultivoPlaga(idEspacio)
      .subscribe(
        (res:any) => {
          this.detailsCult = res
          this.detailsCult.fecha_ultima_deteccion = this.formatDate(this.detailsCult.fecha_ultima_deteccion)
          if(this.detailsCult.nombre_plaga == ''){
            this.detailsCult.nombre_plaga = "Ninguna"
            this.detailsCult.status = 'Sin Plagas'
          }else{
            this.detailsCult.status = 'Afectado'
          }
          console.log(this.detailsCult)
        }
    );
  }

  // Actualizar por Deteccion
  optionsPlagaDetec(){
    if((this.opcionUpdateCultPLaga && this.confirmUpdateCultivo) && this.dataSet.rows[0].nombre){
      this.confirmUpdateCultivo = false
      this.updateDetecCult(this.dataSet.rows[0].nombre)
    }

  }
  async updateDetecCult(plaga:string){

    const plagaObj = {
      nombre_plaga:plaga,
      fecha_ultima_deteccion :this.dateToday()
    }

    // def. estado plaga
    if(!this.dataSet.rows[0].amenaza){
      plagaObj.nombre_plaga = "Libre de Plagas"
    }

    console.log(`${this.detailsCult.ID} - ${plagaObj.nombre_plaga}`)

    await this.usersService.updateCultivoPlaga(this.detailsCult.ID, plagaObj)
      .subscribe(
        (res:any) => {
          console.log(res)

          // Info Insert
          this.detailsCult.nombre_plaga = plagaObj.nombre_plaga
          if(this.detailsCult.nombre_plaga == ''){
            this.detailsCult.nombre_plaga = "Ninguna"
            this.detailsCult.status = 'Sin Plagas'
          }else{
            this.detailsCult.status = 'Afectado'
          }
          this.detailsCult.fecha_ultima_deteccion = this.dateToday()

          
        }
    );
  }


  changeBtnCutivo(){
    this.btnCutivo = false
    this.opcionUpdateCultPLaga = false
    this.colorFab = "medium";
    console.log('Actualizar por Deteccion: Cancelada')
  }
  changeBtnCutivoT(){
    this.btnCutivo = true
    console.log(this.selectedCultPlag)
  }


  // determinar fecha actual
  dateToday(){
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

  // Setear Fechas: dd/mm/yy
  formatDate(dateString:any) {
    const date = new Date(dateString);
    const day = String(date.getDate()).padStart(2, '0');
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Los meses empiezan en 0
    const year = String(date.getFullYear()); // Obtener los últimos 2 dígitos del año
  
    return `${day}/${month}/${year}`;
  }


}
