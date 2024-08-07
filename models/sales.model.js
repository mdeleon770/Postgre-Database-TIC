// Importar Sequelize y la conexión a la base de datos
const { DataTypes } = require('sequelize');
const sequelize = require('../config/sequelize');

// Definir el modelo de ventas
const Sale = sequelize.define('Sale', {
  contactId: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'contacts', // Nombre de la tabla relacionada
      key: 'id', // Clave foránea que hace referencia al campo 'id' de la tabla 'contacts'
    },
  },
  product: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  amount: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  date: {
    type: DataTypes.DATE,
    allowNull: false,
    defaultValue: DataTypes.NOW, // Fecha por defecto a la fecha y hora actuales
  },
}, {
  timestamps: true,
  tableName: 'sales',
});

// Exportar el modelo
module.exports = Sale;

