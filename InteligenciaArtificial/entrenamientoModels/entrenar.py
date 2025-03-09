# #CONSIDERACIONES:
# # 1) Asegúrate de que EL conjunto de datos sea lo suficientemente grande.
# #    Necesitas al menos steps_per_epoch * epochs
# # 2) recomienda convertir estas imágenes a formato RGBA

import os
import sys
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense, Dropout
from tensorflow.keras import backend as K

K.clear_session()

# Obtener la ruta del directorio actual
directorio_actual = os.path.dirname(os.path.abspath(__file__))
# Retroceder un directorio
directorio_padre = os.path.abspath(os.path.join(directorio_actual, os.pardir))

# Crear la ruta completa del dataSet
data_validacion = os.path.join(directorio_padre, 'data', 'validacion')
data_entrenamiento = os.path.join(directorio_padre, 'data', 'entrenamiento')

# determinar n* de clases
def contar_carpetas(ruta):
    try:
        carpetas = [nombre for nombre in os.listdir(ruta) if os.path.isdir(os.path.join(ruta, nombre))]
        return len(carpetas)
    except FileNotFoundError:
        print(f"La ruta {ruta} no existe.")
        return 0
n_carpetas = contar_carpetas(data_validacion) # numero de clases

# Hiperparámetros
clases = n_carpetas
epocas = 100
batch_size = 32

altura, longitud = 100, 100
filtrosConvl1 = 64  # Aumentamos el número de filtros
filtrosConvl2 = 128  # Aumentamos el número de filtros

tamano_filtro1 = (3, 3)
tamano_filtro2 = (2, 2)
tamano_pool = (2, 2)

# Generadores de imágenes
entrenamiento_datagen = ImageDataGenerator(
    rescale=1. / 255,
    shear_range=0.3,
    zoom_range=0.3,
    horizontal_flip=True
)
validacion_datagen = ImageDataGenerator(
    rescale=1. / 255
)
imagen_entrenamiento = entrenamiento_datagen.flow_from_directory(
    data_entrenamiento,
    target_size=(altura, longitud),
    batch_size=batch_size,
    class_mode='categorical'
) 
imagen_validacion = validacion_datagen.flow_from_directory(
    data_validacion,
    target_size=(altura, longitud),
    batch_size=batch_size,
    class_mode='categorical'
)

# Creación del modelo
cnn = Sequential()
cnn.add(Conv2D(filtrosConvl1, tamano_filtro1, padding='same', input_shape=(altura, longitud, 3), activation='relu'))
cnn.add(MaxPooling2D(pool_size=tamano_pool))
cnn.add(Conv2D(filtrosConvl2, tamano_filtro2, padding='same', activation='relu'))
cnn.add(MaxPooling2D(pool_size=tamano_pool))
cnn.add(Flatten())
cnn.add(Dense(256, activation='relu'))
cnn.add(Dropout(0.5))
cnn.add(Dense(clases, activation='softmax'))
cnn.compile(loss='categorical_crossentropy', optimizer=Adam(learning_rate=1e-6), metrics=['accuracy'])

# Entrenamiento del modelo
history = cnn.fit(imagen_entrenamiento, steps_per_epoch=len(imagen_entrenamiento), epochs=epocas, validation_data=imagen_validacion, validation_steps=len(imagen_validacion))

# Guardar el modelo
modelo_guardado = os.path.join(directorio_padre, 'modelos_create', 'stagingArea', 'models.h5')
pesos_guardados = os.path.join(directorio_padre, 'modelos_create', 'stagingArea', 'pesos.h5')

cnn.save(modelo_guardado)
cnn.save_weights(pesos_guardados)

print("MODELO CREADO EXITOSAMENTE")
