import os
import numpy as np
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.keras.models import load_model

# Obtener la ruta del directorio actual
directorio_actual = os.path.dirname(os.path.abspath(__file__))
# Retroceder un directorio
directorio_padre = os.path.abspath(os.path.join(directorio_actual, os.pardir))

# Crear la ruta completa de las imagen, models, pesos
modelo = os.path.join(directorio_padre, 'modelos_create', 'models.h5')
pesos = os.path.join(directorio_padre, 'modelos_create', 'pesos.h5')
imagen_path = os.path.join(directorio_padre, 'imagesTest', 'imagenProcess.jpg')

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
        #{{elif}}
            #{{return}}

umbral = 0.90  # 90% de confianza
predecir_con_umbral(imagen_path,umbral)
