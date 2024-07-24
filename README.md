
# Postgre-Database-TIC

## Descripción del Proyecto

En este proyecto, desarrollamos un sistema CRM (Customer Relationship Management) para una organización. Integraremos una base de datos con una cantidad significativa de datos generados usando Faker, con el objetivo de ofrecer una propuesta sólida de gestión de clientes para la organización.

## Características

- **Gestión de contactos**: Añade, edita y elimina información de contacto.
- **Seguimiento de interacciones**: Registra y visualiza interacciones con los clientes.
- **Historial de actividades**: Consulta actividades pasadas con clientes.
- **Gestión de ventas**: Realiza un seguimiento del progreso de ventas.
- **Automatización básica**: Automatiza tareas repetitivas para mejorar la eficiencia.
- **Reporting básico**: Genera informes básicos para el análisis de datos.

## Tecnologías Utilizadas

- **Backend**: Node.js, Express
- **Base de Datos**: PostgreSQL
- **Frontend**: JavaScript
- **Otras Librerías**: 
  - **Faker**: Generación de datos ficticios
  - **Boom**: Manejo de errores HTTP
  - **Pool**: Conexión a la base de datos PostgreSQL

## Instalación

Sigue los siguientes pasos para instalar y configurar el proyecto en tu entorno local:

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/tu-usuario/Postgre-Database-TIC.git
   cd Postgre-Database-TIC
   ```

2. **Instalar Node.js**

   Visita el siguiente enlace para descargar e instalar Node.js:

   [Descargar Node.js](https://nodejs.org/)

3. **Instalar PostgreSQL**

   Visita el siguiente enlace para descargar e instalar PostgreSQL:

   [Descargar PostgreSQL](https://www.postgresql.org/download/)

4. **Instalar dependencias**

   Ejecuta el siguiente comando en la raíz del proyecto para instalar las dependencias necesarias:

   ```bash
   npm install
   ```

5. **Configurar la base de datos**

   Crea un archivo `.env` en la raíz del proyecto y configura tus variables de entorno. Asegúrate de incluir los detalles de conexión de la base de datos PostgreSQL:

   ```plaintext
   DB_HOST=localhost
   DB_USER=tu_usuario
   DB_PASSWORD=tu_contraseña
   DB_NAME=nombre_de_la_base_de_datos
   DB_PORT=5432
   ```

## Uso

Para iniciar el servidor, ejecuta el siguiente comando:

```bash
npm start
```

El servidor estará disponible en `http://localhost:3000`.

### Endpoints

- **GET /contacts**: Obtén una lista de contactos.
- **POST /contacts**: Crea un nuevo contacto.
- **PUT /contacts/:id**: Actualiza un contacto existente.
- **DELETE /contacts/:id**: Elimina un contacto.

## Contribución

Este es un proyecto universitario y no está abierto para contribuciones externas en este momento. Si deseas contribuir, por favor contacta a los autores del proyecto.

## Licencia

Este proyecto es privado y no está disponible para su distribución pública.

## Autores

- Juan Montes
- Alexis Este
- Verónica Chacón
- Manuel de León

## Pruebas

Para ejecutar pruebas, considera utilizar Mocha y Chai. A continuación, una configuración básica de ejemplo:

1. **Instalar Mocha y Chai**

   ```bash
   npm install mocha chai --save-dev
   ```

2. **Crear un archivo de prueba**

   Crea un archivo `test.js` en la raíz del proyecto y añade pruebas básicas:

   ```javascript
   const chai = require('chai');
   const expect = chai.expect;

   describe('Ejemplo de prueba', function() {
     it('Debería devolver verdadero', function() {
       expect(true).to.be.true;
     });
   });
   ```

3. **Ejecutar pruebas**

   Añade el siguiente script a tu archivo `package.json` para ejecutar las pruebas:

   ```json
   "scripts": {
     "test": "mocha test.js"
   }
   ```

   Luego, ejecuta las pruebas con el comando:

   ```bash
   npm test
   ```

## Documentación Adicional

- [Documentación de Node.js](https://nodejs.org/en/docs/)
- [Documentación de Express](https://expressjs.com/en/4x/api.html)
- [Documentación de PostgreSQL](https://www.postgresql.org/docs/)
- [Documentación de Pool](https://node-postgres.com/features/pooling)

### Estructura del Proyecto

```
|   db.js
|   package-lock.json
|   package.json
|   server.js
|
+---middlewares
|       error.handler.js       
|
\---src
    \---student
            controller.js
            queries.js
            routes.js
```

Esta estructura organiza el proyecto para una fácil navegación y gestión del código.

---