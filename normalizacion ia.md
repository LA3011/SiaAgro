# Eliminar Archivos (.x)
  > InteligenciaArtificial/data/entrenamiento/.x
  > InteligenciaArtificial/data/validacion/.x

  De lo contrario, si "NO SE ELIMINAN" y se llega agregar una etiqueta La IA empezara a dar fallas, 
  para solucionarlo se debe hacer lo siguiente. 
  
    1) Eliminar todas las Etiquetas <InteligenciaArtificial/data/validacion> y <InteligenciaArtificial/data/entrenamiento> 
    2) modificar manualmente el archivo <InteligenciaArtificial/inferenciasPredict/predecir_umbral.py> y debe quedar:
    
    ###> ./SiaAgro/InteligenciaArtificial/inferenciasPredict/predecir_umbral.py: 

    # Comparar con el umbral
    if confianza_maxima < umbral: 
        return print('noReconocia')
    else:
        # -------------------  Inicializando ----------------------
        if respuesta == 'inicio': 
            return print('inicio')
        
        #elif respuesta == x:
        #    return print('x. ',confianza_maxima)

        # --------------------------------------------------------- 
        #{{elif}}
            #{{return}}

# Tener en Cuenta (models.h5 y pesos.h5)
  Son Invalidos para ejecutar una deteccion "Se debe agregar una nueva etiqueta, y someterlo a un entrenamiento para que genere models.h5 y pasos.h5 validos"

