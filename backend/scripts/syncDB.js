require('dotenv').config();
const { sequelize } = require("../models/index.model");

const syncDatabase = async () => {
    try {
        console.log("🔄 Sincronizando base de datos...");
        
        await sequelize.authenticate();
        console.log("✅ Conexión a DB establecida");
               
        await sequelize.sync({ alter: true });
        console.log("✅ Modelos sincronizados exitosamente");
        
        console.log("🎉 Sincronización completada");
        process.exit(0);
    } catch (error) {
        console.error("❌ Error durante la sincronización:", error);
        process.exit(1);
    }
};

syncDatabase();