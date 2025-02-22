import { Request, Response } from 'express';
import pool from '../database';

class ArtifyCancelController { 
    
  // Cancelar: ProcesoCMD entrenamiento.py
  public async killProcess(req: Request, res: Response) {
    try {
        const { exec } = require('child_process');                                    // Uso: Modulo, para crear y controlar procesos secundarios.
        const procesoAEliminar = 'python.exe';                                     // Nombre Proceso
        await exec(`taskkill /F /IM ${procesoAEliminar}`);                            // Ejecuta el comando para detener el proceso
        res.json({ message: `Proceso ${procesoAEliminar} detenido correctamente` });  // Envía una respuesta al cliente
        
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