const { DataTypes } = require("sequelize");
const sequelize = require("../config/database");

const Cliente = sequelize.define(
  "Cliente",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      allowNull: false,
      unique: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    telefono: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
      validate: {
        isEmail: true,
      },
    },
    contrasena: {
      type: DataTypes.STRING,
      allowNull: true,
    },
    googleId: {
      // Campo para almacenar el ID único de Google
      type: DataTypes.STRING,
      allowNull: true,
      unique: true,
    },
    authProvider: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: "local",
    },
  },
  {
    tableName: "clientes",

    timestamps: true,
  }
);

module.exports = Cliente;
