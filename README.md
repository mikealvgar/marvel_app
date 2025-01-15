# marvel_app

## Responde las siguientes preguntas:


### 1.- ¿Qué es un widget?
    En Flutter nos podríamos referir a un widget como a un componente o bloque que en conjunto con otros bloques, pueden formar una interfaz interactiva o estatica dependiendo la aplicación. Pueden ser customizados o podemos crear nuestros propios widgets.

### 2.- Menciona 4 ejemplos de widgets nativos
    - Scaffold
    - ListView
    - Text
    - Column


### 3.- ¿Cómo ejecutar código nativo desde flutter?
    Para ejecutar código nativo desde flutter utilizamos MethodChannel que nos ayudara a comunicarnos con el código (Kotlin o Switf) para obtener la data que llega a través de este puente, poder utilizar sensores, la cámara u obtener información del dispotivo.

### 4.- ¿Qué es el gestor de estados? Menciona 2
    Una forma de gestionar el comportamiento de nuestra aplicación para hacerla reactiva y funcional (la forma más sencilla puede ser usando setState()).
    Podemos utilizar Provider o Getx dependiendo del proyecto.

### 5.- ¿Cómo aplicas la acción “ tap (click)” a un widget que no tiene esa acción?
    Se podría aplicar de dos formas:
        1. Utilizando GestureDetector que nos proporciona un método onTap.
        2. Utilizando un InkWell que también proporciona un método onTap y más métodos que podrían funcionar mejor en la web.

### 6.- ¿Que es una dependencia y como la instalas?
    Son paquetes desarrollados por otros desarrolladores en el mismo ecosistema que nos ayudan a construir aplicaciones más rápido sin tener que hacerlo desde cero; nosotros también podemos crear estás dependencias o plugins para aislar o reutilizar en varios proyectos alguna función.
    Para instalar debemos hacerlo en el archivo pubspec.yaml justo después de dependencies: y por default cupertino_icons o haciendo uso de pubspec_assist.



### 7 .- ¿Qué es “context (contexto)” y cómo funciona?
    El context o contexto de una aplicación es como un contenedor de información de toda nuestra aplicación que se transmite a través del arbol de pantallas o widgets desde el elemento principal al secundario, lo que permite a los widgets secundarios acceder a  un elemento del widget principal. Por ejemplo, acceder al tema de la aplicación, propiedades como colores, fuentes, tamaños de letra, tamaños de pantalla.


### 8.- ¿Cómo almacenar información en el dispositivo?
    Esto depende mucho del tipo de aplicación ya que en desarrollos donde se pretende sincronizar información para ser usada offline y con un gran número de datos es recomendable utilizar una base de datos local como SQLite, en aplicaciones pequeñas y no tan exigentes para consultar información podemos usar herramientas como local_storage o get_storage que nos proporciona un almacenamiento local con buen rendimiento tomando en cuenta que el volumen de datos no será elevado.


 ## Realiza el siguiente ejercicio, comparte la liga del repositorio de tu prueba.

1. Crear un proyecto nuevo que contendrá como pantalla inicial una lista y una pantalla secundaria donde se mostrará el detalle de cada ítem.

2. En la lista se deberá consumir una api pública para obtener los personajes de Marvel, la cual se encuentra en https://developer.marvel.com.

3. Deberán cargarse únicamente los primeros 20 personajes y deberán irse cargando de 10 en 10 a la lista conforme hagan scroll.

4. En la parte superior deberá tener un contador con el total de personajes y el número de personajes que se han cargado.

5. Al dar click en uno de los personajes deberá mostrar el detalle.

6. En la parte superior deberá tener también un buscador de personajes por nombre y este debe filtrar la lista.

7. En cada ítem de la lista deberá cargar la imagen, nombre y descripción de cada uno de los personajes.

8. Al obtener la información de la api se deberá almacenar localmente, y la lista deberá cargarse desde esa información guardada.

9. Se deberá usar Getx.


## Instalación

Para poder correr esta aplicación se require de Flutter 3.27.2
Correr el comando `` flutter pub get``

Para este proyecto se utilizo Getx como gestor de estado aprovechando sus caracteristicas como lo son la navegación, el consumo de servicios y con ayuda de una dependencia más ``get_storage`` el almacenamiento local.

El archivo .env contiene la api publica y la api privada, por fines practicos se quedara en el repositorio para pruebas, pero debería ser privada, agregando en su lugar solamente un template para que otros devs puedan agregar su propia ```Api_Key``` publica y ``Api_private``

## Estructura de proyecto
```
|-- lib
    |-- config
        |-- constants
            |-- enviroment.dart
    |-- core
        |-- network
            |-- api_marvel.dart
        |-- utils
            |-- constants.dart
            |-- utils.dart
    |-- data
        |-- models
            |-- personaje_model.dart
            |-- personajes_db_model.dart
        |-- provider
            |-- personaje_provider.dart
    |-- features
        |-- home
            |-- controller
            |-- pages
                |-- home_page.dart
            |-- widgets
                |-- buscador_contador.dart
                |-- personaje-item.dart
                |-- personaje-list.dart
        |-- personaje
            |-- controller
                |-- personaje_controller.dart
            |-- pages
                |-- personaje_page.dart
            |-- widgets
                |-- custom_sliverappbar.dart
                |-- personaje_detalle.dart
    |-- main.dart
```

