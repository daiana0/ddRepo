const express = require("express");
const router = express.Router();
const productosController = require("../controllers/productos.controller");
const mensajesController = require("../controllers/mensajes.controller");
const {
  uploadSingle,
  uploadMultiple,
} = require("../middleware/upload.middleware");

router.get("/", productosController.getProductos);

router.get("/:id", productosController.getProducto);

router.get("/:productoId/mensajes", mensajesController.getMensajesPorProducto);

router.post("/:productoId/mensajes", mensajesController.crearMensaje);

router.post("/", uploadMultiple, productosController.createProducto);

router.put("/:id", uploadMultiple, productosController.updateProducto);

router.delete("/:id", productosController.deleteProducto);

module.exports = router;
