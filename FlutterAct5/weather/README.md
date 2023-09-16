
# Aplicación del clima - Flutter

### Descripción:
------------
Una sencilla aplicación basada en Flutter que proporciona actualizaciones meteorológicas en tiempo real basadas en la ubicación actual del usuario o una ciudad que el usuario busque. La aplicación utiliza la API de OpenWeatherMap para la recuperación de datos meteorológicos.

### Características:
---------
1. Obtiene y muestra datos meteorológicos de la ubicación actual del usuario mediante IP.
2. Permite a los usuarios buscar datos meteorológicos por ciudad.
3. Proporciona una opción para actualizar los datos meteorológicos de la ubicación actual.
4. Muestra la temperatura en grados Celsius y un emoji relevante según la condición meteorológica.

### Uso:
------
1. Lanza la aplicación.
2. La aplicación se cargará y obtendrá los datos meteorológicos de tu ubicación actual.
3. La página principal muestra el nombre de la ciudad, la temperatura actual y un emoji que representa el clima.
4. Usa el botón de actualizar en la esquina superior izquierda para refrescar los datos meteorológicos de la ubicación actual.
5. Usa el botón de búsqueda en la esquina superior derecha para navegar a la página de búsqueda. Ingresa el nombre de una ciudad y presiona el botón de búsqueda para obtener y ver los datos meteorológicos de la ciudad elegida.

### Dependencias:
-------------
- SDK de Flutter
- Paquete http para llamadas API
- flutter_spinkit para la animación de carga

### APIs utilizadas:
----------
- OpenWeatherMap para datos meteorológicos
- IPinfo.io para obtener la ciudad actual basada en IP

### Configuración:
------
1. Clona el repositorio.
2. Navega al directorio del proyecto y ejecuta `flutter pub get`.
3. Asegúrate de haber configurado un emulador o de tener un dispositivo físico conectado.
4. Ejecuta `flutter run` para lanzar la aplicación.
