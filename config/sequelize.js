// config/sequelize.js

// Importar Sequelize
const { Sequelize } = require('sequelize');

// Cargar variables de entorno desde el archivo .env
require('dotenv').config();

// Configurar la conexión a la base de datos con Sequelize
const sequelize = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  dialect: 'postgres', // Usamos el dialecto de PostgreSQL
  logging: false, // Desactiva el registro de SQL en la consola
  pool: {
    max: 5, // Número máximo de conexiones en el pool
    min: 0, // Número mínimo de conexiones en el pool
    acquire: 30000, // Tiempo máximo de espera para adquirir una conexión (en ms)
    idle: 10000 // Tiempo máximo que una conexión puede estar inactiva antes de ser liberada (en ms)
  },
});

// Probar la conexión a la base de datos
(async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexión exitosa a la base de datos con Sequelize.');
  } catch (error) {
    console.error('Error al conectar a la base de datos con Sequelize:', error);
  }
})();

// Exportar la instancia de Sequelize para usarla en otros módulos
module.exports = sequelize;
