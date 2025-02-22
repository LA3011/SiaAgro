import numpy as np
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.keras.models import load_model

modelo='C:/Users/LaptopDell/Desktop/siaAgro/Proyecto/InteligenciaArtificial/modelos_create/models.h5'
pesos='C:/Users/LaptopDell/Desktop/siaAgro/Proyecto/InteligenciaArtificial/modelos_create/pesos.h5'

# Cargar el modelo previamente entrenado
modelo=load_model(modelo)

# Función para predecir con umbral de confianza
def predecir_con_umbral(imagen_path, umbral):
    # Cargar la imagen y prepararla para el modelo
    img = load_img(imagen_path, target_size=(100, 100))
    x = img_to_array(img)
    x = np.expand_dims(x, axis=0)
    
    # Hacer la predicción
    arreglo = modelo.predict(x)
    resultado = arreglo[0]
    respuesta = np.argmax(resultado)
    confianza_maxima = np.max(resultado)

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
        elif respuesta == 0:
            return print('Escarabajo')
        elif respuesta == 1:
            return print('Oidio')
        elif respuesta == 2:
            return print('Roya')
        elif respuesta == 3:
            return print('alternario')
        elif respuesta == 4:
            return print('chinche')
        #{{elif}}
            #{{return}}

# Ejemplo de uso
imagen_path = 'C:/Users/LaptopDell/Desktop/siaAgro/Proyecto/InteligenciaArtificial/imagesTest/imagenProcess.jpg'
umbral = 0.90  # 90% de confianza
predecir_con_umbral(imagen_path,umbral)