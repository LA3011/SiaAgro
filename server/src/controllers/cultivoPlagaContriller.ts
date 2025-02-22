import { Request, Response } from 'express';
import pool from '../database';

class CultivoPlagaController { 

    public async getList(req: Request, res: Response) {
        try {
            // const cultivoPlaga = await pool.query(`SELECT cultivo_plaga.*, cultivos.* FROM cultivo_plaga INNER JOIN cultivos ON cultivo_plaga.id = cultivos."ID"`);
            const cultivoPlaga = await pool.query(`SELECT DISTINCT ON (cultivo_plaga.id) cultivo_plaga.*, cultivos.*
FROM cultivo_plaga
INNER JOIN cultivos ON cultivo_plaga.id = cultivos."ID"
WHERE cultivo_plaga.fecha_ultima_deteccion = (
    SELECT MAX(sub_cultivo_plaga.fecha_ultima_deteccion)
    FROM cultivo_plaga AS sub_cultivo_plaga
    WHERE sub_cultivo_plaga.id = cultivo_plaga.id
)
ORDER BY cultivo_plaga.id, cultivo_plaga.fecha_ultima_deteccion DESC;

                `);
            
            res.json(cultivoPlaga.rows)

        } catch (error) {
            // Retorno: Msj Error Servidor / Petición
            res.status(500).json({ error: 'Error interno del servidor: Cultivo/Plaga' });            
        }
    } 

    public async getHistory(req: Request, res: Response){
        try {
            const {id} = req.params

            // const cultivoPlaga = await pool.query(`SELECT cultivo_plaga.*, cultivos.* FROM cultivo_plaga INNER JOIN cultivos ON cultivo_plaga.id = cultivos."ID"`);
            const cultivoPlaga = await pool.query(`
                SELECT cultivo_plaga.*, cultivos.*
                FROM cultivo_plaga
                INNER JOIN cultivos ON cultivo_plaga.id = cultivos."ID"
                WHERE cultivo_plaga.id = '${Number(id)}'
                ORDER BY cultivo_plaga.fecha_ultima_deteccion DESC;
            `);
            
            res.json(cultivoPlaga.rows)

        } catch (error) {
            // Retorno: Msj Error Servidor / Petición
            res.status(500).json({ error: 'Error interno del servidor: Cultivo/Plaga' });            
        }
    }

    public async getOne(req: Request, res: Response){
        try {
            const {id} = req.params
            const OnecultivoPlaga = await pool.query(`SELECT cultivo_plaga.*, cultivos.* FROM cultivo_plaga INNER JOIN cultivos ON cultivo_plaga.id = cultivos."ID" WHERE cultivos.espacio = '${id}' ORDER BY cultivo_plaga.fecha_ultima_deteccion DESC LIMIT 1`);
            res.json(OnecultivoPlaga.rows[0])

        } catch (error) {
            // Retorno: Msj Error Servidor / Petición
            res.status(500).json({ error: 'Error interno del servidor: Detalles Cultivo/Plaga' });
            
        }
    }

    public async update(req: Request, res: Response){
        try {
            const {id} = req.params
            const data = req.body

            if(data.nombre_plaga == "Sin Plagas"){
                data.nombre_plaga = "" 
            }
            console.log(id)
            console.log(data.nombre_plaga)

            // const UpdatePlaga = await pool.query(`UPDATE cultivo_plaga SET nombre_plaga='${data.nombre_plaga}', fecha_ultima_deteccion='${data.fecha_ultima_deteccion}' WHERE id = ${Number(id)}`)
            const insertPlaga = await pool.query(`INSERT INTO cultivo_plaga (id, nombre_plaga, fecha_ultima_deteccion) VALUES (${Number(id)}, '${data.nombre_plaga}', '${data.fecha_ultima_deteccion}');`)
            res.json(id)

        } catch (error) {
            // Retorno: Msj Error Servidor / Petición
            res.status(500).json({ error: 'Error interno del servidor: Actualizar Cultivo/Plaga' });
            
        }
    }
    

}
const cultivoPlagaController = new CultivoPlagaController;
export default cultivoPlagaController;