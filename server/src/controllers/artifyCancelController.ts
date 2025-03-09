import { Request, Response } from 'express';
import pool from '../database';

class ArtifyCancelController { 
    
  // Cancelar: ProcesoCMD entrenamiento.py
  public async killProcess(req: Request, res: Response) {
    try {

          const { exec } = require('child_process'); // Módulo para crear y controlar procesos secundarios
          const path = require('path'); // Módulo para manejar y transformar rutas de archivo
          const os = require('os'); // Módulo para obtener información del sistema operativo
          const sistemaOperativo = os.platform(); // Determinar S.O en que se este ejecutando el cod.

          const procesoAEliminar = 'python.exe'; // Nombre del proceso en Windows
          const rutaRelativaProcesoAEliminar = path.join(__dirname, '..', '..', '..','InteligenciaArtificial', 'entrenamientoModels', 'entrenar.py'); // Ruta del proceso en Linux

          if (sistemaOperativo === 'win32') {
              // Código específico para Windows
              exec(`taskkill /F /IM ${procesoAEliminar}`, (error:any, stdout:any, stderr:any) => {
                  if (error) {
                      console.error(`Error al detener el proceso en Windows: ${stderr}`);
                      return;
                  }
                  // console.log(`Proceso ${procesoAEliminar} detenido correctamente en Windows`);
              });
          
          } else if (sistemaOperativo === 'linux') {
              // Código específico para Linux
              exec(`pkill -f "${rutaRelativaProcesoAEliminar}"`, (error:any, stdout:any, stderr:any) => {
                  if (error) {
                      console.error(`Error al detener el proceso en Linux: ${stderr}`);
                      return;
                  }
                  // console.log(`Proceso con ruta ${rutaRelativaProcesoAEliminar} detenido correctamente en Linux`);
              });
          
          } else {
              console.error('Sistema operativo no soportado');
          }

      res.json({ message: `Proceso detenido correctamente` }); // Envía una respuesta al cliente

        
    } catch (error) {
        res.status(500).json({ error: 'Error al detener el proceso' });               // Retorno: Msj Error Servidor / Petición

    }
  }

  // Verificación: Si se está Ejecutando otro Entrenamiento ( !No puede Haber mas de 1 Entrenamiento ) 
  public async verifyProcess(req: Request, res: Response){

    try{
    const ps = require('ps-node'); 
    ps.lookup({ command: 'Python', psargs: 'ux' }, function(err:any, resultList:any) {
        if (err) {
          throw new Error(err);                                                                   // Manejo: Errores durante la Verificaion
        }
        if(resultList){
          const command = "python";                                                                // Nombre 'command'
          const encontrado = resultList.some( (obj:any) => Object.values(obj).includes(command));  // Almacenar: Array Algun Proceso con ese nombre 'python' 
          if (encontrado) {
              res.json(true);                                                                      // Retorno: Valor Boolean 'Si encuentró un Proceso'
          } else {
              res.json(false);                                                                     // Retorno: Valor Boolean 'No encuentró un Proceso'
          }
        }else{
          res.json(false);
        }
    });
    }catch{
      res.status(500).json({ error: 'Error: Verificacion de Proceso' });               // Retorno: Msj Error Servidor / Petición
    }

    

  }



}
const artifyCancelController = new ArtifyCancelController;
export default artifyCancelController;
