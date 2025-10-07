const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const helmet = require("helmet");
const path = require("path");
const http = require("http");
const { Server } = require("socket.io");
require("dotenv").config();

const { errorHandler, notFound } = require("./middleware/errorHandler");
const { sequelize } = require("./models/index.model");

const PORT = process.env.PORT || 3000;

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin:
      process.env.NODE_ENV === "production"
        ? ["https://tu-dominio.com"]
        : ["http://localhost:5173", "http://localhost:5174"],
    credentials: true,
  },
});

app.use(
  helmet({
    crossOriginResourcePolicy: { policy: "cross-origin" },
  })
);

app.use(
  cors({
    origin:
      process.env.NODE_ENV === "production"
        ? ["https://tu-dominio.com"]
        : ["http://localhost:5173", "http://localhost:5174"],
    credentials: true,
  })
);
app.use((req, res, next) => {
  res.setHeader("Cross-Origin-Resource-Policy", "cross-origin");
  next();
});

app.use(morgan(process.env.NODE_ENV === "development" ? "dev" : "combined"));

app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ extended: true, limit: "10mb" }));

// Servir archivos estáticos desde la carpeta uploads
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.get("/health", (req, res) => {
  res.json({
    success: true,
    message: "API funcionando correctamente",
    timestamp: new Date().toISOString(),
    version: "1.0.0",
  });
});
const indexRoutes = require("./routes/index.routes");
app.use("/api", indexRoutes);

app.use(notFound);

app.use(errorHandler);

io.on("connection", (socket) => {
  console.log(`✅ Cliente conectado: ${socket.id}`);

  socket.on("joinProduct", (productId) => {
    socket.join(`product-${productId}`);
    console.log(`🔔 Cliente ${socket.id} se unió al producto ${productId}`);
  });

  socket.on("leaveProduct", (productId) => {
    socket.leave(`product-${productId}`);
    console.log(`👋 Cliente ${socket.id} salió del producto ${productId}`);
  });

  socket.on("newComment", async ({ productId, texto }) => {
    try {
      const { Mensaje, Producto } = require("./models/index.model");
      const { sendCommentNotification } = require("./config/email");

      const nuevoMensaje = await Mensaje.create({
        productoId: productId,
        texto,
        fecha: new Date(),
      });

      io.to(`product-${productId}`).emit("commentAdded", {
        data: nuevoMensaje,
      });
      console.log(`💬 Nuevo comentario en producto ${productId}`);

      if (process.env.EMAIL_USER && process.env.EMAIL_PASSWORD) {
        const producto = await Producto.findByPk(productId);

        if (producto) {
          const adminEmail = process.env.ADMIN_EMAIL || process.env.EMAIL_USER;

          await sendCommentNotification({
            productoNombre: producto.nombre,
            comentario: texto,
            adminEmail: adminEmail,
          });

          console.log(`📧 Notificación de email enviada a ${adminEmail}`);
        }
      } else {
        console.log("⚠️ Email no configurado. Notificación no enviada.");
      }
    } catch (error) {
      console.error("Error al guardar comentario:", error);
      socket.emit("commentError", { message: "Error al guardar comentario" });
    }
  });

  socket.on("disconnect", () => {
    console.log(`❌ Cliente desconectado: ${socket.id}`);
  });
});

app.set("io", io);

const initializeDatabase = async () => {
  try {
    console.log("🔄 Iniciando conexión a base de datos...");
    await sequelize.authenticate();
    console.log("✅ Conexión a DB - OK");

    console.log("✅ Saltando sincronización (datos existentes)");

    console.log("📚 Tablas definidas:", Object.keys(sequelize.models));

    console.log("🔍 Verificando datos existentes...");
    try {
      const {
        Producto,
        Categoria,
        Administrador,
      } = require("./models/index.model");
      const productosCount = await Producto.count();
      const categoriasCount = await Categoria.count();
      const adminCount = await Administrador.count();

      console.log(`📊 Datos existentes:`);
      console.log(`   - Productos: ${productosCount}`);
      console.log(`   - Categorías: ${categoriasCount}`);
      console.log(`   - Administradores: ${adminCount}`);
    } catch (countError) {
      console.error("⚠️ Error al contar registros:", countError.message);
      console.log("Esto puede indicar problemas en la estructura de tablas");
    }
  } catch (err) {
    console.error("❌ Error en conexión DB:");
    console.error("Mensaje:", err.message);
    console.error("Código:", err.code);
    console.error("Stack:", err.stack);
    process.exit(1);
  }
};

const startServer = async () => {
  await initializeDatabase();

  server.listen(PORT, () => {
    console.log(`🚀 Servidor iniciado en el puerto: ${PORT}`);
    console.log(`📍 Salud de la API: http://localhost:${PORT}/health`);
    console.log(`📖 API: http://localhost:${PORT}/api`);
    console.log(`🔌 WebSocket activado en puerto: ${PORT}`);
  });
};

startServer().catch((err) => {
  console.error("❌ Error al iniciar el servidor:", err);
  process.exit(1);
});
